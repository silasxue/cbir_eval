function [cdata,hdata] = getRand(imname1,imname2,num)
fname1 = imname1;
fname2 = imname2;
% Function for sampling N number of samples randomly 
% from a datafile.
% 
X = load(fname1);
Y = load(fname2)
[r,c] = size(X);
I = rand(num,1).*(r-1);
I2 = ceil(I);
cdata = X(I2);
hdata = Y(I2);