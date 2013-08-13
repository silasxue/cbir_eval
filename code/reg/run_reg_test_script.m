%run_mcmc_test.m
run =1;
fname = 'test.txt';
fdirname = '/home/nvs/retrieval_analyzer_project/data/test.txt';
samples = [100 200 300 400 500 1000 2000];
CRM =[];
CRV =[];
for samp = 1:7
    for iterate = 1:10    
        N = length(load(fdirname))
        nsamples = samples(samp);
        make_data(fdirname, nsamples,N);
        [s,w] = system('mcmc_exec');
        [CRi,reg_error] = fit_plot_reg(fdirname);
        CR(iterate) = CRi;
        regerr(iterate) = reg_error;
    end
    [val,ind] = max(regerr);
    CRM(samp) = CR(ind);
    CRV(samp) = std(CR)
    CRE(samp) = mean(regerr);
    CREV = std(regerr);
end

handle_figure = figure;
xsamples = samples./3000;
errorbar(xsamples, CRE,CREV/3, CREV/3);
xlabel('number of data points');
ylabel('Correlation score');
title('The Correlation score  vs. number of data points');
fig = '/home/nvs/retrieval_analyzer_project/result/reg_points';
fig2draw = strcat(fig,num2str(run));
print(handle_figure,'-dpsc',fig2draw);

newDir = '/home/nvs/retrieval_analyzer_project/result/';
newF = strcat(newDir,fname);
newfilename = strcat(newF,'_reg_results.txt');
newFileid = fopen(newfilename,'w');
fprintf(newFileid,'The correlation measure (sample) using combined reg is: %f %f\n',max(CRM),std(CRM));
