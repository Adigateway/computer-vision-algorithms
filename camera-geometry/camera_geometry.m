% task a
M = [1000*sqrt(2), 1000-(300*sqrt(2)), -1000-(300*sqrt(2)), 4*(10^4);
    1000*sqrt(2), -1000-(400*sqrt(2)), 1000-(400*sqrt(2)), 6*(10^4);
    0, -0.5*sqrt(2), -0.5*sqrt(2), 100];
t = [0, 0, 1;
    0, 1, 0;
    1, 0, 0];
M_rotated = transpose(M(1:3,1:3))*t;

% task b
[Q,R] = qr(M_rotated);

% task c
K = t*transpose(R)*t;
R_rot = t*transpose(Q);

% task d
D = diag(sign(diag(K)));
K = K*D;
R_rot = D*R_rot;

% task f
T = myInvK(K)*(M(:,end));

% task g
[U, S, V] = svd(M);
v_min = V(:, end);
O_w = v_min(1:3) / v_min(end); % Extract 3D cartesian coordinates (3x1)
O_w_confirm = (-myInvK(K*R_rot))*K*T;

% 3.2 task (a): Normalize image coordinates
K = [2000, 0, 600; 0, 2000, 800; 0, 0, 1];
Xi = [0, 0, 20, 20; 0, 20, 0, 20; 0, 0, 0, 0];
xi = [400, 600, 683, 929; 600, 334, 883, 664; 1, 1, 1, 1]; 

K_inv = myInvK(K);
normalized_coords = K_inv * xi;

% 3.2 task (b): Set up the measurement matrix using DLT
A = [];
for i = 1:size(Xi, 2)
    X = [Xi(1:2, i); 1]; % FIX: 2D planar homogeneous point [X_i; Y_i; 1] (3x1)
    x_norm = normalized_coords(:, i);
    skew_x = mySkewMat(x_norm); 
    A = [A; skew_x * kron(X', eye(3))]; % Append 3 equations per point (12x9 total)
end

disp("Size of A: ");
disp(size(A)); % Output: 12 x 9

% 3.2 task (c): Solve for homography H using SVD
[~, ~, V] = svd(A);

disp("Size of V: ");
disp(size(V)); % Output: 9 x 9

h = V(:, end);
if numel(h) == 9
    H = reshape(h, [3, 3]);
else
    error("The vector h does not have exactly 9 elements.");
end

% 3.2 task (d): Normalize and decompose the homography matrix
H = H / norm(H(:, 1)); % Normalize scale

% Fix depth sign ambiguity (Ensure camera points forward)
if H(3, 3) < 0
    H = -H;
end

R = H(:, 1:2); 
T = H(:, 3);   

% Complete rotation matrix with cross product
R = [R, cross(R(:, 1), R(:, 2))]; 

% Enforce proper rotation matrix properties (SO(3))
[U, ~, V] = svd(R);
R = U * V';
if det(R) < 0
    R = U * diag([1, 1, -1]) * V';
end

% Display results
disp('Rotation Matrix R:');
disp(R);
disp('Translation Vector T:');
disp(T);