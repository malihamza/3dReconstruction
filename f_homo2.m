function [v1 v2] = f_homo2(H)
A1 = f_homo1(H(:,1));
A2 = f_homo1(H(:,2));
v1 = [H(:,1)'*A2];
v2 = [H(:,1)'*A1 - H(:,2)'*A2];
end

