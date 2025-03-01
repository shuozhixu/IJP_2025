#!/usr/bin/bash

rm -f *.lmp

a=3.55
d=201.638
e=250.595

x=$(echo "scale=5;$d*$a/3.326" | bc)

y=$(echo "scale=5;$e*$a/3.326" | bc)

b=$(echo "scale=5;$a*sqrt(2.)/2." | bc)

atomsk --create fcc $a Ni orient [-1-12] [111] [-110] -duplicate 99 87 120 supercell.cfg

atomsk supercell.cfg -dislocation $x $y screw z y $b dis.imd

c=$(echo "scale=5;$b/2." | bc)

awk -v var="$c" 'NR==3 {$4=var} {print}' dis.imd > dis_mod.imd

atomsk dis_mod.imd -alignx screw_Ni_40nm_pad.xsf

atomsk screw_Ni_40nm_pad.xsf screw_Ni_40nm_pad.cfg

awk -v var="Ni" 'NR==16 {$1=var} {print}' screw_Ni_40nm_pad.cfg > screw_Ni_40nm_pad_mod.cfg

rm screw_Ni_40nm_pad.cfg

atomsk screw_Ni_40nm_pad_mod.cfg screw_Ni.cfg

#rm *.cfg *.imd *.xsf screw_Ni.lmp

atomsk screw_Ni.cfg -select random 1431433 Ni -sub Ni Co NiCo.cfg

atomsk NiCo.cfg -select random 1431433 Ni -sub Ni Cr NiCoCr.cfg

atomsk NiCoCr.cfg -select random 1431433 Ni -sub Ni Fe NiCoCrFe.cfg

atomsk NiCoCrFe.cfg -select random 429639 Ni -sub Ni Al data.NiCoCrFeAl_random_screw.cfg

#atomsk data.NiCoCrFeAl_random_screw.cfg -info

#atomsk data.NiCoCrFeAl_random_edge.cfg -remove-atoms select within_sphere 200.0 250.0 150.0 5 data.NiCoCrFeAl_random_void.cfg
atomsk data.NiCoCrFeAl_random_screw.cfg -select in sphere 0.85*box 0.50*box 0.50*box 48.4 -rmatom select sphere.cfg

atomsk --create CsCl 2.882 Ni orient [1-1-2] [110] [1-11] -duplicate 61 131 60 new_Ni.cfg

#atomsk --create L12 3.541 Ni Al orient [-1-12] [111] [-110] -duplicate 50 87 60 L12.cfg   #Ni3Al

atomsk new_Ni.cfg -select out sphere 366.619 267.472 150.613 48.3 -rmatom select sphere_Ni.cfg

atomsk sphere_Ni.cfg -select random 19725 Ni -sub Ni Al sphere_NiAl.cfg

atomsk --merge 2 sphere.cfg sphere_NiAl.cfg output.cfg lmp

mv output.lmp data.HEA_screw_B2_random

#rm -f *.cfg *.imd *.xsf
