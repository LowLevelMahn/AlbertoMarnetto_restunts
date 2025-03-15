#
# copied from Chocolatey(https://chocolatey.org/install) install 
# 
#   choco install make
# 
# C:\cygwin64\usr\test_bin\bin\make.exe
# C:\FPC\3.2.2\bin\i386-win32\make.exe
# C:\ProgramData\chocolatey\bin\make.exe
# C:\ProgramData\chocolatey\lib\make\tools\install\bin\make.exe <-- copied this one
# C:\user\bin\make.exe
# C:\Users\All Users\chocolatey\bin\make.exe
# C:\Users\All Users\chocolatey\lib\make\tools\install\bin\make.exe
# 
# its a recent make 4.4.1
# 
# make -f makefile.gnu CONFIG=debug ASSEMBLER=tasmbox
#

include my_helper.mk

# options
CONFIG ?= release
ASSEMBLER ?= tasm32
LINKER ?= tlink

VALID_CONFIGS = debug release

VALID_ASSEMBLERS = tasmbox tasmx tasm32

BORLAND_LINKERS = tlinkbox tlink
VALID_LINKERS = $(BORLAND_LINKERS) wlink

# valid CONFIG
ifeq (,$(findstring $(CONFIG),$(VALID_CONFIGS)))
  $(error unknown CONFIG value: $(CONFIG))
endif

# valid ASSEMBLER
ifeq (,$(findstring $(ASSEMBLER),$(VALID_ASSEMBLERS)))
  $(error unknown ASSEMBLER value: $(ASSEMBLER))
endif

# valid LINKER
ifeq (,$(findstring $(LINKER),$(VALID_LINKERS)))
  $(error unknown LINKER value: $(LINKER))
endif

# valid option combination
ifeq ($(CONFIG),debug)
  ifeq ($(ASSEMBLER),tasm32)
    $(error ASSEMBLER $(ASSEMBLER) is not supported for CONFIG $(CONFIG))
  endif
  ifeq ($(LINKER),wlink)
    $(error LINKER $(LINKER) is not supported for CONFIG $(CONFIG))
  endif
endif

MAKE_PARAMS = CONFIG=$(CONFIG) ASSEMBLER=$(ASSEMBLER) LINKER=$(LINKER)

define run_make
  @cd $(1) && make -f makefile.gnu $(make_cmd) && cd ..
endef

# list of files
files =file1.c file2.c file3.c file4.c

sep=$(space)
ifeq ($(LINKER),wlink)
  sep=,
else ifneq ($(findstring $(LINKER),$(BORLAND_LINKERS)),)
  sep=+
else
  $(error can't define sep)
endif

# replaces space with $(sep)
subst_files = $(subst $(space),$(sep),$(files))

tasm32_exe="../../tools/bin/tasm32.exe"

# leeres echo mit . ergibt ein newline - da darf nur nix drueber/drunter stehen

define my_func
	@echo.
	@echo "Hallo, $(1)!"
endef

# print result
info:
	@echo "make_cmd: $(make_cmd)"
	@echo "CONFIG: $(CONFIG)"
	@echo "ASSEMBLER: $(ASSEMBLER)"
	@echo "LINKER: $(LINKER)"
	@echo "files: $(files)"
	@echo "subst_files: $(subst_files)"
#	$(tasm32_exe)
	$(call my_func,Welt)
	$(call my_func123,Tralala)

asmorig:
	cd asmorig
	make -f makefile.gnu $(MAKE_PARAMS)
	cd ..

clean:
#	cd dos
#	make -f makefile.gnu clean
#	cd ..
#	cd c
#	make -f makefile.gnu clean
#	cd ..
#	cd asm
#	make -f makefile.gnu clean
#	cd ..
	cd asmorig
	make -f makefile.gnu clean
	cd ..
#	cd sdl
#	make -f makefile.gnu clean
#	cd ..
#	cd repldump
#	make -f makefile.gnu clean
#	cd ..
