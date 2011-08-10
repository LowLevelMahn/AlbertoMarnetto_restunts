/*

version 1:
	- for each segment, a new segN.inc file, containing extrns to all symbols in that segment (procs, locs and data)
	- for each function, a new .asm file with:
		- includes seg0..segN.inc, EXCEPT for the segment where the function belongs
		- extrns for all symbols in the same segment EXCEPT the current function
		- the .asm implementation of the function and related data
		- public definitions of data and procs
	- the datasegment must be split into at least two files, since the source code is too big for tasm

(didnt work too well on the linking bit, too many symbols declared over and over again)

version 2:

	- for each segment:
		- an .inc file to be included from all the other segments
		- an .asm file w/all code and data on that segment

*/

#include "idc.idc"

static isAnyName(flags) {
	return (flags & FF_ANYNAME) != 0;
}

static isFunction(flags) {
	return isAnyName(flags) && (flags & FF_FUNC) != 0;
}

static GetMemberTypeString(funcframe, memberofs) {
	auto flags;
	flags = GetMemberFlag(funcframe, memberofs);
	if (isByte(flags)) return "byte";
	if (isUnknown(flags)) return "byte";
	if (isWord(flags)) return "word";
	if (isDwrd(flags)) return "dword";
	if (isStruct(flags)) return GetStrucName(GetMemberStrId(funcframe, memberofs));
}

// TODO: GetTypeString is only used by PrintExtrns(), it could/should be reorganized to support arrays, "extrn symbolname[50]:typename"
static GetTypeString(flags, ea) {
	if (isByte(flags)) return "byte";
	if (isUnknown(flags)) return "byte";
	if (isASCII(flags)) return "byte";
	if (isWord(flags)) return "word";
	if (isDwrd(flags)) return "dword";
	if (isStruct(flags)) return CleanTypeName(GuessType(ea));	// would this work for all types?
}

static CleanTypeName(typename) {
	auto ls;
	ls = FirstIndexOf(typename, "[");
	if (ls == -1) return typename;
	return substr(typename, 0, ls);
}

static NextNotTail2(ea, maxea) {
	auto b;
	b = NextNotTail(ea);
	if (b >= maxea) return BADADDR;
	return b;
}

static GetIdbDirectory() {
	auto path, ls;
	path = GetIdbPath();
	ls = LastIndexOf(path, "\\");
	return substr(path, 0, ls);
}

static LastIndexOf(str, c) {
	auto len, testch;
	len = strlen(str);
	while (len > 0) {
		testch = substr(str, len - 1, len);
		if (testch == c) return len - 1;
		len--;
	}
	return -1;
}

static FirstIndexOf(str, c) {
	auto i, len, testch;
	len = strlen(str);
	for (i = 0; i < len; i++) {
		testch = substr(str, i, i + 1);
		if (testch == c) return i;
	}
	return -1;
}

static ExtractCallTarget(ea) {
	auto str, ls;
	str = GetDisasm(ea);
	ls = FirstIndexOf(str, ";");
	if (ls != -1) {
		str = substr(str, 0, ls);
		while (strlen(str) > 0 && LastIndexOf(str, " ") == strlen(str) -1) {
			str = substr(str, 0, strlen(str) - 1);
		}
	}
	ls = LastIndexOf(str, " ");
	return substr(str, ls + 1, -1);
}

static PrintFrame(f, funcstart) {

	auto funcframe, framesize, framelsize;//, framersize, frameasize;
	auto memberofs, membername, memberflag, memberloc;

	funcframe = GetFrame(funcstart);
	if (funcframe != 0) {
		framesize = GetStrucSize(funcframe);
		framelsize = GetFrameLvarSize(funcstart);
		//framersize = GetFrameRegsSize(funcstart);
		//frameasize = GetFrameArgsSize(funcstart);
		
		for (memberofs = 0; memberofs < framesize; memberofs = GetStrucNextOff(funcframe, memberofs)) {
			membername = GetMemberName(funcframe, memberofs);
			memberflag = GetMemberFlag(funcframe, memberofs);
			
			memberloc = -framelsize + memberofs;
		
			if (memberflag != -1) {
				fprintf(f, "    %s = %s ptr %i\n", membername, GetMemberTypeString(funcframe, memberofs), memberloc);
			}
		}
	}
}

