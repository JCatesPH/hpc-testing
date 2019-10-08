#!/bin/bash

TODAY='date +"%F"'

echo ${TODAY}

# Enable the dotkit.
eval `/share/apps/dotkit/init -b`

# Load the modules that we need.
use fftw3_gcc540
use gcc5.4.0
use hdf5-1.10.4GCC
use openmpi3.1.1


export TOUTPUTDIR="/scratch/qe-testing/gcc-openmpi"

# Needed for intel mpi to work.
#export I_MPI_PMI_LIBRARY="/lib64/libpmi.so"

#=====================================#
# Start the sbatch submissions.
echo
echo "Submitting ZrO script."
sbatch /scratch/qe-testing/scripts/zro-gcc.sh
echo "Done"
echo 

echo
echo "Submitting AUSURF script."
sbatch /scratch/qe-testing/scripts/ausurf-gcc.sh
echo "Done"
echo 

echo
echo "Submitting CNT10POR8 script."
sbatch /scratch/qe-testing/scripts/cnt10por8-gcc.sh
echo "Done"
echo

echo
echo "Submitting GRIR443 script."
sbatch /scratch/qe-testing/scripts/grir443-gcc.sh
echo "Done"
echo 

echo
echo "Submitting GRIR686 script."
sbatch /scratch/qe-testing/scripts/grir686-gcc.sh
echo "Done"
echo 

echo
echo "Submitting PSIWAT script."
sbatch /scratch/qe-testing/scripts/psiwat-gcc.sh
echo "Done"
echo 

echo "All scripts submitted."
echo