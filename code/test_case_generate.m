% test case creation
% create a random set of computer scores for a given set of human scores
%
N = 2500; % number of ground truth data
rand_computer_scores = rand(2500,1);
fid = fopen('computer_rand.dat','w');
for i = 1:N
    fprintf(fid,'%f\n',rand_computer_scores);
end
fclose(fid);