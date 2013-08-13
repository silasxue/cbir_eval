function EXIT_SUCCESS = clmsSys(computerf,humanf,nIterations,systemid)
cname = computerf;
hname = humanf;
% CLMSSYS: Constrained Least Means Square estimation
% EXIT_SUCCESS = clmsSys(computer,human,samples,nIterations) attempts to
% solve the constrained least means squared problem:
% find x such that |y-x|^2 is minimized given that x is monotonic.
%
% Parameters:
% computer : vector of computer scores
% human : vector of corresponding human scores
% sampes : number of samples used for fitting
% nIterations: number of iterations
%
% Functions called:
%
% getRand(file,num) - samples num number of samples from a data file
%
% EXIT_SUCCESS = clmsSys(computer,human, nIterations);
% solves the same problem assuming 100 samples.
%
%
%
%    exit conditions are
%
%     1  QUADPROG converged with a solution X.
%     3  Change in objective function value smaller than the specified tolerance
%
%     4  Local minimizer found.
%     0  Maximum number of iterations exceeded.
%    -2  No feasible point found.
%    -3  Problem is unbounded.
%    -4  Current search direction is not a direction of descent; no further
%         progress can be made.
%    -7  Magnitude of search direction became too small; no further progress can
%         be made.
%
%   Copyright 2004-2005 Computer Vision Lab, University of Arizona.
%   Author: Nikhil V Shirahatti
%   Date: 02/12/2005 (Revision #2)


%
% check input to program
%
echo off;

if nargin < 3
    error('Not enough Inputs','CLMSS requires atleast three input arguments');
elseif nargin == 3
    GO = 1;
    MAX = nIterations;
else    
    MAX = nIterations;
    GO = 0;
end
%
% samples
MAX =10;
nsamples = [100 200 300 400 500];
samples = nsamples;
if GO == 1
    numcycles = 5;
else
    numcycles = 1;
end
for k = 1:5
    echo off;
    %
    % Initialize parameters
    %
    NUM1 = nsamples(k);    
    hy_estimate = rand(NUM1,1);
    computer = load(cname);
    human = load(hname);
    %
    % Iterate till nIteration criterion is satisfied
    %
    for iterate=1:MAX
        test_length = load(computerf);
        data_length= length(test_length);
        cf =  load(computerf);	
        cfnew = cf;
	    hf = load(computerf);
        %
        % Since entire data has too many variables, sample only a fraction of it
        % for fitting purposes
        %	
        [cdata,hdata] = getRand(computerf,humanf,NUM1);
        %
        % setting up conditions to apprx this function
        %
        [cx,ind] = sort(cdata);
        %
        % independent variable
        %
        hy = hdata(ind);
        %
        % formulating the problem
        %
        cx_new = cx;
        hy_new = hy;
        NUM = data_length;
        NUM1;
        %
        % set up the matrices for the quadprog
        %
        % X=QUADPROG(H,f,A,b) attempts to solve the quadratic programming
        % problem
        % min 0.5*x'*H*x + f'*x   subject to:  A*x <= b
        %  x
        %
        H = eye(NUM1);
        d1 = diag(ones(NUM1,1),0);
        d2 = diag(-ones(NUM1,1),1);
        A = d1 + d2(1:NUM1,1:NUM1);
        %     A(NUM1,NUM1-2) =1;
        %     A(NUM1,NUM1) = -1;
        [ra,ca] = size(A);
        f = -hy_new(1:NUM1)'; % the sampled human data
        [rf,cf] = size(f);
        f = f(1,1:ra);
        hy_sampled = hy_new(1:NUM1);
        cx_sampled = cx_new(1:NUM1);
        hy_sampled = hy_sampled(1:ra,1);
        cx_sampled = cx_sampled(1:ra,1);
        [cx_sampled,I2] = sort(cx_sampled);
        hy_sampled = hy_sampled(I2);
        b = zeros(NUM1,1);
        lb = zeros(NUM1,1);
        ub = 5;
        x0 = rand(NUM1,1);
        options = optimset('LargeScale','off');
        [hy_estimate,fval,exitflag,output,flag] = quadprog(H,f,A,b,[],[],min(hy_sampled),max(hy_sampled),x0,options);
        if exitflag < 0
            error('Quadprog has failed to converge');
            exit;
        end
        %
        % Correlation measure for the sampled data
        %
        icorrsample{iterate} = corrcoef(hy_estimate,hy_sampled);
        %
        % interpolation
        %         
        NUM = length(hf);                	
	NUM;
        for i = 1: NUM	
            [ closest,closestI] = sort((cx_sampled - cfnew(i)).^2);
            lambda = sqrt(closest(1))/(ceil(NUM/NUM1));
            hy_mapped(i) = (lambda)*hy_estimate(closestI(1)) + (1-lambda)*hy_estimate(closestI(2));
        end            
    size(hy_mapped)
    size(hf)
    euclid_error{iterate} = sum((hy_mapped' - hf).^2)/data_length;
    end    
    
    
    %
    % calculating mean and standard deviation for correlation values for sample
    % data
    %     
    for i=1:iterate
        rec_corr_sample(i) = icorrsample{i}(1,2);
	rec_euclid_error(i) = euclid_error{i};
    end
    %
    % Results
    %
    sample_mean(k) = mean(rec_corr_sample);
    sample_var(k) = var(rec_corr_sample);
    sample_euclid_error(k) = mean(rec_euclid_error);
    sample_euclid_std(k) = std(rec_euclid_error);
end
[low_rec, index_low] = min(sample_euclid_error);
sample2_mean = sample_mean(index_low)
sample2_var = std(sample_mean)
%
% write to file
%
newDir = '/home/nvs/retrieval_analyzer_project/result/';
newF = strcat(newDir,num2str(systemid));
newF2 = strcat(newF,'_clms_results.txt');

newFileid = fopen(newF2,'w');
fprintf(newFileid,'The correlation measure (sample) using combined clms is: %f %f\n',sample2_mean,sample2_var);
fclose(newFileid);
%
% save an image of error
%
%
xsamples = samples./3000;
handle_figure = figure;
axis([0 1 0 max(sample_euclid_error)]);
errorbar(xsamples, sample_euclid_error, sample_euclid_std/3, sample_euclid_std/3);
xlabel('Number of data points');
ylabel('Euclidean error');
title('The Euclidean error vs. number of data points');
fig = '/home/nvs/retrieval_analyzer_project/result/clms_euclid_points';
fig2draw = strcat(fig,num2str(systemid));
print(handle_figure,'-dpsc',fig2draw);


clear all;
% 
% check error 
%
EXIT_SUCCESS = 1;
