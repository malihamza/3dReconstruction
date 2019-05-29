I1 = imread('building3.jpg');
I2 = imread('building4.jpg');

imshow(I1);
[x,y] = ginput(8);
x1 = [x,y];
x1 = x1';

imshow(I2);
[x,y] = ginput(8);
x2 = [x,y];
x2 = x2';

temp = x1;


x1(1,:) = temp(2,:);
x1(2,:) = temp(1,:);
temp = x2;
x2(1,:) = temp(2,:);
x2(2,:) = temp(1,:);

H = f_dltH(x1,x2);
H = H./H(3,3);

I1gray = rgb2gray(I1);
I2gray = rgb2gray(I2);

[r2Lim c2Lim] = f_wrapedImageSize(I2gray,H);
[r1Lim c1Lim] = f_wrapedImageSize(I1gray,eye(3,3));

minR = min([r1Lim(1) r2Lim(1)]);
maxR = max([r1Lim(2) r2Lim(2)]);

minC = min([c1Lim(1) c2Lim(1)]);
maxC = max([c1Lim(2) c2Lim(2)]);

rows = max([size(I2gray,1) size(I1gray,1)]);
cols = size(I2gray,2) + size(I1gray,2);
panaromaSize = [rows cols];

p1 = f_makePanaroma(panaromaSize,I1gray,eye(3),[minR;maxR],[minC;maxC]);
p2 = f_makePanaroma(panaromaSize,I2gray,H,[minR;maxR],[minC;maxC]);

mask1 = f_makePanaroma(panaromaSize,true(size(I1gray)),eye(3),[minR;maxR],[minC;maxC]);
mask2 = f_makePanaroma(panaromaSize,true(size(I2gray)),H,[minR;maxR],[minC;maxC]);


panaroma = zeros(rows,cols);
%panaroma = f_renderPanaroma(panaroma,p1,mask1);
panaroma = f_renderPanaroma(p1,p2,mask2);