function [K] = f_homography(H)
     A      = f_homo3(H);
    
    [~,D,V] = svd(A);
    [~,idx] = min(diag(D));
    
    y       = zeros(size(D,2),1);
    y(idx)  = 1;
    b       = V*y;
    
    B       = [ b(1) b(2) b(3);
                b(2) b(4) b(5);
                b(3) b(5) b(6)];
    

    
    [~,D,V] = svd(B);
     V      = V';     
     D12    = sqrt(D);
     A      = V*D12;
     [~,R]  = qr(A');
     L      = R';
     K      = inv(L');
end

