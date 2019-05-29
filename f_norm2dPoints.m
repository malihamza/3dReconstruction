function normPoints = f_norm2dPoints(points)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    normPoints = points;
    normMatrix = f_norm2DMatrix(points);
    for i=1:size(points,2)
        normPoints(:,i) = normMatrix*points(:,i);
    end
end