static IsPublicLabel(labelname) {
	if (
		labelname == "loc_2CE06" || 
		labelname == "loc_2EB62" || 
//		labelname == "_file_find_ok" || // Resolved
//		labelname == "_file_find_err" || // Resolved
		labelname == "loc_301FD" || 
		labelname == "_timerintr_callback" || 
		labelname == "loc_308C6" || 
		labelname == "loc_309A5" || 
//		labelname == "_file_read" || // Resolved
//		labelname == "_file_load_binary" || // Resolved
//		labelname == "_file_decomp" || // Resolved
		labelname == "loc_30FB2" || 
		labelname == "loc_310CD" || 
		labelname == "loc_31498" || 
		labelname == "loc_317CE" || 
		labelname == "loc_317FB" || 
		labelname == "loc_3180A" || 
		labelname == "locret_31AA3" || 
		labelname == "loc_32334" || 
//		labelname == "_file_write" || // Resolved
		labelname == "loc_326E4" || 
		labelname == "loc_3284A" || 
		labelname == "loc_32882" || 
		labelname == "loc_32B78" || 
		labelname == "loc_32B93" || 
		labelname == "loc_32BDE" || 
		labelname == "loc_3301F" || 
		labelname == "loc_335CF" || 
		labelname == "loc_335D7" || 
		labelname == "loc_33622" || 
		labelname == "loc_33697" || 
		labelname == "loc_338C9" || 
		labelname == "loc_33A57" || 
		labelname == "loc_33B1D" || 
		labelname == "loc_33BF5" || 
		labelname == "loc_33D69" || 
		labelname == "loc_33E1B" || 
		labelname == "loc_33E27" || 
		labelname == "loc_33EED" || 
		labelname == "loc_340BD" || 
		labelname == "loc_3424B" || 
		labelname == "loc_34311" || 
		labelname == "loc_343E9" || 
		labelname == "loc_34541" || 
		labelname == "loc_345E5" || 
		labelname == "loc_346A8" || 
		labelname == "loc_34799" || 
		labelname == "loc_35ED9" || 
		labelname == "loc_390C8" || 
		labelname == "loc_3ACD8" || 
		labelname == "loc_2E0BE" || 
		labelname == "loc_2E18F" || 
		labelname == "loc_2E61E" || 
		labelname == "loc_2E626" || 
		labelname == "loc_2E635" || 
		labelname == "__dosretax" ||
		labelname == "__cxtoa" ||
		labelname == "__cltoasub" ||
		labelname == "__amsg_exit"
	) {
		return 1;
	}
	return 0;
}

static PrintExterns(f, segstart, segend, exceptstart, exceptend) {

	auto funcea, flags, labelname;

	for (funcea = segstart; funcea != BADADDR; funcea = NextNotTail2(funcea, segend)) {
	
		// print extrns for all data and procs in this segment
		flags = GetFlags(funcea);
		
		if (exceptstart != BADADDR && funcea >= exceptstart && funcea < exceptend) continue;
		
		if (isAnyName(flags)) {
			labelname = NameEx(BADADDR, funcea);
			if (isAlign(flags)) {
				// do nothing
			} else
			if (isCode(flags)) {
			
				if (isFunction(flags)) {
					fprintf(f, "    extrn %s:proc\n", PortFuncName(labelname));
				} else {
					// only a fraction of the locs need be extrnalized, so use a hardcoded list of allowed labels
					// allowing all labels gives out of memory error
					if (IsPublicLabel(labelname)) {
						fprintf(f, "    extrn %s\n", labelname);
					}
				}
			} else 
			if (isData(flags) || isUnknown(flags)) {
				if (labelname != "") {
					fprintf(f, "    extrn %s:%s\n", labelname, GetTypeString(flags, funcea));
				} else {
					Message("extrns: label is blank and isAnyName is true!\n");
				}
			}
		}
	
	}
}


static PrintPublics(f, segstart, segend) {

	auto funcea, flags, labelname;

	for (funcea = segstart; funcea != BADADDR; funcea = NextNotTail2(funcea, segend)) {
	
		// print extrns for all data and procs in this segment
		flags = GetFlags(funcea);
		
		if (funcea < segstart || funcea > segend) continue;
		
		if (isAnyName(flags)) {
			labelname = NameEx(BADADDR, funcea);
			if (isAlign(flags)) {
				// do nothing
			} else
			if (isCode(flags)) {
			
				if (isFunction(flags) || IsPublicLabel(labelname)) {
					fprintf(f, "    public %s\n", PortFuncName(labelname));
				} else {
					//fprintf(f, "LABEL: %s\n", NameEx(BADADDR, funcea));
				}
			} else 
			if (isData(flags) || isUnknown(flags)) {
				if (labelname != "") {
					fprintf(f, "    public %s\n", labelname);
				} else {
					Message("publics: label is blank and isAnyName is true!\n");
				}
			}
		}
	
	}
}

