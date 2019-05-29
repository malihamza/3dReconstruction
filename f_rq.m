function [R Q] = f_rq(A)
    [Q1 R1] = qr(inv(A));
    R = inv(R1);
    Q = Q1';
end