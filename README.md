# Al<sub>0.3</sub>CoCrFeNi: Atomistics: Dislocation/obstacle interactions

## Foreword

The purpose of this project is to simulate dislocation/void interactions and dislocation/precipitate interactions using atomistic simulations in random Al<sub>0.3</sub>CoCrFeNi multi-principal element alloy (MPEA). To provide references, the dislocation/void interactions are also done in Ni.

Please read [these journal articles](https://drive.google.com/drive/folders/1Pfg0ZztTd7QkhRMLABwpwrZFWDxasoBQ?usp=sharing) to understand dislocatino/obstacle interactions and the effects of obstacle on mechanical properties in MPEAs and pure metals using atomistic simulations.

## LAMMPS

Following [a related project](https://github.com/shuozhixu/HEAM_2025), we can build LAMMPS with the MANYBODY package and submit jobs on [OSCER](http://www.ou.edu/oscer.html).

We will use the [Farkas-Caro potential](https://doi.org/10.1557/jmr.2020.294) for all simulations.

## Dislocation/obstacle interactions

Calculate the interactions between an obstacle and an edge or a screw dislocation at 5 K. The atomsk scripts that are used to build the atomistic structures can be found in this GitHub repository. The same LAMMPS input files from [a related project](https://github.com/shuozhixu/MaterLett_2025) are used.

The obstacle is either a void or a precipitate. Four types of precipitates are considered: B2, L1<sub>2</sub>, random face-centered cubic, and random body-centered cubic.

## Reference

If you use any files from this GitHub repository, please cite

- Shuozhi Xu, Wu-Rong Jian, Irene J. Beyerlein, [Ideal simple shear strengths of two HfNbTaTi-based quinary refractory multi-principal element alloys](http://dx.doi.org/10.1063/5.0116898), APL Mater. 10 (2022) 111107