static PrintAsmHeader(f, codestart, codeend) {
	auto segea, nextseg, segtype;
	fprintf(f, ".model medium\n");
	fprintf(f, "nosmart\n");
	
	segtype = GetSegmentAttr(codestart, SEGATTR_TYPE);
	if (segtype == SEG_BSS)
		fprintf(f, ".stack %i\n", SegEnd(codestart) - SegStart(codestart));
	
	fprintf(f, "    include structs.inc\n");
	fprintf(f, "    include custom.inc\n");
	
	for (segea = FirstSeg(); segea != BADADDR; segea = nextseg) {
		nextseg = NextSeg(segea);
		
		if (codestart < segea || codestart >= nextseg) {
			fprintf(f, "    include %s.inc\n", SegName(segea));
		}
	}

	if (segtype == SEG_DATA) {
		fprintf(f, "DGROUP group %s\n", SegName(codestart));
	}

	PrintSegDecl(f, codestart);
		
	fprintf(f, "    assume cs:%s\n", SegName(codestart));
	fprintf(f, "    assume es:nothing, ss:nothing, ds:dseg\n");
	
	// place all segment includes here pls
	PrintExterns(f, SegStart(codestart), SegEnd(codestart), codestart, codeend);

	PrintPublics(f, codestart, codeend);

}

static PrintFunction(f, funcstart, funcend) {
//	GenerateFile(OFILE_ASM, f, funcstart, funcend, 0);
//	GenerateFile(OFILE_ASM, f, funcstart, funcend, GENFLG_ASMINC);

	auto segea, nextseg;
	auto funcname, funcflags, funcspec, funcbody, bodyflags;
	auto locname;
	auto maxfuncs, funccount, filename, i;

	funcname = GetFunctionName(funcstart);
	funcflags = GetFunctionFlags(funcstart);

	if (funcflags & FUNC_FAR)
		funcspec = " far"; else
		funcspec = " near";
	
	fprintf(f, "%s proc%s\n", PortFuncName(funcname), funcspec);
	PrintFrame(f, funcstart);
	fprintf(f, "\n");
	PrintBody(f, funcstart, funcend, 1);
	fprintf(f, "%s endp\n", PortFuncName(funcname));
}

static PrintBody(f, funcstart, funcend, skipfirstlabel) {
	auto funcbody, bodyflags, locname;
	auto i;
	auto fchunkstart, fchunklast;
	
	fchunklast = -1;
	for (funcbody = funcstart; funcbody != BADADDR; funcbody = NextNotTail2(funcbody, funcend)) {
		bodyflags = GetFlags(funcbody);
		
		fchunkstart = GetFchunkAttr(funcbody, FUNCATTR_START);
		if (fchunkstart != -1 && fchunkstart != funcstart && fchunkstart != fchunklast) {
			// its a function chunk, write out the frame for the original function
			PrintFrame(f, fchunkstart);
			fchunklast = fchunkstart;
		}
		
		if (((skipfirstlabel && funcbody != funcstart) || !skipfirstlabel) && isAnyName(bodyflags)) {
			locname = NameEx(funcstart, funcbody);
			if (isCode(bodyflags) || isAlign(bodyflags))
				fprintf(f, "%s:\n", locname); else
			if (isData(bodyflags) || isUnknown(bodyflags))
				fprintf(f, "%s ", locname); else
				Message("Unhandled name!");
		}

		if (isAlign(bodyflags)) {
			fprintf(f, "    ; %s\n", GetDisasm(funcbody));
			for (i = 0; i < ItemSize(funcbody); i++) {
				fprintf(f, "    db %i\n", Byte(funcbody + i));
			}
		} else 
		if (isData(bodyflags) || (!isCode(bodyflags) && isUnknown(bodyflags))) {
			// jump tables arent written out correctly - what to do??
			//fprintf(f, "    ; JUMP TABLE!");
			//GenerateFile(OFILE_ASM, f, funcbody, funcbody + ItemSize(funcbody), 0);

			if (isStruct(bodyflags)) {
				// TODO: print properly sized data members rather than just bytes
				for (i = 0; i < ItemSize(funcbody); i++) {
					if (hasValue(bodyflags))
						fprintf(f, "    db %i\n", Byte(funcbody + i)); else
					if (SegName(funcbody) == "dseg")
						fprintf(f, "    db 0\n"); else
						fprintf(f, "    db ?\n");
				}
			} else
			if (isOff0(bodyflags)) {
				fprintf(f, "    %s\n", GetDisasm(funcbody));
			} else
			if (isSeg0(bodyflags)) {
				fprintf(f, "    %s\n", GetDisasm(funcbody));
			} else
			if (isDwrd(bodyflags)) {
				for (i = 0; i < ItemSize(funcbody) / 4; i++) {
					if (hasValue(bodyflags))
						fprintf(f, "    dd %i\n", Dword(funcbody + i * 4)); else
					if (SegName(funcbody) == "dseg")
						fprintf(f, "    dd 0\n"); else
						fprintf(f, "    dd ?\n");
				}
			} else
			if (isWord(bodyflags)) {
				for (i = 0; i < ItemSize(funcbody) / 2; i++) {
					if (hasValue(bodyflags))
						fprintf(f, "    dw %i\n", Word(funcbody + i * 2)); else
					if (SegName(funcbody) == "dseg")
						fprintf(f, "    dw 0\n"); else
						fprintf(f, "    dw ?\n");
				}
			} else
			if (isByte(bodyflags) || isUnknown(bodyflags) || isASCII(bodyflags)) {
				for (i = 0; i < ItemSize(funcbody); i++) {
					if (hasValue(bodyflags))
						fprintf(f, "    db %i\n", Byte(funcbody + i)); else
					if (SegName(funcbody) == "dseg")
						fprintf(f, "    db 0\n"); else
						fprintf(f, "    db ?\n");
				}
			} else {
				Message("TODO: unhandled data size X%i\n", bodyflags);
			}
		} else {
			 // seg010 @ 183378-190983
			 // 0x2cc6f = mov si, di:2
			 if (funcbody == 0x2cc6f) {
				fprintf(f, "    ; begin hack the crt startup\n");
				fprintf(f, "    ; assume endseg is linked at the end of the program\n");
				fprintf(f, "    mov si, seg endseg\n");
				fprintf(f, "    sub si, di\n");
				for (i = 0; i < 10; i++) {
					fprintf(f, "    nop\n");
				}
				fprintf(f, "    ; end hack the crt startup\n");
			 } else 
			 if (funcbody > 0x2cc6f && funcbody < 0x2cc7e) {
				// skip this
			 } else
				PrintFixedAsm(f, funcbody);
			//fprintf(f, "    %s\n", GetDisasm(funcbody));
		}
	}
}

