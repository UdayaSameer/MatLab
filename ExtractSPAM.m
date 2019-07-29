function [F_Spam] = ExtractSPAM()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

inDir='E:\Dresden_Images\150 images\Normal\Dresden_Database_150 images\Sony_H50' ;
list_img = dir(strcat(inDir,'\*.jpg'));
total_img = size(list_img,1);
F_Spam=zeros(100 ,686);
for im=1:70
    filename = strcat(inDir,'\',list_img(im).name);    
    rgbImage = imread(filename);
%     % For illumination remove
    imwrite(rgbImage,'temp_4.jpg');
    rgbImage1 = imread('temp_4.jpg');
    rgbImage = rgbImage-rgbImage1;
    F=spam(rgbImage);
    F=F';
    F_Spam(im,:)=F;
    
end
xlswrite('SPAM_SceneDependency_SonyH50_1.xlsx',F_Spam);

inDir='E:\Dresden_Images\150 images\Dark\Dark_sonyh50' ;
list_img = dir(strcat(inDir,'\*.jpg'));
total_img = size(list_img,1);
F_Spam=zeros(100 ,686);
for im=1:30
    filename = strcat(inDir,'\',list_img(im).name);    
    rgbImage = imread(filename);
%     % For illumination remove
    imwrite(rgbImage,'temp_4.jpg');
    rgbImage1 = imread('temp_4.jpg');
    rgbImage = rgbImage-rgbImage1;
    F=spam(rgbImage);
    F=F';
    F_Spam(im,:)=F;
    
end
xlswrite('SPAM_SceneDependency_SonyH507_Dark1.xlsx',F_Spam);



end

