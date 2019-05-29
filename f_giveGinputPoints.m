function [x] = f_giveGinputPoints(imgLoc,noOfPoints)
    
    I        = imread(imgLoc);
    imshow(I);
    
    [xi,yi]  = ginput(noOfPoints);
    x        = [xi yi];
    x        = x';
    
%     temp = x;
%     
%     x(1,:)  = temp(2,:);
%     x(2,:)  = temp(1,:);
end