static PrintFixedAsm(f, ea) {

	auto tempsmart, nooutput;

	// issues:
	// or si, <byte>, tasm compiles to 3 bytes, must be 4 bytes
	// call <far method in same segment>, tasm compiles to "push cs, call near <method>"
	// lea bx, unk_999, tasm compiles to mov bx, unk_999

	// with "nosmart", these are fixed, but other problems appear

	auto mnem, op1, op2, optype1, optype2;
	auto funcflags, funcofs, funclocal, funcstart, funcname, portfuncname;
	
	tempsmart = 0;
	nooutput = 0;

	mnem = GetMnem(ea);
	op1 = GetOpnd(ea, 0);
	optype1 = GetOpType(ea, 0);
	
	if (mnem == "and" /*&& optype1 == o_reg*/) {
		//if (op1 == "si" || op1 == "di" || op1 == "bx" || op1 == "cx" || op1 == "dx" || op1 == "sp") {
			op2 = GetOpType(ea, 1);
			if (op2 == o_imm) {
				//op2 = GetOperandValue(ea, 1);
				//if (op2 >= 0 && op2 < 256) {
					fprintf(f, "smart\n");
					tempsmart = 1;
				//}
			}
		//}
	}
	
	if (mnem == "or" && optype1 == o_reg && op1 == "si") {
		op2 = GetOpType(ea, 1);
		if (op2 == o_imm) {
			op2 = GetOperandValue(ea, 1);
			if (op2 >= 0 && op2 < 256) {
				fprintf(f, "smart\n");
				fprintf(f, "    nop\n");
				tempsmart = 1;
			}
		}
	}
	
	if (mnem == "or" && optype1 == o_reg && op1 == "di") {
		op2 = GetOpType(ea, 1);
		if (op2 == o_imm) {
			op2 = GetOperandValue(ea, 1);
			if (op2 >= 0 && op2 < 256) {
				fprintf(f, "smart\n");
				tempsmart = 1;
			}
		}
	}

	if ((mnem == "or" || mnem == "and") && optype1 == o_displ) {
		//Message("OR PHRASE: %s\n", GetDisasm(ea));
		op2 = GetOpType(ea, 1);
		if (op2 == o_imm) {
			op2 = GetOperandValue(ea, 1);
			if (op2 >= 0 && op2 < 256) {
				fprintf(f, "smart\n");
				tempsmart = 1;
			}
		}
	}
	
	if (mnem == "jmp" && optype1 == o_far) {
		funcofs = Rfirst0(ea);
		funcstart =  GetFchunkAttr(funcofs, FUNCATTR_START);
		if (funcstart != funcofs) {
			Message("Translated %s into jmp far ptr %s\n", GetDisasm(ea), ExtractCallTarget(ea));
			fprintf(f, "    jmp far ptr %s\n", ExtractCallTarget(ea));
			nooutput = 1;
		}
	}
	
	if ((mnem == "jz" || mnem == "jmp") && optype1 == o_near) {
		// if jumping to ourselves AND this is a ported function, we need to jump to the original non-ported function
		funcname = ExtractCallTarget(ea);
		if (funcname == GetFunctionName(ea)) {
			portfuncname = PortFuncName(funcname);
			if (portfuncname != funcname) {
				fprintf(f, "    %s short near ptr %s ; (fixed jump to ported self)\n", mnem, portfuncname);
				nooutput = 1;
			}
		}
	}
	
	if (mnem == "call" && optype1 == o_near) {
		funcname = PortFuncName(ExtractCallTarget(ea));
		//Message("Translated %s into call near ptr %s\n", GetDisasm(ea), funcname);
		fprintf(f, "    call near ptr %s\n", funcname);
		nooutput = 1;
	} else
	if (mnem == "call") {
		funcname = PortFuncName(ExtractCallTarget(ea));
		if (funcname == "__setenvp") {
			//Message("****** hello from SETENVP!\n");
			fprintf(f, "    ;call %s    ; -- stunts does not need the environment, and this call trashes our injected code\n", funcname);
			fprintf(f, "    nop\n");
			fprintf(f, "    nop\n");
			fprintf(f, "    nop\n");
			fprintf(f, "    nop\n");
			fprintf(f, "    nop\n");
			nooutput = 1;
		}
	}
	
	if (nooutput == 0)
		fprintf(f, "    %s\n", GetDisasm(ea));

	if (tempsmart) {
		fprintf(f, "nosmart\n");
	}

}

