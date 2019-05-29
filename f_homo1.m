function [Ah] = f_homo1(h)
Ah = [h(1)  h(2)    h(3)    0   0   0;
        0   h(1)    0       h(2) h(3) 0;
        0   0       h(1)    0    h(2) h(3)];
end

