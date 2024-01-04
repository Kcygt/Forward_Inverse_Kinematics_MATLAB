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



[A,x,R,T ] = forwardKinematics(theta);