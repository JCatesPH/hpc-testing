#!/bin/bash
#SBATCH -o grir443.%j.out
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=209G

#######################################
TODAY=$(date) 

echo ${TODAY}

echo "Starting GRIR443 test at: $(date)"

srun -n "$PROCSREQ" "$QELOC"/pw.x -in "$COMMDIR"/benchmarks/GRIR443/grir443.in &> "$CURROUTDIR"/GRIR443_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo "$(date)"

