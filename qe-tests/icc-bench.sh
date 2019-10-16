#!/bin/bash

TODAY=$(date +"%F")

echo ${TODAY}

# Enable the dotkit.
eval `/share/apps/dotkit/init -b`

# Load the modules that we need.
use IntelCompilers2018
use hdf5-1.10.4Intel

# Needed for intel mpi to work.
export I_MPI_PMI_LIBRARY="/lib64/libpmi.so"

# Set a parameter for number of processors.
export PROCSREQ=$1

# Set the output directory.
export CURROUTDIR=$PWD"/icc"

# Set the configuration label.
export CURRCONFIG="icc0"

# Set the location of quantum espresso executable.
export QELOC=$PWD"/q-e/bin"

#=====================================#
# Start the sbatch submissions.

echo
echo "Submitting AUSURF script."
sbatch -n $PROCSREQ --job-name=ausurf-$PROCSREQ $PWD/scripts/ausurf.sh 
echo "Done"
echo 

echo
echo "Submitting GRIR443 script."
sbatch -n $PROCSREQ --job-name=grir443-$PROCSREQ $PWD/scripts/grir443.sh 
echo "Done"
echo 

echo
echo "Submitting GRIR686 script."
sbatch -n $PROCSREQ --job-name=grir686-$PROCSREQ $PWD/scripts/grir686.sh 
echo "Done"
echo 

echo
echo "Submitting PSIWAT script."
sbatch -n $PROCSREQ --job-name=psiwat-$PROCSREQ $PWD/scripts/psiwat.sh 
echo "Done"
echo 

echo "All scripts submitted."
echo "PROCSREQ="$PROCSREQ