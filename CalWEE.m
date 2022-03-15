clc
clear
close all
% this script calculate WEE Features From ROI Extracted Images
Features=zeros(322,13);
ep=zeros(100,1);
counter=1;
%% Reading Images All ROI extracted images
cd 'C:\Users\Parnian\breast cancer\Images' % go to images folder to get input images
Img_list=dir; % take a list from the current diroctory
cd .. % come back to before dir


%% Reading ROI extracted Images Step By Step and Calculate WEE Each One
for i=1:322
close all

fullname = Img_list(i+2).name; 
cd 'C:\Users\Parnian\breast cancer\Images' % go to images folder to get input images
MainImg=imread(fullname); % read the image
% cd ..
cd 'C:\Users\Parnian\breast cancer\final code'

%% Calculate WEE
[C ,S]=wavedec2(MainImg,4,'db4');

% approximatre=C(1:4900);
% 
% E=approximatre.^2;

[Ea,Eh,Ev,Ed] = wenergy2(C,S);
% Features(counter)=entropy(E);
Features(counter,:)=[Ea,Eh,Ev,Ed];
% ep(counter)=entropy(Features(counter,:));
counter=counter+1;


end

label=[1;1;0;0;1;0;0;0;0;1;0;1;1;0;1;0;1;0;1;0;1;0;1;0;1;0;0;1;0;1;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;0;0;0;1;0;0;0;0;0;1;0;0;1;0;0;1;0;0;0;0;1;1;0;1;0;0;0;0;0;0;1;1;1;0;0;1;0;1;0;1;0;0;1;0;1;1;0;1;0;0;1;1;0;0;0;1;0;1;0;0;1;1;0;0;1;1;1;1;0;0;1;0;1;0;1;0;0;0;0;0;0;1;1;0;1;1;1;0;0;1;0;1;0;1;0;0;1;0;0;1;0;1;0;0;1;0;1;0;1;0;0;1;1;0;0;0;1;0;0;1;1;0;1;0;0;1;0;1;0;1;0;1;1;0;1;0;1;0;0;1;1;0;0;1;0;1;0;1;1;0;1;0;1;1;1;1;0;1;0;1;1;0;0;1;0;0;1;1;0;0;0;1;0;1;0;0;1;0;1;1;1;1;0;0;1;1;0;0;1;1;0;0;1;1;0;0;1;0;0;0;0;0;0;0;1;1;0;1;0;0;1;1;0;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;1;0;0;0;0;0;0;0];