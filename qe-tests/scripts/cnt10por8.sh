#!/bin/bash
#SBATCH --job-name=cnt10por8
#SBATCH -o cnt10por8.%j.out
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=852G

#######################################
TODAY=$(date) 

echo ${TODAY}

echo "Starting CNT10POR8 test at: $(date)"

srun -n $PROCSREQ "$QELOC"/pw.x -in /scratch/qe-testing/benchmarks/CNT10POR8/pw.in &> "$CURROUTDIR"/CNT10POR8_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo $TODAY

