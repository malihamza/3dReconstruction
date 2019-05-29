function [P] = f_makePFromHomograghy(H,k)
    z   = zeros(1,3);
    r1  = pinv(k)*H(:,1);
   % r1 = r1./norm(r1);
    r2  = pinv(k)*H(:,2);
   % r2 = r2./norm(r2);
    t   = pinv(k)*H(:,3);
    t = t./norm(t);
    r3  = cross(r1,r2);
    %r3 = r3./((norm(r1)+norm(r2))/2);
    R = [r1 r2 r3];
    det(R)
    P   = [k z'] * [r1 r2 r3 t; z 1];
end

