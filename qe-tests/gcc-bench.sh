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

# Set the working common directory.
export COMMDIR=$PWD

# Set a parameter for number of processors.
export PROCSREQ=$1

# Set the output directory.
export CURROUTDIR=$PWD"/gcc-openmpi"

# Set the configuration label.
export CURRCONFIG="gcc0"

# Set the location of quantum espresso executable.
export QELOC=$PWD"/q-e/bin"

# Needed for intel mpi to work.
export I_MPI_PMI_LIBRARY="/lib64/libpmi.so"

#=====================================#
# Start the sbatch submissions.
echo
echo "Submitting ZrO script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ $PWD/scripts/zro.sh
echo "Done"
echo 

echo
echo "Submitting AUSURF script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ $PWD/scripts/ausurf.sh
echo "Done"
echo 

echo
echo "Submitting CNT10POR8 script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ $PWD/scripts/cnt10por8.sh
echo "Done"
echo

echo
echo "Submitting GRIR443 script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ $PWD/scripts/grir443.sh
echo "Done"
echo 

echo
echo "Submitting GRIR686 script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ$PWD/scripts/grir686.sh
echo "Done"
echo 

echo
echo "Submitting PSIWAT script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ $PWD/scripts/psiwat.sh
echo "Done"
echo 

echo "All scripts submitted."
echo