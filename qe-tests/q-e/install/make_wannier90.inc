#=======================================
# WANNIER90 	
#=======================================

TOPDIR = /scratch/qe-testing/q-e

F90=mpiifort
FCOPTS=$(FFLAGS) -nomodule 
LDOPTS= 

LIBS =    -lmkl_intel_lp64  -lmkl_sequential -lmkl_core 
