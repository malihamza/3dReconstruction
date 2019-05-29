function [A] = f_homo3(H)
    A = [];
    for i=1:size(H,3)
        [v1 v2] = f_homo2(H(:,:,i));
        A = [A;v1;v2];
    end
end

