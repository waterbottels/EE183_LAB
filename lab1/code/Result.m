%% It seems like this implementation only work with Matlab R2017
%% Case Scenario
% Adjusting the height and rotate the chair so that it faces forward
% Initially x0 = fkine(q0) = [300 0 1150 0],
q0 = [0 0 300 0]; % INITIAL CONFIGURATION
xd = [0 300 1400 1]; % WANTED POSITIONAL STATE OF END EFFECTOR
% 1) z value increases from 1150 to 1400: Increase in q1 values
% 2) x value gets transfered to x values: Rotation in q2 values
qd = ikine(q0, xd) % THE OPERATIONAL STATE TO GET THE POSITIONAL STATE
xt = fkine(qd) % APPLY FORWARD KINEMATICS TO CHECK ANSWER
arr_xt = xt(1:4,4)';
arr_qd = qd;
% Now make y from 300 to 500 in a increments of 50 each times
for i = 1:4
    q0 = qd;
    xd = [0 300+i*50 1400 1];
    qd = ikine(q0,xd);
    xt = fkine(qd);
    arr_qd = [arr_qd; qd];
    arr_xt = [arr_xt; xt(1:4,4)'];
end
%% Section 2: Trajectory Analysis
% Trajectory of headrest by rotating joint 4 by 90 degree
arr_x = [];
for i = 0:0.1:pi/2
    q = [0 0 0 i];
    x = fkine(q);
    arr_x = [arr_x; x(1:4,4)'];
end
t = -arr_x(:,1) %% x axis
y = arr_x(:,3) %% z axis
z = 1*t + 1150 % This is the linear interpolation
plot(t,y,t,z); % Ploting them together
title('Trajectory of the headrest');
legend('Trajectory of moving joint 4 only','Desired Linear Path')
grid on
ylabel('z')
xlabel('-x')
%% Section 3: Trajectory using IV
q0 = [0 0 0 0]; % INITIAL CONFIGURATION
q = [0 0 0 0]
% xd = [0 0 0 pi/2]; % WANTED POSITIONAL STATE OF END EFFECTOR
arr_q = [];
for i = 0:100:600
    y = -1*i + 1150;
    xd = [i 0 y 1];
    q0 = q;
    q = ikine(q0, xd);
    arr_q = [arr_q; qd];
    x = fkine(q);
    arr_x = [arr_x; x(1:4,4)'];
end

%% Test
q0 = [0 0 0 0];
i = 0:200:600
y = -1*i + 1150
xd = [i(2) 0 y(2) 1]
q = ikine(q0, xd)