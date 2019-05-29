function x = f_dehom(xh)
    x = xh./xh(end,:);
    x = x(1:end-1,:);
end