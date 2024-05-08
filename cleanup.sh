#!/bin/bash
rm beta.yaml
wget https://raw.githubusercontent.com/jotego/jtcores/master/beta.yaml
CORES=$(grep -v '^#' beta.yaml | cut -d: -f1 | sed 's/\(.*\)/jt\1.bit/g')
for i in $CORES
do
  rm -v _Arcade_*/cores/$i
  BASE=$(basename $i .bit)
  grep -rlZ "rbf.*${BASE}.*rbf" .  | xargs -0 rm -v
done
rm -rvf _Arcade_*/attic
rm -rvf _Arcade_*/_alternatives
rm -rvf _Arcade_*/inactive
rm -v _Console/*mgl
