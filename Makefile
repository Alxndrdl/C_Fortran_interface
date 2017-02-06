FC = "C:\Program Files\mingw-w64\x86_64-5.3.0-posix-seh-rt_v4-rev0\mingw64\bin\gfortran"
FCFLAGS = -ffree-line-length-none
CC = "C:\Program Files\mingw-w64\x86_64-5.3.0-posix-seh-rt_v4-rev0\mingw64\bin\gcc"
CCFLAGS = 
LD = "C:\Program Files\mingw-w64\x86_64-5.3.0-posix-seh-rt_v4-rev0\mingw64\bin\gcc"
LDFLAGS =

all: test_fortranInC

main.o: main.c
	$(CC) $(CCFLAGS) -c main.c -o $@

codeFortran.o: codeFortran.f90
	$(FC) $(FCFLAGS) -c codeFortran.f90 -o $@

test_fortranInC: codeFortran.o main.o
	$(LD) $(LDFLAGS) codeFortran.o main.o -o $@
