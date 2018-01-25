d1 = 0;
t2 = 0;
d3 = 0;
t4 = 0;

% Constant
L2 = 450;
L4 = 100;
L5 = 600;
M_dh = [0 0 d1 0; 0 0 L2 t2; pi/2 0 d3 pi/2; pi/2 L4 0 t4; pi/2 L5 0 pi]
M_dh(1,3);

M = 1;
for i=5:-1:1
t = M_dh(i,4);
d = M_dh(i,3);
a = M_dh(i,2);
al = M_dh(i,1);
M = M*[cos(t) -sin(t) 0 a;  ...
    sin(t)*cos(a) cos(t)*cos(a) -sin(al) -sin(al)*d; ...
    sin(t)*sin(al) cos(t)*sin(al) cos(al) cos(al)*d; ...
    0 0 0 1];
end
M


