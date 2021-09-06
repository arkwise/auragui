# Phoenix 1.2 Makefile
# Written by Lukas Lipka and Julien Etelain

CFLAGS   = -O3 -funroll-loops -Iinclude -Idjgpp/watt32/inc -Ldjgpp/watt32/lib
CPPFLAGS = -O3 -funroll-loops -Iinclude -Idjgpp/watt32/inc -Ldjgpp/watt32/lib

REMOVE = del
OBJ_DIR = obj
DYNLDLNK = dynldlnk.exe
MAIN = bin/main.exe
OBJ_LIST2 = $(OBJ_DIR)/vfile/msdos.o
LIB_LIST = lib/libz.a -lalttf -lalleg -lwatt lib/libmpeg2.a
LIB_DYNLNK = lib/libz.a

include common.mak 