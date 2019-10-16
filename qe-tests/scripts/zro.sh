#!/bin/bash
#SBATCH --output=zro
#SBATCH -p threaded
#SBATCH --qos threaded
#SBATCH --mem=8G

#######################################
TODAY=$(date) 

echo ${TODAY}

# Export PMI library for intel mpi to use srun.
export I_MPI_PMI_LIBRARY="/lib64/libpmi.so"


########################################

echo "Starting ZrO test at: $(date)"

srun -n $PROCSREQ "$QELOC"/pw.x -in "$COMMDIR"/my_bench/ZrO/ZrO.in &> "$CURROUTDIR"/ZrO_"$CURRCONFIG"_$(date +"%m_%d_%Y")_n"$PROCSREQ".out

wait $!
echo "========================="
echo "Job complete!"
echo "$(date)"
