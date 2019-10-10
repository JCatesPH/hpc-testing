#!/bin/bash
#SBATCH -o grir686.%j.out
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=424G

#######################################
TODAY=$(date) 

echo ${TODAY}

echo "Starting GRIR686 test at: $(date)"

srun -n "$PROCSREQ" "$QELOC"/pw.x -in "$COMMONDIR"/benchmarks/GRIR686/grir686.in &> "$CURROUTDIR"/GRIR686_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo "$(date)"

