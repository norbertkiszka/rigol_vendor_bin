CC=gcc
LC_ALL=C
SED=sed

FLAGS = -Wall -Wno-pointer-sign
CFLAGS = -O2 $(FLAGS)
LFLAGS = -s
XCFLAGS = -DMINGW $(FLAGS)
XLFLAGS = -s

INC = rigol_vendor_bin.h
PROGS = rigol_vendor_bin

all: $(PROGS)

RIGOL_OBJ = rigol_vendor_bin.o aes.o xxtea.o crc32.o strings.o
RIGOL_XOBJ = rigol_vendor_bin.obj aes.obj xxtea.obj crc32.obj strings.obj

%.obj: %.c $(INC)
	$(CC) $(XCFLAGS) -c $< -o $@

%.o: %.c $(INC)
	$(CC) $(CFLAGS) -c $< -o $@

rigol_vendor_bin: $(RIGOL_OBJ)
	$(CC) $(LFLAGS) -O2 -o $@ $^

clean:
	rm -f *~ *.obj *.o *.dec *.enc # $(PROGS)
