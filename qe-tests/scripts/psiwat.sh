#!/bin/bash
#SBATCH -o psiwat.%j.out
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=82G

#######################################
TODAY=$(date) 

echo ${TODAY}

echo "Starting PSIWAT test at: $(date)"

srun -n "$PROCSREQ" "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/PSIWAT/psiwat.in &> "$CURROUTDIR"/PSIWAT_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo "$(date)"

