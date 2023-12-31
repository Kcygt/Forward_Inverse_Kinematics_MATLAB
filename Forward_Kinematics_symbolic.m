close all
clear 
clc

syms theta0 theta1 theta2 theta3 theta4 theta5 theta6 theta7 ...
     a0 a1     a2     a3     a4     a5     a6     a7 ...
     alpha0 alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 alpha7 ...
     d0 d1     d2     d3     d4     d5     d6     d7
        

% Symbolic version of Forward Kinematics 
% D-H parameters
alpha = [ pi  pi/2    pi/2      pi/2      pi/2      pi/2     pi/2     pi      ];
a     = [ 0 0 0 0 0 0 0 0 ];
d     =  [ 0  -(0.1564 + 0.1284)   -(0.0054 + 0.0064)   -(0.2104 + 0.2104)     -(0.0064 + 0.0064)  ...
                -(0.2084 + 0.1059)    0.0                 -(0.1059 + 0.0615)   ];
theta = [0 theta1 theta2+pi theta3+pi theta4+pi theta5+pi theta6+pi theta7+pi ];

% Numeric version of Forward Kinematics
% D-H parameters
% q     =deg2rad([ 0       25.004    0.001     127.003   0.001    44.998   0.001 ]); % joint position in radian
% % q     =        [     0.0006    0.4281    0.0031    2.2123    0.0003    0.7863    0.0004 ];
% alpha =        [ pi  pi/2    pi/2      pi/2      pi/2      pi/2     pi/2     pi      ];
% a     =        [ 0   0.0     0.0       0.0       0.0       0.0      0.0       0.0      ];
% d     =        [ 0  -(0.1564 + 0.1284)   -(0.0054 + 0.0064)   -(0.2104 + 0.2104)     -(0.0064 + 0.0064)  ...
%                  -(0.2084 + 0.1059)    0.0                 -(0.1059 + 0.0615)   ];
% theta =        [ 0   q(1)    q(2)+pi   q(3)+pi   q(4)+pi   q(5)+pi  q(6)+pi  q(7)+pi];

x = length(alpha);

T = cell(1, x);

for i = 1:x
    T{i} = [ cos(theta(i)) -cos(alpha(i))*sin(theta(i))  sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i));
             sin(theta(i))  cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i)) a(i)*sin(theta(i));
             0              sin(alpha(i))                cos(alpha(i))               d(i);
             0              0                            0                           1];
    T{i} = simplify(T{i});
end

A = eye(4); % to save homogenous transformation matrix

for i = 1:x
    A = A * T{i} ;
end
x = A(1:3,4);    % position matrix
R = A(1:3,1:3);  % rotation matrix

