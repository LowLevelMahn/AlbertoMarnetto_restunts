#include "shape3d.h"

extern struct RECTANGLE select_rect_rc;

short sintab[] = {
	0, 101, 201, 302, 402, 503, 603, 704, 804, 904, 1005, 1105, 1205, 1306, 1406, 1506, 1606, 1706, 1806, 1906, 2006, 2105, 2205, 2305, 2404, 2503, 2603, 2702, 2801, 2900, 2999, 3098, 3196, 3295, 3393, 3492, 3590, 3688, 3786, 3883, 3981, 4078, 4176, 4273, 4370, 4467, 4563, 4660, 4756, 4852, 4948, 5044, 5139, 5235, 5330, 5425, 5520, 5614, 5708, 5803, 5897, 5990, 6084, 6177, 6270, 6363, 6455, 6547, 6639, 6731, 6823, 6914, 7005, 7096, 7186, 7276, 7366, 7456, 7545, 7635, 7723, 7812, 7900, 7988, 8076, 8163, 8250, 8337, 8423, 8509, 8595, 8680, 8765, 8850, 8935, 9019, 9102, 9186, 9269, 9352, 9434, 9516, 9598, 9679, 9760, 9841, 9921, 10001, 10080, 10159, 10238, 10316, 10394, 10471, 10549, 10625, 10702, 10778, 10853, 10928, 11003, 11077, 11151, 11224, 11297, 11370, 11442, 11514, 11585, 11656, 11727, 11797, 11866, 11935, 12004, 12072, 12140, 12207, 12274, 12340, 12406, 12472, 12537, 12601, 12665, 12729, 12792, 12854, 12916, 12978, 13039, 13100, 13160, 13219, 13279, 13337, 13395, 13453, 13510, 13567, 13623, 13678, 13733, 13788, 13842, 13896, 13949, 14001, 14053, 14104, 14155, 14206, 14256, 14305, 14354, 14402, 14449, 14497, 14543, 14589, 14635, 14680, 14724, 14768, 14811, 14854, 14896, 14937, 14978, 15019, 15059, 15098, 15137, 15175, 15213, 15250, 15286, 15322, 15357, 15392, 15426, 15460, 15493, 15525, 15557, 15588, 15619, 15649, 15679, 15707, 15736, 15763, 15791, 15817, 15843, 15868, 15893, 15917, 15941, 15964, 15986, 16008, 16029, 16049, 16069, 16088, 16107, 16125, 16143, 16160, 16176, 16192, 16207, 16221, 16235, 16248, 16261, 16273, 16284, 16295, 16305, 16315, 16324, 16332, 16340, 16347, 16353, 16359, 16364, 16369, 16373, 16376, 16379, 16381, 16383, 16384, 16384
};

extern unsigned char atantable[];

short sin_fast(unsigned short s) {
	unsigned char c = s & 0xFF;
	switch ((s >> 8) & 3) {
		case 0:
			return sintab[c];
		case 1:
			return sintab[0x100 - c];
		case 2:
			return -sintab[c];
		case 3:
			return -sintab[0x100 - c];
	}
}

short cos_fast(unsigned short s) {
	return sin_fast(s + 0x100);
}

int polarAngle(int z, int y) {
	
	unsigned flag;
	int temp, result;
	
	flag = 0;
	
	if (z < 0) {
		flag |= 4;
		z = -z;
	}
	
	if (y < 0) {
		flag |= 2;
		y = -y;
	}
	
	if (z == y) {
		if (z == 0) return result; // orig code has undefined return value here as well!
		result = 0x80;
	} else {
		if (z > y) {
			temp = z;
			z = y;
			y = temp;
			flag |= 1;
		}
		
		result = atantable[(((unsigned long)z << 16) / y) >> 8];
	}
	
	switch (flag) {
		case 0:
			return result;
		case 1:
			return -result + 0x100;
		case 2:
			return -result + 0x200;
		case 3:
			return result + 0x100;
		case 4:
			return -result;
		case 5:
			return result - 0x100;
		case 6:
			return result - 0x200;
		case 7:
			return -(result + 0x100);
	}
	
}