// add functions in PortFuncName as they are ported to c
// PortFuncName returns an obscured version of the function name
// to prevent name collisions.
// functions must also be added as externals in custom.inc
static PortFuncName(labelname) {
//	return labelname;

	if (
//		labelname == "_strcpy" ||
//		labelname == "_strcmp" ||
//		labelname == "_strcat" ||
//		labelname == "_strlen" ||
//		labelname == "_strrchr" ||
//		labelname == "_stricmp" ||
//		labelname == "_rand" ||
//		labelname == "_srand" ||
//		labelname == "_printf" ||
//		labelname == "_sprintf" ||
//		labelname == "_abs" ||
//		labelname == "_flushall" ||
//		labelname == "_abort" ||
		labelname == "sin_fast" ||
		labelname == "cos_fast" ||
		labelname == "polarAngle" || 
		labelname == "polarRadius2D" || 
		labelname == "polarRadius3D" || 
		labelname == "rect_compare_point" || 
		labelname == "rect_adjust_from_point" || 
		labelname == "vector_op_unk" || 
		labelname == "vector_op_unk2" || 
		labelname == "vector_to_point" || 
		labelname == "set_projection" ||
		labelname == "select_cliprect_rotate" ||
		labelname == "mat_mul_vector" || 
		labelname == "mat_multiply" || 
		labelname == "mat_invert" || 
		labelname == "mat_rot_x" || 
		labelname == "mat_rot_y" || 
		labelname == "mat_rot_z" || 
		labelname == "mat_rot_zxy" || 
		labelname == "polyinfo_reset" || 
		labelname == "init_polyinfo" || 
		labelname == "calc_sincos80" ||

		labelname == "file_find" ||
		labelname == "file_find_next" ||
		labelname == "file_paras" ||
		labelname == "file_paras_fatal" ||
		labelname == "file_paras_nofatal" ||
		labelname == "file_decomp_paras" ||
		labelname == "file_decomp_paras_fatal" ||
		labelname == "file_decomp_paras_nofatal" ||
		labelname == "file_read" ||
		labelname == "file_read_fatal" ||
		labelname == "file_read_nofatal" ||
		labelname == "file_write_fatal" ||
		labelname == "file_write_nofatal" ||
		labelname == "file_decomp_vle" ||
		labelname == "file_decomp" ||
		labelname == "file_decomp_fatal" ||
		labelname == "file_decomp_nofatal" ||
		labelname == "file_load_binary" ||
		labelname == "file_load_binary_fatal" ||
		labelname == "file_load_binary_nofatal" ||
		labelname == "file_load_resource" ||
		labelname == "file_load_resfile" ||
		labelname == "file_load_3dres" ||
		labelname == "file_load_audiores" ||
		labelname == "file_load_shape2d" ||
		labelname == "file_load_shape2d_fatal" ||
		labelname == "file_load_shape2d_nofatal" ||
		labelname == "file_load_shape2d_nofatal2" ||
		labelname == "file_load_shape2d_res" ||
		labelname == "file_load_shape2d_res_fatal" ||
		labelname == "file_load_shape2d_res_nofatal" ||
		labelname == "file_unflip_shape2d" ||
		labelname == "file_get_unflip_size" ||
		labelname == "file_get_shape2d" ||

		labelname == "mmgr_path_to_name" ||
		labelname == "mmgr_alloc_pages" ||
		labelname == "mmgr_alloc_resmem" ||
		labelname == "mmgr_alloc_a000" ||
		labelname == "mmgr_get_ofs_diff" ||
		labelname == "mmgr_free" ||
		labelname == "mmgr_copy_paras" ||
		labelname == "copy_paras_reverse" ||
		labelname == "mmgr_find_free" ||
		labelname == "mmgr_get_chunk_by_name" ||
		labelname == "mmgr_release" ||
		labelname == "mmgr_get_chunk_size" ||
		labelname == "mmgr_resize_memory" ||
		labelname == "mmgr_op_unk" ||
		labelname == "mmgr_alloc_resbytes" ||
		labelname == "mmgr_get_res_ofs_diff_scaled" ||
		labelname == "mmgr_get_chunk_size_bytes" ||

		labelname == "locate_shape_nofatal" ||
		labelname == "locate_shape_fatal" ||
		labelname == "locate_shape_alt" ||
		labelname == "locate_sound_fatal" ||
		labelname == "locate_many_resources" ||
		labelname == "locate_text_res" ||
		
		labelname == "shape3d_load_all" ||
		labelname == "shape3d_free_all" ||
		labelname == "shape3d_init_shape" ||
		labelname == "transformed_shape_op" ||
		labelname == "transformed_shape_op_helper" ||
		labelname == "transformed_shape_op_helper2" ||
		labelname == "transformed_shape_op_helper3" ||
		labelname == "get_a_poly_info" ||
		labelname == "preRender_default" ||
		labelname == "preRender_default_alt" ||
		labelname == "skybox_op_helper" ||
		labelname == "preRender_wheel_helper4" ||
		labelname == "preRender_unk" ||
		labelname == "preRender_patterned" ||
		//labelname == "preRender_helper" ||
		//labelname == "preRender_helper2" ||
		//labelname == "preRender_helper3" ||

		labelname == "draw_line_related" ||
		labelname == "draw_line_related_alt" ||

		labelname == "sprite_make_wnd" ||
		labelname == "sprite_free_wnd" ||
		labelname == "sprite_set_1_from_argptr" ||
		labelname == "sprite_copy_2_to_1" ||
		labelname == "sprite_copy_2_to_1_2" ||
		labelname == "sprite_copy_2_to_1_clear" ||
		labelname == "sprite_copy_wnd_to_1" || 
		labelname == "sprite_copy_wnd_to_1_clear" ||
		labelname == "sprite_copy_both_to_arg" ||
		labelname == "sprite_copy_arg_to_both" ||
		labelname == "sprite_clear_1_color" ||
		labelname == "sprite_putimage" ||
		labelname == "sprite_putimage_and" ||
		labelname == "sprite_putimage_or" ||

		labelname == "kb_init_interrupt" ||
		labelname == "kb_exit_handler" ||
		labelname == "kb_int9_handler" ||
		labelname == "kb_int16_handler" ||
		labelname == "kb_get_key_state" ||
		labelname == "kb_call_readchar_callback" ||
		labelname == "kb_read_char" ||
		labelname == "kb_checking" ||
		labelname == "flush_stdin" ||
		labelname == "kb_check" ||
		
		labelname == "init_kevinrandom" ||
		labelname == "get_kevinrandom_seed" ||
		labelname == "get_kevinrandom" ||
		labelname == "get_super_random" ||

		labelname == "stuntsmain"
	)
		return "ported_" + labelname + "_";
	return labelname;
}

