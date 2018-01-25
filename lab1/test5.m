q0 = [0 0 0 0];
xd = [100 0 0 0]; % y is not working , don't change y
qd = ikine(q0, xd)
xt = fkine(qd)