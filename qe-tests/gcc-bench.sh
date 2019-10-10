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

export COMMONDIR="/scratch/hpc-testing/qe-tests"

export TOUTPUTDIR="/scratch/hpc-testing/qe-tests/gcc-openmpi"

# Needed for intel mpi to work.
#export I_MPI_PMI_LIBRARY="/lib64/libpmi.so"

# Set a parameter for number of processors.
export PROCSREQ=$1

# Set the output directory.
export CURROUTDIR="/scratch/hpc-testing/qe-tests/gcc-openmpi"

# Set the configuration label.
export CURRCONFIG="gcc0"

# Set the location of quantum espresso executable.
export QELOC="/scratch/hpc-testing/qe-tests/q-e/bin"

#=====================================#
# Start the sbatch submissions.

echo
echo "Submitting AUSURF script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ /scratch/hpc-testing/qe-tests/scripts/ausurf.sh 
echo "Done"
echo 

echo
echo "Submitting GRIR443 script."
sbatch -n $PROCSREQ --job-name=grir443-$PROCSREQ /scratch/hpc-testing/qe-tests/scripts/grir443.sh 
echo "Done"
echo 

echo
echo "Submitting GRIR686 script."
sbatch -n $PROCSREQ --job-name=grir686-$PROCSREQ /scratch/hpc-testing/qe-tests/scripts/grir686.sh 
echo "Done"
echo 

echo
echo "Submitting PSIWAT script."
sbatch -n $PROCSREQ --job-name=psiwat-$PROCSREQ /scratch/hpc-testing/qe-tests/scripts/psiwat.sh 
echo "Done"
echo 

echo
echo "Submitting PSIWAT script."
sbatch -n $PROCSREQ --job-name=zro-$PROCSREQ /scratch/hpc-testing/qe-tests/scripts/zro.sh 
echo "Done"
echo 


echo "All scripts submitted."
echo "PROCSREQ="$PROCSREQ
echo