int polarRadius2D(int z, int y) {
	long result;
	
	result = polarAngle(z, y);
	
	if (result < 0) {
		result = -result;
	}
	
	if (result >= 0x100) {
		result = -(result - 0x200);
	}
	
	if (result <= 0x80) {
		result = cos_fast(result);
		if (y < 0)
			y = -y;
		return (((unsigned long)y) << 14) / result;
	} else {
		result = sin_fast(result);
		if (z < 0)
			z = -z;
		return (((unsigned long)z) << 14) / result;
	}
}

int polarRadius3D(struct VECTOR* vec) {
	return polarRadius2D( polarRadius2D(vec->x, vec->y), vec->z );
}

unsigned rect_compare_point(struct POINT2D* pt) {
	char flag;
	if (pt->py < select_rect_rc.x2)
		flag = 1;
	else if (pt->py > select_rect_rc.y2)
		flag = 2; 
	else
		flag = 0;
	
	if (pt->px < select_rect_rc.x1)
		flag |= 4;
	else if (pt->px > select_rect_rc.y1)
		flag |= 8;
	return flag;
}

void mat_mul_vector(struct VECTOR* invec, struct MATRIX* mat, struct VECTOR* outvec) {

	if (mat->m._11 != 0 && invec->x != 0)
		outvec->x = ((long)mat->m._11 * invec->x) >> 14;
	else
		outvec->x = 0;

	if (mat->m._12 != 0 && invec->y != 0)
		outvec->x += ((long)mat->m._12 * invec->y) >> 14;

	if (mat->m._13 != 0 && invec->z != 0)
		outvec->x += ((long)mat->m._13 * invec->z) >> 14;


	if (mat->m._21 != 0 && invec->x != 0)
		outvec->y = ((long)mat->m._21 * invec->x) >> 14;
	else
		outvec->y = 0;

	if (mat->m._22 != 0 && invec->y != 0)
		outvec->y += ((long)mat->m._22 * invec->y) >> 14;

	if (mat->m._23 != 0 && invec->z != 0)
		outvec->y += ((long)mat->m._23 * invec->z) >> 14;


	if (mat->m._31 != 0 && invec->x != 0)
		outvec->z = ((long)mat->m._31 * invec->x) >> 14;
	else
		outvec->z = 0;

	if (mat->m._32 != 0 && invec->y != 0)
		outvec->z += ((long)mat->m._32 * invec->y) >> 14;

	if (mat->m._33 != 0 && invec->z != 0)
		outvec->z += ((long)mat->m._33 * invec->z) >> 14;

}

void mat_multiply(struct MATRIX* rmat, struct MATRIX* lmat, struct MATRIX* outmat) {
	int counter;
	int* rmatvals = rmat->vals;
	int* lmatvals = lmat->vals;
	int* outmatvals = outmat->vals;
	
	counter = 9;
	while (counter > 0) {
		if (rmatvals[0] != 0 && lmatvals[0] != 0)
			outmatvals[0] = ((long)rmatvals[0] * lmatvals[0]) >> 14; else
			outmatvals[0] = 0;

		if (rmatvals[1] != 0 && lmatvals[3] != 0)
			outmatvals[0] += ((long)rmatvals[1] * lmatvals[3]) >> 14;

		if (rmatvals[2] != 0 && lmatvals[6] != 0)
			outmatvals[0] += ((long)rmatvals[2] * lmatvals[6]) >> 14;
		
		outmatvals++;
		if (counter != 7 && counter != 4) {
			lmatvals++;
		} else {
			lmatvals -= 2;
			rmatvals += 3;
		}
		counter--;
	}
	
}

void mat_invert(struct MATRIX* inmat, struct MATRIX* outmat) {
	int temp;
	if (inmat == outmat) {
		temp = outmat->m._21;
		outmat->m._21 = outmat->m._12;
		outmat->m._12 = temp;

		temp = outmat->m._31;
		outmat->m._31 = outmat->m._13;
		outmat->m._13 = temp;

		temp = outmat->m._32;
		outmat->m._32 = outmat->m._23;
		outmat->m._23 = temp;
	} else {
		outmat->m._11 = inmat->m._11;
		outmat->m._12 = inmat->m._21;
		outmat->m._13 = inmat->m._31;

		outmat->m._21 = inmat->m._12;
		outmat->m._22 = inmat->m._22;
		outmat->m._23 = inmat->m._32;

		outmat->m._31 = inmat->m._13;
		outmat->m._32 = inmat->m._23;
		outmat->m._33 = inmat->m._33;
	}
}

