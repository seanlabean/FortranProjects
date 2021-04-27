#
# Location of HDF5 binaries (with include/ and lib/ underneath)
HDF5 = /sw/arch/RedHatEnterpriseServer7/EB_production/2019/software/HDF5/1.10.2-foss-2018b

# Location of External Libraries
#LIBZ    = /sw/arch/RedHatEnterpriseServer7/EB_production/2019/software/HDF5/1.10.2-foss-2018b/lib
#LIBSZ   = /sw/arch/RedHatEnterpriseServer7/EB_production/2019/software/HDF5/1.10.2-foss-2018b/lib

LIB_HDF5  = -L ${HDF5}/lib -Wl,-rpath,${HDF5}/lib -lhdf5 -lhdf5_fortran -lz -ldl -lsz

# Compiler
FC      = /sw/arch/RedHatEnterpriseServer7/EB_production/2019/software/OpenMPI/3.1.1-GCC-7.3.0-2.30/bin/mpifort

# ------ No machine-specific paths/variables after this  -----

FORTRANLIB=-I$(HDF5)/include $(HDF5)/lib/libhdf5_fortran.a

FSOURCE = read_file hello_world # fileexample
OBJECTS = read_file.o hello_world.o # file_example.o

FLAGS   = -c  
LIBSHDF   = $(FORTRANLIB) $(HDF5)/lib/libhdf5.a 
LIB       = $(LIB_HDF5) -lm

all:    $(FSOURCE)

read_file: read_file.f90
	$(FC) -o $@ read_file.f90 $(LIBSHDF) $(LIB)
hello_world: hello_world.f90
	$(FC) -o $@ hello_world.f90 $(LIBSHDF) $(LIB)

clean:
	rm -f $(FSOURCE) $(OBJECTS) *.h5

.f90.o: $(FSOURCE)
	$(FC) $(FLAGS) $?
.SUFFIXES:.o.c.f90
