function [A, x, R , T, H] = forwardKinematics(theta)
    A = eye(4); % to save homogeneous transformation matrix

    % D-H parameters
    alpha = [pi pi/2 pi/2 pi/2 pi/2 pi/2 pi/2 pi];
    a = [0 0 0 0 0 0 0 0];
    d = [0 -(0.1564 + 0.1284) -(0.0054 + 0.0064) -(0.2104 + 0.2104) ...
         -(0.0064 + 0.0064) -(0.2084 + 0.1059) 0.0 -(0.1059 + 0.0615)];
    
    x = length(alpha);
    q = [pi pi/2 -pi/2 -pi/2 -pi/2 pi/2 -pi/2 pi];
    
    T = cell(1, x);
    H = cell(1, x);

    for i = 1:x
        T{i} = [cos(theta(i)) -cos(alpha(i))*sin(theta(i)) sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i));
                sin(theta(i))  cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i)) a(i)*sin(theta(i));
                0 sin(alpha(i)) cos(alpha(i)) d(i);
                0 0 0 1];
        Rotation = [ cos(q(i)) -sin(q(i))  0  0;
                     sin(q(i))  cos(q(i))  0  0;
                     0          0          1  0;
                     0          0          0  1 ];
        % T{i} = simplify(T{i});  
        A = A * T{i} ;
        % if i~=1
        %     H{i} = T{i-1} * T{i} * Rotation;
        % end
    end

    
    for i = 1:x
    end

    x = A(1:3, 4);    % position matrix
    R = A(1:3, 1:3);  % rotation matrix

end
