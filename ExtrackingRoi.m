clc
clear
close all
% this script Extract ROI Of Images

%% Reading Images All images
cd 'C:\Users\Parnian\breast cancer\Images' % go to images folder to get input images
Img_list=dir; % take a list from the current diroctory
cd .. % come back to before dir

% RandomImages=randi(322,[1 250]);
%% Reading Images step by step
for i=1:322
close all
% i=10;
fullname = Img_list(i+6).name; 
cd 'C:\Users\Parnian\breast cancer\Images' % go to images folder to get input images
MainImg=imread(fullname); % read the image
cd ..


%% Median Filtering

Im_med=medfilt2(MainImg,[3 3]); % median filtering 
% figure();imshow(Im_gray)

%% homomorphic filtering To Remove multiplicative noise
d=10;
order=2;
im=double(Im_med);

[r, c]=size(Im_med);
Im_homomorphic_filtereed = homofil(im,d,order);
Im_homomorphic_filtereed=mat2gray(Im_homomorphic_filtereed); %Convert matrix to grayscale image
% imshow(Im_homomorphic_filtereed,[]);

%% logarithmic enhancement

Im_log_enhancement=im2uint8(mat2gray(log(1+double(Im_homomorphic_filtereed))));
% Im_log_enhancement2=imadjust(Im_log_enhancement);
% figure();imshow(Im_log_enhancement)

%% Removing Lable
Im_bw=imbinarize(Im_med,graythresh(Im_med)); % thresholding
%   figure();imshow(Im_bw)

prop=regionprops(Im_bw);
ar=cat(1,prop.Area);
[Ar,l]=max(ar); 
Im_bw=bwareaopen(Im_bw,abs(Ar-50));
% imshow(Im_bw)

Im_log_enhancement(~Im_bw)=0;
% figure();imshow(Im_log_enhancement)

%% Remove Pectoral Muscle

[P, J] = regionGrowing2(Im_med);
% figure();imshow(Im_homomorphic_filtereed)
for i1=1:1024
    for j1=1:1024
        if J(i1,j1,:)==1
            
            Im_log_enhancement(i1,j1,:)=0;
        end
    end
end

figure();imshow(Im_log_enhancement)


% figure();imshow(Im_gray)
Im_med=medfilt2(Im_log_enhancement); % median filtering 
% figure();imshow(Im_gray)
Im_bw=imbinarize(Im_med,graythresh(Im_med)); % thresholding

prop=regionprops(Im_bw);
ar=cat(1,prop.Area);
[Ar,l]=max(ar); 
Im_bw=bwareaopen(Im_bw,abs(Ar-50));

Im_med(~Im_bw)=0;
figure();imshow(Im_med)

% cd 'C:\Users\Parnian\breast cancer\ROI extracted\refineImg'
% imwrite ( Im_homomorphic_filtereed , [ num2str(i),'.png'] );

end
