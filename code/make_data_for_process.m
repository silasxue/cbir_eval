function EXIT_SUCCESS = make_data_for_process(file)
fname = file;
% making dat files for 
X = load(fname);
fid1 = fopen('/home/nvs/retrieval_analyzer_project/code/computer.dat','w');
fid2 = fopen('/home/nvs/retrieval_analyzer_project/code/human.dat','w');
N =  length(X)
for i= 1:N
    fprintf(fid1,'%f\n',X(i,3));
    fprintf(fid2,'%f\n',X(i,4));
   
end
fclose(fid1);
fclose(fid2);
