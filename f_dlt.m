function [P rankA] = f_dlt(x,X)
    
    z4 = zeros(1,4);
    A = [];
    for i = 1:size(x,2)%Size(x,2) mean number of columns
        Xih = f_hom(X(:,i));
        xi = x(1,i);
        yi = x(2,i);     
        r1 = [z4 -Xih' yi*Xih'];
        r2 = [Xih' z4 -xi*Xih'];
        A = [A;r1];
        A = [A;r2];
    end
    rankA = rank(A);
   [U,D,V] = svd(A);
    V = V';
   [val idx] = min(diag(D));
    y = zeros(size(D,2),1);
    y(idx) = 1;
    P1 = V'*y;
    P = [P1(1:4)';P1(5:8)';P1(9:end)'];
    
end