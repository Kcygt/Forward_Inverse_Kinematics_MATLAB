%%%%%%%%%%%%
%%%%    Numeric Forward Kinematic
%%%%%%%%%%%%

theta = [0 90 90 90 0 0 0]; % Link angles
a = [1 1 1 1 1 1 1];        % Link lenght   
alpha = [0 0 0 0 0 0 0];    % Link twist
d =[0 0 0];         % Link offset

x = length(theta);

% Initialize a cell array to store transformation matrices
A_cell = cell(1, x);

for i = 1:x
    A_cell{i} = [cos(theta(i)) -sin(theta(i))*cos(alpha(i)) sin(theta(i))*sin(alpha(i)) a(i)*cos(theta(i));
                 sin(theta(i)) cos(theta(i))*cos(alpha(i)) -cos(theta(i))*sin(alpha(i)) a(i)*sin(theta(i));
                 0 sin(alpha(i)) cos(alpha(i)) d(i);
                 0 0 0 1];
end

% Multiply all transformation matrices to get the overall transformation
A = eye(4);
for i = 1:x
    A = A * A_cell{i};
end

disp(A);
