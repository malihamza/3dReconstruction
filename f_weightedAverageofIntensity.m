function [Intensity] = f_weightedAverageofIntensity(P,intent)
    d1 = sqrt(pow2(P(1)-floor(P(1)))+pow2(P(2)-floor(P(2))));
    d2 = sqrt(pow2(P(1)-floor(P(1)))+pow2(P(2)-ceil(P(2))));
    d3 = sqrt(pow2(P(1)-ceil(P(1)))+pow2(P(2)-floor(P(2))));
    d4 = sqrt(pow2(P(1)-ceil(P(1)))+pow2(P(2)-ceil(P(2))));
    
    w    = [1/d1 1/d2 1/d3 1/d4];
    wSum = sum(w);
    w = w./wSum;
    w = [w(1)*intent(1) w(2)*intent(2) w(3)*intent(3) w(4)*intent(4)];
    Intensity = sum(w);
end

