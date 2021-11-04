#!/bin/bash -l

for i in 1 2 ; do

cp green.inp-$i green.inp
mpprun -np 64 rspt
cp out out-jij-$i

echo "DONE" $i

done
