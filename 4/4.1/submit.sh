#!/bin/bash -l
#SBATCH -A p2013235
#SBATCH -p node
#SBATCH -N 1
#SBATCH -t 12:00:00
#SBATCH -J tst

module load intelmpi/4.1 intel/14.0
export RSPT_SCRATCH=`pwd`

for i in 6 11 17 26 ; do 

link_spts "$i"_no

../../runs "mpirun -np 16 ../../rspt" 1e-12 99

cp out out-kpt-$i

done

echo "FINISHED"