static PrintSegDecl(f, ea) {
	auto segtype;
	segtype = GetSegmentAttr(ea, SEGATTR_TYPE);
	if (segtype == SEG_CODE)
		fprintf(f, "%s segment byte public 'STUNTSC' use16\n", SegName(ea)); 
	else if (segtype == SEG_BSS)
		fprintf(f, "%s segment byte public 'STACK' use16\n", SegName(ea)); 
	else 
		fprintf(f, "%s segment byte public 'STUNTSD' use16\n", SegName(ea)); 

}

static PrintSegInc(segstart, segend) {
	auto funcea, flags, f, filename;
	auto segname;

	segname = SegName(segstart);
	filename = form("%s\\asm\\%s.inc", GetIdbDirectory(), segname);
	f = fopen(filename, "w");

	PrintSegDecl(f, segstart);
	PrintExterns(f, segstart, segend, BADADDR, BADADDR);
	fprintf(f, "%s ends\n", segname);

	fclose(f);
}

static PrintStruct(f, id) {
	auto memberofs, membername, memberflag, membersize, memberid, strucsize, i;

	strucsize = GetStrucSize(id);

	if (IsUnion(id)) {
		fprintf(f, "%s union\n", GetStrucName(id));
		// can unions have non-struct members?
		for (;;) {
			memberid = GetMemberStrId(id, i);
			membername = GetStrucName(memberid);
			if (membername == "") break;
			fprintf(f, "  %s %s ?\n", GetMemberName(id, i), membername);
			i++;
		}
		fprintf(f, "ends\n", id);
		return ;
	}

	fprintf(f, "%s struc\n", GetStrucName(id));

	for (memberofs = 0; memberofs < strucsize; memberofs = GetStrucNextOff(id, memberofs)) {
		membername = GetMemberName(id, memberofs);
		memberflag = GetMemberFlag(id, memberofs);

		if (isStruct(memberflag)) {
			memberid = GetMemberStrId(id, memberofs);
			membersize = GetMemberSize(id, memberofs) / GetStrucSize(memberid);
			if (membersize == 1) {
				fprintf(f, "%s %s ?\n", membername, GetStrucName(memberid));
			} else {
				fprintf(f, "%s %s %i dup (?)\n", membername, GetStrucName(memberid), membersize);
			}
		} else
		if (isDwrd(memberflag)) {
			membersize = GetMemberSize(id, memberofs) / 4;
			if (membersize == 1) {
				fprintf(f, "%s dd ?\n", membername);
			} else {
				fprintf(f, "%s dd %i dup (?)\n", membername, membersize);
			}
		} else
		if (isWord(memberflag)) {
			membersize = GetMemberSize(id, memberofs) / 2;
			if (membersize == 1) {
				fprintf(f, "%s dw ?\n", membername);
			} else {
				fprintf(f, "%s dw %i dup (?)\n", membername, membersize);
			}
		} else
		if (isByte(memberflag) || isUnknown(memberflag) || isASCII(memberflag)) {
			membersize = GetMemberSize(id, memberofs);
			if (membersize == 1) {
				fprintf(f, "%s db ?\n", membername);
			} else {
				fprintf(f, "%s db %i dup (?)\n", membername, membersize);
			}
		} else {
			Message("TODO: unhandled member %s in %s data size %i\n", membername, GetStrucName(id), memberflag);
		}
		//fprintf(f, "%s %s\n", membername, GetMemberTypeString(id, memberofs));
	}

	fprintf(f, "ends\n", id);
}

