function EXIT_SUCCESS = make_data(file,nsamples,N)
fname = file;
% making dat files for fit_plot and constrained_mcmc to work
X = load(fname);
C = X;
[cx,I] = sort(X(:,3));
fid1 = fopen('computer.dat','w');
fid2 = fopen('human.dat','w');
fid3 = fopen('full_computer.dat','w');
fid4 = fopen('full_human.dat','w');

X = [X(I,1),X(I,2),X(I,3),X(I,4)];
sample = ceil(rand(nsamples,1).*length(X));
for i= 1:nsamples
        fprintf(fid1,'%f\n',(X(sample(i),3)));
	    fprintf(fid2,'%f\n',X(sample(i),4));        
    end

for i =1:N
        fprintf(fid3,'%f\n',C((i),3));
	    fprintf(fid4,'%f\n',C((i),4));        
end

fclose(fid1);
fclose(fid2);
fclose(fid3);
fclose(fid4);
