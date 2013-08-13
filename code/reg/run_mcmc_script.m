%run_mcmc_test.m
fname = 'log_fs1_ncm_ns-16_blobs.txt';
for iterate = 1:50
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is: %f %f\n',CRM,CRV);

clear all;

%ann 
for iterate = 1:50
    fname = 'ann_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

for iterate = 1:50
    fname = 'log_fs2_ncm_ns-16_blobs.txt';  
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)
CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);

clear all;

for iterate = 1:50
    fname = 'log_without_human_fs1_ncm_ns-16_blobs.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)
CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);

clear all;


for iterate = 1:50
    fname = 'log_without_human_fs2_ncm_ns-16_blobs.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% GIFT
for iterate = 1:50
    fname = 'gift_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% SIMP
for iterate = 1:50
    fname = 'simp_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% ROMM-ALL-NO-LOG
for iterate = 1:50
    fname = 'romm_abs_no_log_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% ROMM-TEST-NO-LOG
for iterate = 1:50
    fname = 'romm_abs_no_log_test.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% RWMM-ALL-NO-LOG
for iterate = 1:50
    fname = 'rwmm_abs_no_log_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% RWMM-TEST-NO-LOG
for iterate = 1:50
    fname = 'rwmm_abs_no_log_test.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% ROMM-ALL-LOG
for iterate = 1:50
    fname = 'log_romm_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% ROMM-TEST-LOG
for iterate = 1:50
    fname = 'log_romm_test.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% RWMM-ALL-LOG
for iterate = 1:50
    fname = 'log_rwmm_all.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;

% RWMM-TEST-LOG
for iterate = 1:50
    fname = 'log_rwmm_test.txt';
    make_data(fname);
    [s,w] = system('mcmc_exec');
    CRi = fit_plot_reg(fname);
    CR(iterate) = CRi;
end
mean(CR)

CRM = mean(CR)
CRV = std(CR)
newDir = '/home/nvs/papers/cvpr_05/mapping/result_files/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'results.txt');
newFileid = fopen(newfilename,'a');
fprintf(newFileid,'The correlation measure (sample) using combined reg is:%f %f\n',CRM,CRV);
clear all;