static GetAnterior(ea) {
	auto i, str, result;
	
	result = "";
	for (i = 0; i < 10; i++) {
		str = LineA(ea, i);
		if (strlen(str) == 0) continue;
		result = result + str + "<br />";
	}
	return result;
}

// TODO: this should return 3 values: callercount, callcount and linecount
static GetFunctionInfo(ea, funcend) {

	auto result, xea, funcname, funcbody, xmnem, callcount, lines;

	result = GetAnterior(ea);
	if (result != "")
		result = result + "<br />\n";

	callcount = 0;
	for (xea = RfirstB(ea); xea != BADADDR; xea = RnextB(ea, xea)) {
		//funcname = GetFunctionName(xea);
		//result = result + "\n    <a href=\"#" + funcname + "\">" + funcname + "</a>";
		callcount++;
	}
	result = result + "<small>" + form("%i", callcount) + " callers</small>, ";
	
	funcbody = ea;
	callcount = 0;
	lines = 0;
	for (funcbody = ea; funcbody != BADADDR; funcbody = NextNotTail2(funcbody, funcend)) {
		xmnem = GetMnem(funcbody);
		if (xmnem == "call") {
			for (xea = Rfirst(funcbody); xea != BADADDR; xea = Rnext(funcbody, xea)) {
				//funcname = GetFunctionName(xea);
				//result = result + "\n    <a href=\"#" + funcname + "\">" + funcname + "</a>";
				callcount++;
			}
		}
		lines++;
	}

	result = result + "<small>" + form("%i", callcount) + " calls.</small> <small>" + form("%i", lines) + " lines of code.</small>";

	return result;
}

static PrintReport() {

	auto segea, nextseg, endseg;
	auto funcea, nextfunc, endfunc, funcname, funccount, portfunccount, ignorefunccount, funcflags;
	auto f, filename;
	auto ported, ignorable, statustext;

	filename = form("%s\\%s", GetIdbDirectory(), "status.html");
	f = fopen(filename, "w");

	fprintf(f, "<table border=\"1\">\n");

	Message("Generating report...\n");
	
	funccount = 0;
	portfunccount = 0;
	
	for (segea = FirstSeg(); segea != BADADDR; segea = nextseg) {
		nextseg = NextSeg(segea);
		
		if (nextseg == BADADDR)
			endseg = SegEnd(segea); else
			endseg = nextseg;

		fprintf(f, "<tr>\n");
		fprintf(f, "    <td valign=\"top\"><b>%s</b></td><td valign=\"top\">%s</td><td valign=\"top\"><b>%s</b></td>\n", SegName(segea), GetAnterior(funcea), "Status");
		fprintf(f, "</tr>\n");

		for (funcea = segea; funcea != BADADDR; funcea = nextfunc) {
			nextfunc = NextFunction(funcea);
			if (endseg <= nextfunc || nextfunc == BADADDR) {
				endfunc = endseg; 
				nextfunc = BADADDR;
			} else
				endfunc = nextfunc;
			
			if (!isFunction(GetFlags(funcea))) continue;

			funcname = GetFunctionName(funcea);
			funcflags = GetFunctionFlags(funcea);
			ported = PortFuncName(funcname) != funcname;
			ignorable = ((funcflags & (FUNC_LIB|FUNC_THUNK)) != 0) || substr(funcname, 0, 6) == "nopsub";
			
			funccount ++;
			if (ported)
				portfunccount ++;
			if (ignorable)
				ignorefunccount++;
				
			if (ported) 
				statustext = "PORTED"; else 
			if (ignorable)
				statustext = "IGNORE"; else
				statustext = "";
				
			fprintf(f, "<tr>\n");
			fprintf(f, "    <td valign=\"top\"><a name=\"%s\"></a>%s</td><td valign=\"top\">%s</td><td valign=\"top\"><b>%s</b></td>\n", funcname, funcname, GetFunctionInfo(funcea, endfunc), statustext);
			fprintf(f, "</tr>\n");
		}

	}
	fprintf(f, "<tr>\n");
	fprintf(f, "    <td valign=\"top\" colspan=\"3\"><b>Total functions: %i / Ignored: %i / Ported: %i</b></td>\n", funccount, ignorefunccount, portfunccount);
	fprintf(f, "</tr>\n");
	fprintf(f, "</table>\n");

	fclose(f);
}

