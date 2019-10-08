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
export CURROUTDIR="/scratch/qe-testing/icc"

# Set the configuration label.
export CURRCONFIG="icc0"

# Set the location of quantum espresso executable.
export QELOC="/scratch/qe-testing/q-e/bin"

#=====================================#
# Start the sbatch submissions.

echo
echo "Submitting GRIR443 script."
sbatch -n 2 --job-name=grir443-2 /scratch/qe-testing/scripts/grir443.sh 
echo "Done"
echo 

#--dependency=afterany:310696

echo
echo "Submitting GRIR686 script."
sbatch -n 6 --job-name=grir686-6 /scratch/qe-testing/scripts/grir686.sh 
echo "Done"
echo 
