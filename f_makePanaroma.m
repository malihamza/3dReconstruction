function [I2] = f_makePanaroma(Panaroma,I,H,rLim,cLim)
    [r1,c1] = size(I);
    
    minR   = rLim(1);
    minC   = cLim(1);
    
    maxR   = rLim(2);
    maxC   = cLim(2);

    r = Panaroma(1);
    c = Panaroma(2);
    
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

