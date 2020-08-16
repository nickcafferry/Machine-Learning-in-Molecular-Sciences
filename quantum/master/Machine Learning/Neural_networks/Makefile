CXX = icc
CC  = icc

EXEC = Machine_Learning.exe 

Fast_CG =  CG_Network_Streamlined.o

MKLROOT  = /opt/intel/mkl
CXXFLAGS = -O2 -Wall -fopenmp
INCLUDE  = -DMKL_ILP64 -m64 -I${MKLROOT}/include 
LDLIBS   = -L${MKLROOT}/lib/intel64_lin -lmkl_intel_ilp64 -lmkl_scalapack_ilp64 -lmkl_cdft_core -lmkl_core -lmkl_sequential -lmkl_blacs_ilp64 -lpthread -lm -ldl -fopenmp

fast_cg : copy_c $(Fast_CG)  
	$(CXX) $(Fast_CG) $(CXXFLAGS) $(LDLIBS) -o ./$(EXEC)

copy_c : 
	#cp Fast_Conjugate_Network.cpp Fast_Conjugate_Network.c	

clean:
	rm -f *.o   
	rm -f $(EXEC)


%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c  $(<) $(outputs)


