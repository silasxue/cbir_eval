%run_mcmc_test.m
fname = 'gift_me.txt';
for iterate = 1:10
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
CRM = max(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is: %f\n',CRM);

clear all;
