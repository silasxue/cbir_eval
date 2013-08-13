%
% This function performs the clms benchmarking
%
EXIT = 0;
% Put in the name of the input file <4 column >
fname1 = '/home/nvs/retrieval_analyzer_project/data/test.txt';
make_data_for_process(fname1);
fname1 = '/home/nvs/retrieval_analyzer_project/code/computer.dat';
fname2 = '/home/nvs/retrieval_analyzer_project/code/human.dat';
samples = [];
% change number of iterations
nIterations = 20;
exit_status  = clmsSys(fname1,fname2,nIterations,1);

