function [H] = f_dltH(x,X)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    H = [];
    z3 = zeros(1,3);
    for i=1:size(x,2)
        xih = f_hom(x(:,i));
        Xih = f_hom(X(:,i));
     
        r1  = [z3 -Xih' xih(2)*Xih'];
        r2  = [Xih' z3 -xih(1)*Xih'];
        H   = [H;r1;r2];
    end
    [~,D,V]   = svd(H);
    [~,idx]   = min(diag(D));
    y         = zeros(size(D,2),1);
    y(idx)    = 1;
    H1        = V*y;
    
    H1        = [H1(1:3)';H1(4:6)';H1(7:end)'];
    H         = H1;
end

