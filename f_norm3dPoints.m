function normPoints = f_norm3dPoints(points)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    normPoints = points;
    normMatrix = f_norm3DMatrix(points);
    for i=1:size(points,2)
        normPoints(:,i) = normMatrix*points(:,i);
    end
end

