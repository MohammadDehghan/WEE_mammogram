function output1=relative_energy1(x,interval,levels)
%x is 1 dimensional signal of column vector 
%interval must be the number of k*(2^levels),where k is an integer. 
% levels is the number of level for wavelet transformation(WT)
% for a clear understanding of the code,please look at the help of  function wavedec  
[c,l]=wavedec2(x,levels,'db4');% you can choose other mother wavelet,such as 'haar','dbN'
y= sum_rela(c,l,interval);
output1=relative_energy(y);
plot(output1','Linewidth',5);
title('relative wavelet energy');
legend('p1','p2','p3','p4','p5');%This should be corresponding to the levels you defined.
%you may feel that the code is a bit complex,that's because the relative
%wavelet energy is calculated from the coefficients of DWT,rather than the
%reconstructed  signal itself
%Code by Guan Wenye,guanwenye@tju.edu.cn
