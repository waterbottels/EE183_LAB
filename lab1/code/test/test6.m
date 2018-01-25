q0 = [0 0 0 0];
xd = [0 100 1150 0];
% q0 = current joints configuration x0 = A(q0) [q1, q2, q3, q4]
% xd = [x y z 1] wanted distination of end effector
qd = q0;
com = 0;
for i=1:1
    A = tool_fkine(qd); % compute the current positional state of end effector
    Dx = xd-A(1:4,4).'; % Error (destination - current)
    dx = Dx / 100; % 100 is hyperparameter, step size
    J = Jacob(qd,dx); % Jacob outputs the pseudo inverse of the Jacobian
    dq = J*dx.'; 
    com = qd;
    qd = qd + dq.'; % update the new q values
end
q = qd;