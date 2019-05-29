function normMatrix = f_norm3DMatrix(points)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    normMatrix = zeros(4,4);
    sumOfX = 0;
    sumOfY = 0;
    sumOfZ = 0;
    for i=1:size(points,2)
        sumOfX = sumOfX + points(1,i);
        sumOfY = sumOfY + points(2,i);
        sumOfZ = sumOfZ + points(3,i);
    end
    sumOfX = sumOfX/size(points,2);
    sumOfY = sumOfY/size(points,2);
    sumOfZ = sumOfZ/size(points,2);
    D = 0;
    for i=1:size(points,2)
        D = D + sqrt((points(1,i)-sumOfX) * (points(1,i)-sumOfX)+(points(2,i)-sumOfY)*(points(2,i)-sumOfY)+(points(3,i)-sumOfZ)*(points(3,i)-sumOfZ));
    end
        D = D/size(points,2);
    normMatrix(1,1) = sqrt(3)/D;
    normMatrix(2,2) = sqrt(3)/D;
    normMatrix(3,3) = sqrt(3)/D;
    normMatrix(1,4) = -1*((sqrt(3)*sumOfX)/D);
    normMatrix(2,4) = -1*((sqrt(3)*sumOfY)/D);
    normMatrix(3,4) = -1*((sqrt(3)*sumOfZ)/D);
    normMatrix(4,4) = 1;
end

