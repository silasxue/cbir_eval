CPPFLAGS=-Wall -O4 -pedantic -Wno-deprecated -ansi
LIBS=-lgsl -lgslcblas
CXX=g++
TARGETS=mvn_spline_fitting mvn_spline_clustering mvn_spline_mcmc_clustering spline_mcmc constrained_spline_mcmc

all: $(TARGETS)

clean:
	rm -f $(TARGETS) *.o

mvn_spline_fitting: mvn_spline_fitting.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o 
	$(CXX) $(CPPFLAGS) -o mvn_spline_fitting mvn_spline_fitting.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o  $(LIBS)

mvn_spline_clustering: mvn_spline_clustering.o glm_mvn_clustering.o cluster_glm_mvn.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o 
	$(CXX) $(CPPFLAGS) -o mvn_spline_clustering mvn_spline_clustering.o glm_mvn_clustering.o cluster_glm_mvn.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o  $(LIBS)

mvn_spline_mcmc_clustering: mvn_spline_mcmc_clustering.o glm_mvn_mcmc_clustering.o glm_mvn_clustering.o cluster_glm_mvn.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o 
	$(CXX) $(CPPFLAGS) -o mvn_spline_mcmc_clustering mvn_spline_mcmc_clustering.o glm_mvn_mcmc_clustering.o glm_mvn_clustering.o cluster_glm_mvn.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o  $(LIBS)

spline_mcmc: spline_mcmc.o mcmc_spline_regression.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o 
	$(CXX) $(CPPFLAGS) -o spline_mcmc spline_mcmc.o mcmc_spline_regression.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o  $(LIBS)

constrained_spline_mcmc: constrained_spline_mcmc.o mcmc_spline_regression.o  mcmc_constrained_spline_regression.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o 
	$(CXX) $(CPPFLAGS) -o  constrained_spline_mcmc constrained_spline_mcmc.o mcmc_constrained_spline_regression.o mcmc_spline_regression.o glm_mvn.o glm.o spline_regression.o basis_fn.o mcmc.o regression.o DataObj.o $(LIBS)


