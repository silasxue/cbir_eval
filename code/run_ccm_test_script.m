%
% This function performs the ccm benchmarking
%
EXIT = 0;
% Input file 
fname1 = '/home/nvs/retrieval_analyzer_project/data/test.txt';
make_data_for_process(fname1);
fname1 = 'computer.dat';
fname2 = 'human.dat';
samples = [];
nIterations = 20;
exit_status  = ccmSys(fname1,fname2,nIterations,1);
