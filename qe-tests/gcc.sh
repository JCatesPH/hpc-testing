#!/bin/bash
# Move into the proper directory.
cd ./q-e

# Enable the dotkit.
#/share/apps/dotkit/init
eval `/share/apps/dotkit/init -b`

# Load the modules that we need.
use hdf5-1.10.4GCC
use openmpi3.1.1
use fftw3_gcc540

# Set the desired variables used by configure.
#--------------------------------------------#

#export ARCH= # Identifies the machine type.
# Above should be recognized without specifying.

#export F90= # Fortran90 Compiler 
# Above should not be used with mpi.

export F77="mpiifort" # Fortran77 Compiler
export CC="mpiicc" # C Compiler
export MPIF90="mpiifort" # Parallel Fortran90 Compiler
#export CPP="" # Source file preprocessor # Not sure what this does.
#export LD= # Linker
#export LIBDIRS= # Library search paths.

# Set the compiler flags.
#export CFLAGS="-O3 -mtune='ivybridge' -g -openmp"
#export FFLAGS=""
#export F90FLAGS=""
#export CPPFLAGS=""
#export LDFLAGS=""

# Set the linear algebra routines used.
#LA="-with-internal-blas -with-internal-lapack"  # Use the internal libraries.
#LA="-with-scalapack=yes"                        # Use the openmpi/none/intel with (yes/no/intel) 

# Enable or disable hdf5 and openmp.
#OMPOPT="-enable-openmp"
OMPOPT=""

#HDF5OPT="-with-hdf5=("/share/apps/hdf5/hdf5-1.10.4-gcc")"
HDF5OPT=""

pwd

#--------------------------------------------#
#make clean

# Run the configuration step.
./configure --prefix="/scratch/qe-testing/gcc-openmpi" $OMPOPT $HDF5OPT $LA

# Make the executables.
make all


# Run the test suite.
cd test-suite
make run-tests