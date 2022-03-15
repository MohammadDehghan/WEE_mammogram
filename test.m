

%% Reading Images All ROI extracted images
cd 'C:\Users\Parnian\breast cancer\Images' % go to images folder to get input images
Img_list=dir; % take a list from the current diroctory
cd .. % come back to before dir

Featurestest=zeros(222,13);
ep=zeros(100,1);
counter=1;
%% Reading ROI extracted Images Step By Step and Calculate WEE Each One
for i=100:322
close all

fullname = Img_list(i+2).name; 
cd 'C:\Users\Parnian\breast cancer\Images' % go to images folder to get input images
MainImg=imread(fullname); % read the image
% cd ..
cd 'C:\Users\Parnian\breast cancer\final code'


[Ea,Eh,Ev,Ed] = wenergy2(C,S);
% Features(counter)=entropy(E);
Featurestest(counter,:)=[Ea,Eh,Ev,Ed];
% ep(counter)=entropy(Features(counter,:));
counter=counter+1;




end


