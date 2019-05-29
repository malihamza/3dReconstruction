function [Panaroma] = f_renderPanaroma(Panaroma,I,mask)
    [r,c] = size(I);%size is same
    for i = 1:r
        for j = 1:c
            if(round(mask(i,j))==1)
                Panaroma(i,j) = I(i,j);
            end
        end
    end
end

