function normMatrix = f_norm2DMatrix(points)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    normMatrix = zeros(3,3);
    sumOfX = 0;
    sumOfY = 0;
    for i=1:size(points,2)
        sumOfX = sumOfX + points(1,i);
        sumOfY = sumOfY + points(2,i);
    end
    sumOfX = sumOfX/size(points,2);
    sumOfY = sumOfY/size(points,2);
    D = 0;
    for i=1:size(points,2)
        D = D + sqrt((points(1,i)-sumOfX) * (points(1,i)-sumOfX)+(points(2,i)-sumOfY)*(points(2,i)-sumOfY));
    end
    D = D/size(points,2);
    normMatrix(1,1) = sqrt(2)/D;
    normMatrix(2,2) = sqrt(2)/D;
    normMatrix(3,3) = 1;
    normMatrix(1,3) = -1*((sqrt(2)*sumOfX)/D);
    normMatrix(2,3) = -1*((sqrt(2)*sumOfY)/D);  
end

