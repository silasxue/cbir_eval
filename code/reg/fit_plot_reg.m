function [CR,reg_error] = fit_plot_reg(fname)
% compute the correlation after bayesian mapping
%
% plot the fit and residuals
C = load('computer.dat');
[C,I] = sort(C,'descend');
H = load('human.dat');
Hi = H(I);
av = load('human_preds.dat');
cred = (av(:,1));
pred = av(:,3);
%calib = H(ind);

Co = corrcoef(pred,H)

Cf = load('full_computer.dat');
Hf = load('full_human.dat');

NUM = length(Cf)
NUM1 = length(pred)
for i = 1:length(Cf)
    [ closest,closestI] = sort((cred - Cf(i)).^2);
    lambda = sqrt(closest(1))/(ceil(NUM/NUM1));
    hy_mapped(i) = (lambda)*pred(closestI(1)) + (1-lambda)*pred(closestI(2));
end            
size(hy_mapped)
size(Hf)
reg_error = corr(hy_mapped',Hf)
       



%newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
%newF = strcat(newDir,fname);
%newfilename = strcat(newF,'results.txt');
%newFileid = fopen(newfilename,'a');
%fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f\n',Co(1,2));
%fprintf(newFileid,'The correlation measure (whole) using combined ccm is:%f\n',whole_mean);
%fclose(newFileid);
CR = Co(1,2)
return

%figure
%plot(cx,pred,'r-');
%xlabel('Keyword system scores');
%ylabel('Calibrated human scores');
%title('Mapping function for Keyword system using the bayesian fitting method');
%legend('Scatter plot of the Keyword scores and calibrated human scores','Mapping function'); 
