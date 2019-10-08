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

# AUSURF
SJOPT="-n "$PROCSREQ" --job-name=ausurf_"$PROCSREQ" -o ausurf.%j.out -p threaded --qos threaded --mem=26G"
echo
echo "Starting AUSURF test at: $(date)"
srun $SJOPT "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/AUSURF112/ausurf.in &> "$CURROUTDIR"/AUSURF_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out
echo 

# CNT10POR8
SJOPT="-n "$PROCSREQ" --job-name=cnt10por8_"$PROCSREQ" -o cnt10por8.%j.out -p threaded --qos threaded --mem=852G"
echo
echo "Starting CNT10POR8 test at: $(date)"
srun $SJOPT "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/CNT10POR8/pw.in &> "$CURROUTDIR"/CNT10POR8_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out
echo 

# GRIR443
SJOPT="-n "$PROCSREQ" --job-name=grir443_"$PROCSREQ" -o grir443.%j.out -p threaded --qos threaded --mem=209G"
echo
echo "Starting GRIR443 test."
srun $SJOPT "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/GRIR443/grir443.in &> "$CURROUTDIR"/GRIR443_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out
echo 

# GRIR686
SJOPT="-n "$PROCSREQ" --job-name=grir686_"$PROCSREQ" -o grir686.%j.out -p threaded --qos threaded --mem=424G"
echo
echo "Starting GRIR686 test."
srun $SJOPT "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/GRIR686/grir686.in &> "$CURROUTDIR"/GRIR686_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out
echo 

# PSIWAT
SJOPT="-n "$PROCSREQ" --job-name=psiwat_"$PROCSREQ" -o psiwat.%j.out -p threaded --qos threaded --mem=82G"
echo
echo "Starting PSIWAT test."
srun $SJOPT "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/PSIWAT/psiwat.in &> "$CURROUTDIR"/PSIWAT_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out
echo 

echo "All jobs submitted."
echo "PROCSREQ="$PROCSREQ