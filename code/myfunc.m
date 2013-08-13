function f = myfunc(Xest)
%
% The function which is going to be
% minimized or maximized
% 
global human;
tp = corrcoef(Xest,human);
f = 1/tp(1,2);
return;
