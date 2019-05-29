X      = [0 0 0 ; 2.6 0 0;2.6 2.6 0;0 2.6 0;0 2.6 2.6; 0 0 2.6; 2.6 0 2.6];
X      = X';
U      = f_norm3DMatrix(X);

X      = f_hom(X);
X      = f_norm3dPoints(X);
X      = f_dehom(X);


I1 = imread('D:\h\New folder\img34.jpg');
I2 = imread('D:\h\New folder\img35.jpg');
% imshow(I1);
% [xi yi] = ginput(7);
% x1 = [xi yi];
% x1 = x1';
mat1   = f_norm2DMatrix(x1);
x1     = f_hom(x1);
x1     = f_no+rm2dPoints(x1);
x1     = f_dehom(x1);
% 
%  imshow(I2);
%  [xi yi] = ginput(7);
%  x2 = [xi yi];
%  x2 = x2';
mat2   = f_norm2DMatrix(x2);
x2     = f_hom(x2);
x2     = f_norm2dPoints(x2);
x2     = f_dehom(x2);


P1     = f_dlt(x1,X);
P2     = f_dlt(x2,X);
 P1     = pinv(mat1)*P1*U;
 P2     = pinv(mat2)*P2*U;
Xrec    = zeros(3,7);
for i=1:7
     v         = f_rec3Dim(P1,P2,x1(:,i),x2(:,i));
     Xrec(:,i) = v';
end

Xrec

