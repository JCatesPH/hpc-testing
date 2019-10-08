#!/bin/bash
#SBATCH -o ausurf.%j.out
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=26G

#######################################
TODAY=$(date) 

echo ${TODAY}

echo "Starting AUSURF test at: $(date)"

srun -n $PROCSREQ "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/AUSURF112/ausurf.in &> "$CURROUTDIR"/AUSURF_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo "$(date)"
