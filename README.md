# Detecting abnormal breasts on mammogram images using wavelet energy entropy (WEE)

Abnormal breasts are one of the first signs of breast cancer that can put a psychological burden on women. This is my implementation of the [paper](https://link.springer.com/article/10.1007/s11042-016-4161-0) providing a novel method to differentiate between normal and abnormal breasts based on Wavelet Energy Entropy (WEE) and linear regression classification (LRC).

The preprocessing diagram:

<img src="https://github.com/Dehghan99/WEE_mammogram/blob/main/figures/preprocessing.png" alt="drawing" width="800"/>

 
In brief, the region of interest (ROI) is initially identified from digital mammograms. The ROI's WEE is then calculated, and the images are then classified using the LRC classifier. According to 10-fold cross-validation, the best classification results occur when the decomposition level is 4. Sensitivity is 82%, specificity is 81.5%, and accuracy is 81.23%. (Compared to the original paper, my results are lower.)


<img src="https://github.com/Dehghan99/WEE_mammogram/blob/main/figures/Image_1.png" alt="drawing" width="800"/>

Wavelet decomposition:

<img src="https://github.com/Dehghan99/WEE_mammogram/blob/main/figures/Dec_4.png" alt="drawing" width="400"/>
