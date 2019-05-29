 X        = [0 0 ;0 15;7.5 0;7.5 15;2.5 5];
 X        = X';
 
 x1 = f_dehom(rand(3,3)*f_hom(X));
 x2 = f_dehom(rand(3,3)*f_hom(X));
 x3 = f_dehom(rand(3,3)*f_hom(X));
% % 
%   x1       = f_giveGinputPoints('check1.jpg',6);
% % % 
%   x2       = f_giveGinputPoints('check2.jpg',6);
% % % 
%   x3       = f_giveGinputPoints('check3.jpg',6);
% 
% 

Hr1      = f_dltH(x1,X);
Hr2      = f_dltH(x2,X);
Hr3      = f_dltH(x3,X);



H        = zeros(3,3,3);
H(:,:,1) = Hr1./Hr1(3,3);
H(:,:,2) = Hr2./Hr2(3,3);
H(:,:,3) = Hr3./Hr3(3,3);

K        = f_homography(H);
P1       = f_makePFromHomograghy(Hr1,K);
P2       = f_makePFromHomograghy(Hr2,K);


Xrec     = zeros(3,size(x1,2));
for i=1:size(x1,2)
     v         = f_rec3Dim(P1,P2,x1(:,i),x2(:,i));
     v         = v';
     Xrec(:,i) = v;
end
Xrec
% 
% Xrec
% buildingScene = imageDatastore('C:\Users\alihamza\Desktop\CV','FileExtension',{'.png'});
% montage(buildingScene.Files);
% I = readimage(buildingScene,2);
% grayImage = rgb2gray(I);
% imshow(grayImage);
% points = detectSURFFeatures(grayImage);
% [features, points] = extractFeatures(grayImage, points);
% hold on
% plot(points.selectStrongest(10),'showorientation',true);













