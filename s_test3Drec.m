clc; clear;
P1 = rand(3,4);
P2 = rand(3,4);
X = rand(3,1);
Xh = [X;1];
x1h = P1*Xh; x2h = P2*Xh;
x1 = f_dehom(x1h); x2 = f_dehom(x2h);
Xrec = f_rec3Dim(P1,P2,x1,x2);
[X Xrec]