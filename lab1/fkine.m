function A = fkine(q)
% q is a vector with the parameters of the joints
% NOTE: angles are assumed to be in degree
L2 = 450;
L4 = 100;
L5 = 600;
d1 = q(1);
t2 = q(2);
d3 = q(3);
t4 = q(4);

M_dh = [0 0 d1 0; 0 0 L2 t2+90; 90 0 d3 90; 90 L4 0 t4; 90 L5 0 180];

M = 1;
for i=5:-1:1
t = M_dh(i,4);
d = M_dh(i,3);
a = M_dh(i,2);
al = M_dh(i,1);
M = [cosd(t) -sind(t) 0 a;  ...
    sind(t)*cosd(al) cosd(t)*cosd(al) -sind(al) -sind(al)*d; ...
    sind(t)*sind(al) cosd(t)*sind(al) cosd(al) cosd(al)*d; ...
    0 0 0 1] * M;
end
A = M;