X       = [0 0 0 ; 2.6 0 0;2.6 2.6 0;0 2.6 0;0 2.6 2.6; 0 0 2.6; 2.6 0 2.6];
X       = X';


I1      = imread('C:\Users\alihamza\Desktop\chali.png');

 e = [cosd(45) -sind(45) 0;sind(45) cosd(45) 0;0 0 1];
 I3 = f_wrapImage(rgb2gray(I1),e);
 imshow(I3 ,[0 255]);




% [xi,yi] = ginput(7);
% x1      = [xi yi];
% x1      = x1';
% 
% imshow(I2);
% [xi,yi] = ginput(7);
% x2      = [xi yi];
% x2      = x2';
% 
% 
% P1      = f_dlt(x1,X);
% P2      = f_dlt(x2,X);
% 
% Xrec    = zeros(3,7);
% for i=1:7
%      v         = f_rec3Dim(P1,P2,x1(:,i),x2(:,i));
%      v         = v';
%      Xrec(:,i) = v;
% end
% 
% Xrec   = Xrec';
% Xrec
% save
