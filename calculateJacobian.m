q     =deg2rad([ 0       25.004    0.001     127.003   0.001    44.998   0.001 ]); % joint position in radian
q = [0 0 0 0 0 0 0 0];
% Denavit-Hartenberg parameters
alpha = [pi, pi/2, pi/2, pi/2, pi/2, pi/2, pi/2, pi];
a = [0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
d = [0, -(0.1564 + 0.1284), -(0.0054 + 0.0064), -(0.2104 + 0.2104), -(0.0064 + 0.0064), ...
    -(0.2084 + 0.1059), 0.0, -(0.1059 + 0.0615)];

% Joint positions
q = q(:);  % Ensure q is a column vector
theta = [0; q(1); q(2) + pi; q(3) + pi; q(4) + pi; q(5) + pi; q(6) + pi; q(7) + pi];

% Initialize transformation matrices
T = eye(4);
A = cell(1, 8);

% Calculate transformation matrices
for i = 1:8
    A{i} = [cos(theta(i)), -sin(theta(i)) * cos(alpha(i)), sin(theta(i)) * sin(alpha(i)), a(i) * cos(theta(i));
            sin(theta(i)), cos(theta(i)) * cos(alpha(i)), -cos(theta(i)) * sin(alpha(i)), a(i) * sin(theta(i));
            0, sin(alpha(i)), cos(alpha(i)), d(i);
            0, 0, 0, 1];
    T = T * A{i};
end

% Extract rotation matrices and positions from transformation matrices
R = cell(1, 8);
p = cell(1, 8);

for i = 1:8
    R{i} = T(1:3, 1:3);
    p{i} = T(1:3, 4);
    if i < 8
        T = T * inv(A{i+1});
    end
end

% Initialize Jacobian matrix
J = zeros(6, 7);

% Calculate Jacobian matrix
for i = 1:7
    z_i = R{i}(1:3, 3);
    p_i = p{8} - p{i};
    J(:, i) = [cross(z_i, p_i); z_i];
end

