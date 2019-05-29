function [r,c] = f_wrapedImageSize(I,H)
    [r,c]  = size(I);
    
    P      = H * [1 1 r r;1 c 1 c;1 1 1 1];
    
    P      = P./P(3,:);
    P(3,:) = [];
    
    mins   = min(P,[],2);
    minR   = mins(1);
    minC   = mins(2);
    
    maxs   = max(P,[],2);
    maxR   = maxs(1);
    maxC   = maxs(2);
    
    r      = [minR maxR];
    c      = [minC maxC];
end

