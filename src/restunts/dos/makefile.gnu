# Default target
TARGET ?= ported

SRC = s:\src\restunts

# Sep für Linker
SEP := +
ifeq ($(LINKER),wlink)
  SEP := ,
endif

# Objekt- und Build-Verzeichnisse
RESTUNTS_OBJDIR = $(SRC)\c\build\dos
ASM_DIR = $(SRC)\asm
ASM_OBJDIR = $(ASM_DIR)\build
ASMORIG_DIR = $(SRC)\asmorig
ASMORIG_OBJDIR = $(ASMORIG_DIR)\build
OBJDIR = $(SRC)\dos\build\$(TARGET)

# Quell-Dateien für ASM und C
RESTUNTS_OBJFILES = $(RESTUNTS_OBJDIR)\fileio.obj$(SEP)$(RESTUNTS_OBJDIR)\math.obj$(SEP)$(RESTUNTS_OBJDIR)\memmgr.obj$(SEP)$(RESTUNTS_OBJDIR)\restunts.obj $(SEP)$(RESTUNTS_OBJDIR)\shape3d.obj$(SEP)$(RESTUNTS_OBJDIR)\shape2d.obj$(SEP)$(RESTUNTS_OBJDIR)\keyboard.obj$(SEP)$(RESTUNTS_OBJDIR)\heapsort.obj$(SEP)$(RESTUNTS_OBJDIR)\frame.obj$(SEP)$(RESTUNTS_OBJDIR)\state.obj$(SEP)$(RESTUNTS_OBJDIR)\stateply.obj$(SEP)$(RESTUNTS_OBJDIR)\statecrs.obj$(SEP)$(RESTUNTS_OBJDIR)\statecar.obj
ASM_OBJFILES = $(ASM_OBJDIR)\segments.obj$(SEP)$(ASM_OBJDIR)\seg000.obj$(SEP)$(ASM_OBJDIR)\seg001.obj$(SEP)$(ASM_OBJDIR)\seg002.obj$(SEP)$(ASM_OBJDIR)\seg003.obj$(SEP)$(ASM_OBJDIR)\seg004.obj$(SEP)$(ASM_OBJDIR)\seg005.obj$(SEP)$(ASM_OBJDIR)\seg006.obj$(SEP)$(ASM_OBJDIR)\seg007.obj$(SEP)$(ASM_OBJDIR)\seg008.obj$(SEP)$(ASM_OBJDIR)\seg009.obj$(SEP)$(ASM_OBJDIR)\seg010.obj$(SEP)$(ASM_OBJDIR)\seg011.obj$(SEP)$(ASM_OBJDIR)\seg012.obj$(SEP)$(ASM_OBJDIR)\seg013.obj$(SEP)$(ASM_OBJDIR)\seg014.obj$(SEP)$(ASM_OBJDIR)\seg015.obj$(SEP)$(ASM_OBJDIR)\seg016.obj$(SEP)$(ASM_OBJDIR)\seg017.obj$(SEP)$(ASM_OBJDIR)\seg018.obj$(SEP)$(ASM_OBJDIR)\seg019.obj$(SEP)$(ASM_OBJDIR)\seg020.obj$(SEP)$(ASM_OBJDIR)\seg021.obj$(SEP)$(ASM_OBJDIR)\seg022.obj$(SEP)$(ASM_OBJDIR)\seg023.obj$(SEP)$(ASM_OBJDIR)\seg024.obj$(SEP)$(ASM_OBJDIR)\seg025.obj$(SEP)$(ASM_OBJDIR)\seg026.obj$(SEP)$(ASM_OBJDIR)\seg027.obj$(SEP)$(ASM_OBJDIR)\seg028.obj$(SEP)$(ASM_OBJDIR)\seg029.obj$(SEP)$(ASM_OBJDIR)\seg030.obj$(SEP)$(ASM_OBJDIR)\seg031.obj$(SEP)$(ASM_OBJDIR)\seg032.obj$(SEP)$(ASM_OBJDIR)\seg033.obj$(SEP)$(ASM_OBJDIR)\seg034.obj$(SEP)$(ASM_OBJDIR)\seg035.obj$(SEP)$(ASM_OBJDIR)\seg036.obj$(SEP)$(ASM_OBJDIR)\seg037.obj$(SEP)$(ASM_OBJDIR)\seg038.obj$(SEP)$(ASM_OBJDIR)\seg039.obj$(SEP)$(ASM_OBJDIR)\dseg.obj$(SEP)$(ASM_OBJDIR)\seg041.obj
ASMORIG_OBJFILES = $(ASMORIG_OBJDIR)\segments.obj$(SEP)$(ASMORIG_OBJDIR)\seg000.obj$(SEP)$(ASMORIG_OBJDIR)\seg001.obj$(SEP)$(ASMORIG_OBJDIR)\seg002.obj$(SEP)$(ASMORIG_OBJDIR)\seg003.obj$(SEP)$(ASMORIG_OBJDIR)\seg004.obj$(SEP)$(ASMORIG_OBJDIR)\seg005.obj$(SEP)$(ASMORIG_OBJDIR)\seg006.obj$(SEP)$(ASMORIG_OBJDIR)\seg007.obj$(SEP)$(ASMORIG_OBJDIR)\seg008.obj$(SEP)$(ASMORIG_OBJDIR)\seg009.obj$(SEP)$(ASMORIG_OBJDIR)\seg010.obj$(SEP)$(ASMORIG_OBJDIR)\seg011.obj$(SEP)$(ASMORIG_OBJDIR)\seg012.obj$(SEP)$(ASMORIG_OBJDIR)\seg013.obj$(SEP)$(ASMORIG_OBJDIR)\seg014.obj$(SEP)$(ASMORIG_OBJDIR)\seg015.obj$(SEP)$(ASMORIG_OBJDIR)\seg016.obj$(SEP)$(ASMORIG_OBJDIR)\seg017.obj$(SEP)$(ASMORIG_OBJDIR)\seg018.obj$(SEP)$(ASMORIG_OBJDIR)\seg019.obj$(SEP)$(ASMORIG_OBJDIR)\seg020.obj$(SEP)$(ASMORIG_OBJDIR)\seg021.obj$(SEP)$(ASMORIG_OBJDIR)\seg022.obj$(SEP)$(ASMORIG_OBJDIR)\seg023.obj$(SEP)$(ASMORIG_OBJDIR)\seg024.obj$(SEP)$(ASMORIG_OBJDIR)\seg025.obj$(SEP)$(ASMORIG_OBJDIR)\seg026.obj$(SEP)$(ASMORIG_OBJDIR)\seg027.obj$(SEP)$(ASMORIG_OBJDIR)\seg028.obj$(SEP)$(ASMORIG_OBJDIR)\seg029.obj$(SEP)$(ASMORIG_OBJDIR)\seg030.obj$(SEP)$(ASMORIG_OBJDIR)\seg031.obj$(SEP)$(ASMORIG_OBJDIR)\seg032.obj$(SEP)$(ASMORIG_OBJDIR)\seg033.obj$(SEP)$(ASMORIG_OBJDIR)\seg034.obj$(SEP)$(ASMORIG_OBJDIR)\seg035.obj$(SEP)$(ASMORIG_OBJDIR)\seg036.obj$(SEP)$(ASMORIG_OBJDIR)\seg037.obj$(SEP)$(ASMORIG_OBJDIR)\seg038.obj$(SEP)$(ASMORIG_OBJDIR)\seg039.obj$(SEP)$(ASMORIG_OBJDIR)\dseg.obj$(SEP)$(ASMORIG_OBJDIR)\seg041.obj

