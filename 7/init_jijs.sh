#!/bin/bash -l

# EXECUTION: ./init_jijs.sh 
# The script requires having the "symcof" and "out_last" files present in the same directory where it is executed
# - The indices of intrinsically magnetic ions are extracted from "out_last"
# - The ions with magnetic moments larger than 0.5 \mu_B will be considered in the Jij calculation.
# OUTPUT:
# A set of green.inp-$N, where $N is the index of a magnetic ion, which can be used one after another.


grep 'sites of' symcof > tt
# Number of types
ntypes=`wc -l tt| awk '{print $1}'`

# number of sites of each type
Iat=0
for i in `seq 1 $ntypes` ; do
sites[$i]=`sed -n "$i"p tt | awk '{print $1}'`

for j in `seq 1 ${sites[$i]}` ; do
site_of_type[$Iat+$j]=$j
typ_array[$Iat+$j]=$i
done
let Iat=Iat+${sites[$i]}
#echo $ii
done

#echo "site of type"  ${site_of_type[*]}
#echo "types"  ${typ_array[*]}

# total number of atoms
let Natoms=Iat
#echo "Nat" $Natoms

# Array containing type index of every atom
# echo ${typ_array[*]}

let nlines=ntypes+3
#echo $nlines
grep -"$nlines" "MAGNETIC MOMENTS"  out_last | tail -"$ntypes" | awk  '{printf "%f\n",  sqrt($2^2)}' > ttt
cat ttt
for i in `seq 1 $ntypes` ; do
magmom=`sed -n "$i"p ttt`
jijflag[i]=`echo $magmom'>'0.5 | bc -l`
done
#echo ${jijflag[*]}

jijatoms=0
for i in `seq 1 $Natoms` ; do
if [ ${jijflag[${typ_array[$i]}]} -eq 1 ]
then
#echo $i ${typ_array[$i]}
let jijatoms=jijatoms+1
let global_index[jijatoms]=$i
fi
done

for i in `seq 1 $jijatoms` ; do
cat > green.inp-$i <<EOF
matsubara
1200 60 60 0

inputoutput
.false. .false. .false.

projection 
1

verbose
Interface

isoexch
1 
${global_index[$i]}
-3.0
$jijatoms
${global_index[*]}

cluster
$jijatoms 0                   ! ntot udef [nsites]
EOF

for j in `seq 1 $jijatoms` ; do

cat << EEE  >> green.inp-$i
${typ_array[${global_index[$j]}]} 2 1 ${site_of_type[${global_index[$j]}]} 0
EEE
done

done

rm -f tt
rm -f ttt



