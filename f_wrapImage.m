function [I2] = f_wrapImage(I,H)
   [r1,c1] = size(I);
    
    P      = H * [1 1 r1 r1;1 c1 1 c1;1 1 1 1];
    P      = P./P(3,:);
    P(3,:) = [];
    
    mins   = min(P,[],2);
    minR   = ceil(mins(1));
    minC   = ceil(mins(2));
    
    maxs   = max(P,[],2);
    maxR   = maxs(1);
    maxC   = maxs(2);
    
    r      = maxR - minR +1;
    c      = maxC - minC +1;

    I2     = zeros(ceil(r),ceil(c));
    invH   = pinv(H);
    for i  = minR:maxR
        for j  = minC:maxC
            
            P2 = invH * [i; j; 1]; %#ok<MINV>
            P2 = f_dehom(P2); 
            
            if( floor(P2(1))>=1 && floor(P2(2))>=1 && ceil(P2(1))<=r1 && ceil(P2(2))<=c1 )
                
                intent                = [I(floor(P2(1)),floor(P2(2))) I(floor(P2(1)),ceil(P2(2))) I(ceil(P2(1)),floor(P2(2))) I(ceil(P2(1)),ceil(P2(2)))]; 
                I2(i-minR+1,j-minC+1) = f_weightedAverageofIntensity(P2,intent);
            end
            
        end
        
    end
    
end

