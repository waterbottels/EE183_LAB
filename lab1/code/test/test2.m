q = [0,0,0,0];
% q is a vector with the parameters of the joints
% NOTE: angles are assumed to be in degree
L2 = 450;
L4 = 100;
L5 = 600;
d1 = q(1);
t2 = q(2);
d3 = q(3);
t4 = q(4);

M_dh = [0 0 d1 0; 0 0 L2 t2; 90 0 d3 90; 90 L4 0 t4; 90 L5 0 180];

MT = [];
for i=5:-1:1
t = M_dh(i,4);
d = M_dh(i,3);
a = M_dh(i,2);
al = M_dh(i,1);
T = [cosd(t) -sind(t) 0 a;  ...
    sind(t)*cosd(a) cosd(t)*cosd(a) -sind(al) -sind(al)*d; ...
    sind(t)*sind(al) cosd(t)*sind(al) cosd(al) cosd(al)*d; ...
    0 0 0 1];
MT = [T MT];
M = T*M;
end
M1 = MT(:, 1:4);
M2 = MT(:, 5:8);
M3 = MT(:, 9:12);
M4 = MT(:, 13:16);
M5 = MT(:, 17:20);
FM=M1*M2*M3*M4*M5;