static main() {
	auto segea, funcea, nextseg, endseg, endfunc, nextfunc, segss, segtype;
	auto maxfuncs, funccount, startseg;
	auto i, j;
	auto f, filename, flags;
	auto enumid, constid;

	maxfuncs = 5;
	funccount = 0;

	PrintReport();

	Message("Generating segment includes...\n");
	for (segea = FirstSeg(); segea != BADADDR; segea = nextseg) {
		nextseg = NextSeg(segea);
		PrintSegInc(segea, nextseg);
	}

	Message("Generating structs...\n");
	f = fopen(GetIdbDirectory() + "\\asm\\structs.inc", "w");

	for (i = GetFirstStrucIdx(); i != -1; i = GetNextStrucIdx(i)) {
		PrintStruct(f, GetStrucId(i));
	}
	
	for (i = 0; i < GetEnumQty(); i++) {
		enumid = GetnEnum(i);
		fprintf(f, "; enum %s (%i)\n", GetEnumName(enumid), enumid);
		for (j = GetFirstConst(enumid, -1); j != -1; j = GetNextConst(enumid, j, -1)) {
			// TODO: 3rd arg is a "serial number", ie index of const with the same value, not supported yet
			constid = GetConstEx(enumid, j, 0, -1);
			fprintf(f, "%s = %i\n", GetConstName(constid), j);
		}
	}
	
	fclose(f);

	Message("Generating functions in segment...\n");
	for (segea = FirstSeg(); segea != BADADDR; segea = nextseg) {
		nextseg = NextSeg(segea);
		
		if (nextseg == BADADDR)
			endseg = SegEnd(segea); else
			endseg = nextseg;

		startseg = 0;

		//if (SegName(segea) != "seg012") continue;
		//if (SegName(segea) != "seg037") continue;
		//if (SegName(segea) != "seg002") continue;
		//if (SegName(segea) != "dseg") continue;
		
		// TODO: should use names in alphabetical order to ensure correct linking order
		// or generate a filelist for tlink @-syntax
		filename = form("%s\\asm\\%s.asm", GetIdbDirectory(), SegName(segea));
		
		Message("Segment %i, %s: %s\n", segea, SegName(segea), filename);
	
		f = fopen(filename, "w");
		
		PrintAsmHeader(f, segea, endseg);

		// the stack is generated with the .stack directive, so printing it would just add extra bytes to our image
		segtype = GetSegmentAttr(segea, SEGATTR_TYPE);
		if (segtype != SEG_BSS) {
			for (funcea = segea; funcea != BADADDR; funcea = nextfunc) {
				nextfunc = NextFunction(funcea);
				if (endseg <= nextfunc || nextfunc == BADADDR) {
					endfunc = endseg; 
					nextfunc = BADADDR;
				} else
					endfunc = nextfunc;
				
				flags = GetFlags(funcea);
				if (isFunction(flags) && GetFunctionName(funcea) != "") {
					//Message("function %s at %i-%i\n", GetFunctionName(funcea), funcea, endfunc);
					PrintFunction(f, funcea, endfunc);
					if (GetFunctionName(funcea) == "start") {
						startseg = 1;
					}
				} else 
				if (isCode(flags)) {
					PrintBody(f, funcea, endfunc, 0);
					//Message("unhandlet code at %i-%i\n", funcea, endfunc);
				} else
				if (isData(flags) || hasValue(flags)) {
					//Message("data at %i-%i\n", funcea, endfunc);
					PrintBody(f, funcea, endfunc, 0);
					//Message("unhandled data - should be at the beginning of a segment that doesnt start with a function!\n");
				} else {
					Message("unhandled flags: %i\n", flags);
				}
	
				//funccount++;
				//if (funccount > maxfuncs) break;
				//continue;
			}
		}
		
		fprintf(f, "%s ends\n", SegName(segea));
		if (startseg)
			fprintf(f, "end start\n"); else
			fprintf(f, "end\n");
		fclose(f);
		
		//break;
	}

	Message("Anders rules\n");

}
