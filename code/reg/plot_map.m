% plot the maps
fname = 'simpnew_groundtruth_data.txt';
a= load(fname);
%plot(1-(a(:,3)./max(a(:,3))),a(:,4),'.');
EDGES = 1:length(a);
plot((a(EDGES,3)),a(EDGES,4),'.');
hold on;
fname2 = 'simp_map.mat';
load(fname2);
%[cx_new,I]  = sort(1-(cx_new./max(cx_new)));
[cx_new,I]  = sort((cx_new./(max(cx_new))));
hy_mapped = hy_mapped(I);
plot(cx_new,hy_mapped,'r-');

%plot((cx_new(length(cx_new):-100:1)), hy_mapped(1:100:length(hy_mapped)),'r');
xlabel('SIMPLIcity system scores');
ylabel('Calibrated human scores');
title('Mapping function for SIMPLIcity system using constrained correlation maximization fitting method');
legend('Scatter plot of the SIMPLICity scores and calibrated human scores','Mapping function') 

