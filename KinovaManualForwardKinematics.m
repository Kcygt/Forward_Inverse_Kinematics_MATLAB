% theta    =deg2rad([ 0       25.004    0.001     127.003   0.001    44.998   0.001 ]); % joint position in radian
theta = [0 0 0 0 0 0 0];


TB1 = [cos(theta(1))   -sin(theta(1)) 0    0;
       -sin(theta(1))  -cos(theta(1)) 0    0;
       0               0              -1   0.1564;
       0               0               0    1];


T12 = [cos(theta(2))   -sin(theta(2)) 0    0;
       0                0            -1    0.0054;
       sin(theta(2))  cos(theta(2))   0   -0.1284;
       0               0              0    1];

T23 = [cos(theta(3))   -sin(theta(3)) 0    0;
       0                0             1   -0.2104;
       -sin(theta(3))  -cos(theta(3)) 0   -0.0064;
       0               0              0    1];


T34 = [cos(theta(4))   -sin(theta(4)) 0    0;
       0                0            -1   -0.0064;
       sin(theta(4))  cos(theta(4))   0   -0.2104;
       0               0              0    1];

T45 = [cos(theta(5))   -sin(theta(5)) 0    0;
       0                0             1   -0.2084;
       -sin(theta(5))  -cos(theta(5)) 0   -0.0064;
       0               0              0    1];

T56 = [cos(theta(6))   -sin(theta(6)) 0    0;
       0                0             -1   0.0;
       sin(theta(6))  cos(theta(6)) 0     -0.1059;
       0               0              0    1];

T67 = [cos(theta(7))   -sin(theta(7)) 0    0;
       0                0             1   -0.1059;
       -sin(theta(7))  -cos(theta(7)) 0   0;
       0               0              0    1];
T78 = [ 1 0 0 0 ;
        0 -1 0 0;
        0 0 -1 -0.0615;
        0 0 0 1];

A = TB1 * T12 * T23 * T34 * T45 * T56 * T67 * T78;