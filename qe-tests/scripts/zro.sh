#!/bin/bash
#SBATCH --output=zro
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=8G

#######################################
TODAY=$(date) 

echo ${TODAY}

########################################

echo "Starting ZrO test at: $(date)"

srun -n $PROCSREQ "$QELOC"/pw.x -in "$COMMONDIR"/my_bench/ZrO/ZrO.in &> "$CURROUTDIR"/ZrO_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo "$(date)"
