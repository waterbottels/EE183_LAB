function J = Jacob(qi, dx)
% dx is 4x1; qi is 4x1
% dx = (xd-x0) / N 
% set dq = dx, and see how x changes WRT dq
% Jacboian = change of x / dq
dq = mean(dx);
tq = qi;
D = [];
for i=1:4
    tq(i) = tq(i)+dq;
    T = fkine(tq)-fkine(qi);
    T(1:4,4);
    D = [D T(1:4,4)/dq];
    tq = qi;
end   
J = D;
A = J.';
B = J.' * J;
C = inv(B);
J = C*A;






