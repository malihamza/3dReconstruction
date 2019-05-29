n = 25;
X = rand(3,n);
Xh = f_hom(X);
P = rand(3,4);
xh = P*Xh;
x = f_dehom(xh);
x = x+0.001*rand(2,n);
[Prec rankA] = f_dlt(x,X);
disp([P./P(3,4) Prec./Prec(3,4)]);
disp(rankA);
C = f_dehom(null(Prec));
M = Prec(:,1:3);
[K R] = f_rq(M);


