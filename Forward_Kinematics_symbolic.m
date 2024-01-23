close all
clear 
clc

syms theta0 theta1 theta2 theta3 theta4 theta5 theta6 theta7 ...
     a0 a1     a2     a3     a4     a5     a6     a7 ...
     alpha0 alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 alpha7 ...
     d0 d1     d2     d3     d4     d5     d6     d7
        

% Symbolic version of Forward Kinematics 
% D-H parameters
% alpha = [alpha0 alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 alpha7      ];
% a     = [ a0 a1     a2     a3     a4     a5     a6     a7  ];
% d     =  [ d0 d1     d2     d3     d4     d5     d6     d7   ];
% theta = [theta0 theta1 theta2+pi theta3+pi theta4+pi theta5+pi theta6+pi theta7+pi ];

% Numeric version of Forward Kinematics
% D-H parameters
% q = [0 0 0 0 0 0 0 0];
q     =deg2rad([ 0       25.004    0.001     127.003   0.001    44.998   0.001 ]); % joint position in radian
alpha =        [ pi  pi/2    pi/2      pi/2      pi/2      pi/2     pi/2     pi      ];
a     =        [ 0   0.0     0.0       0.0       0.0       0.0      0.0       0.0      ];
d     =        [ 0  -(0.1564 + 0.1284)   -(0.0054 + 0.0064)   -(0.2104 + 0.2104)     -(0.0064 + 0.0064)  ...
                 -(0.2084 + 0.1059)    0.0                 -(0.1059 + 0.0615)   ];
theta =        [ 0   q(1)    q(2)+pi   q(3)+pi   q(4)+pi   q(5)+pi  q(6)+pi  q(7)+pi];

x = length(alpha);
z = cell(1, 8);
o = cell(1, 8);
T = eye(4); % to save homogenous transformation matrix

A = cell(1, x);
Jacobian = zeros(6,7);

for i = 1:x
    A{i} = [ cos(theta(i)) -cos(alpha(i))*sin(theta(i))  sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i));
             sin(theta(i))  cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i)) a(i)*sin(theta(i));
             0              sin(alpha(i))                cos(alpha(i))               d(i);
             0              0                            0                           1];
   
end


for i = 1:x
    T = T * A{i}; 
    z{i} = [T(1:3,3)];
    o{i} = [T(1:3,4)];
end
for i = 1:7

    Jacobian(:,i) = [cross(z{i},(o{8} - o{i}));z{i}];
end