# C Compiler Flags und Linker
RESTUNTS_CFLAGS = -c -u- -mm -n$(OBJDIR) -v -DRESTUNTS_DOS

ifeq ($(TARGET), ported)
  CTARGETS = $(ASM_OBJFILES)$(SEP)$(RESTUNTS_OBJFILES)$(SEP)$(OBJDIR)\main.obj$(SEP)getvect.obj$(SEP)labs.obj$(SEP)memcpy.obj$(SEP)fmemcpy.obj$(SEP)h_ldiv.obj$(SEP)f_lxmul.obj$(SEP)f_scopy.obj$(SEP)h_lrsh.obj$(SEP)h_padd.obj$(SEP)h_pina.obj$(SEP)h_pada.obj$(SEP)f_pcmp.obj$(SEP)h_lursh.obj$(SEP)h_psbp.obj$(SEP)h_llsh.obj
  OUTFILE = restunts.exe
  CFLAGS = 
endif

ifeq ($(TARGET), original)
  CTARGETS = $(ASMORIG_OBJFILES)$(SEP)$(OBJDIR)\main.obj
  CFLAGS = -DRESTUNTS_ORIGINAL
  OUTFILE = restunto.exe
endif

CC = bcc $(RESTUNTS_CFLAGS) $(CFLAGS)
LINK = call tlinkbox

LFLAGS = 
ifeq ($(CONFIG), debug)
  LFLAGS = /v
endif

TOOLS_LIB = s:\tools\lib

# Main Build Target
restunts: $(OBJDIR)/main.obj
ifeq ($(LINKER), wlink)
	wlink name $(OUTFILE) format dos option NOCASEEXACT PATH $(TOOLS_LIB) file $(CTARGETS)
else
	echo $(CTARGETS) > linker.txt
	echo $(OUTFILE) >> linker.txt
	$(LINK) /s /P- $(LFLAGS) /j$(TOOLS_LIB) @linker.txt
	rm -f linker.txt
endif
	copy $(OUTFILE) s:\stunts

# Regel für main.c
$(OBJDIR)/main.obj: main.c
	$(CC) -I../c $?

# Clean Target
clean:
	del build\*.obj
	del build\ported\*.obj
	del build\original\*.obj
	del restunts.exe
	del restunts.map
	del restunto.exe
	del restunto.map
