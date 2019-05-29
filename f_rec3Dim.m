function X=f_rec3Dim(P1,P2,x1,x2) 
    x1h= [x1;1]; x2h=[x2;1];
    A1 = pinv(P1)*x1h; %A1=P1/x1h;
    A2 = pinv(P2)*x2h;
    C1 = null(P1);
    C2 = null(P2);
    A1 = f_dehom(A1);
    A2 = f_dehom(A2);
    C1 = f_dehom(C1);
    C2 = f_dehom(C2);
    PA = [C1';C2'];%Transpose require because of function require that in row form
    PB = [A1';A2'];
    X = lineIntersect3D(PA,PB);
    X = X';
end