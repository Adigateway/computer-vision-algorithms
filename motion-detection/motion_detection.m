% MOTION_DETECTION - Real-time background subtraction & silhouette detection

% Algorithm Parameters
alpha = 0.5; % Weighting factor for adaptive background model H(t)
tau = 30;    % Intensity threshold for activity image A(t)

% Initialize Hardware & Circular Frame Buffer
cam = webcam;
frame1 = [];
frame2 = [];

% Prepare GUI & graphics handles for real-time rendering
hFig = figure('Name', 'Live Motion Detection (Close window to stop)', ...
              'NumberTitle', 'off', ...
              'CloseRequestFcn', 'closereq');

subplot(1, 2, 1); 
hImg1 = imshow(zeros(480, 640, 3, 'uint8')); 
title('Original Video');

subplot(1, 2, 2); 
hImg2 = imshow(false(480, 640)); 
title('Moving Silhouettes');

% Live Processing Loop (runs until figure window is closed)
while ishandle(hFig)
    % Capture current frame
    frame = snapshot(cam);
    grayFrame = rgb2gray(frame);
    
    % Initialize buffer on first two frames
    if isempty(frame1)
        frame1 = grayFrame;
        continue;
    end
    if isempty(frame2)
        frame2 = grayFrame;
        continue;
    end
    
    % 1. Compute adaptive background model H(t)
    H_t = alpha * double(frame2) + (1 - alpha) * double(frame1);
    
    % 2. Compute activity image A(t)
    A_t = abs(double(grayFrame) - H_t);
    
    % 3. Apply thresholding to generate silhouette mask S(t)
    S_t = A_t > tau;

    % Update handle image data directly for fast performance
    set(hImg1, 'CData', frame);
    set(hImg2, 'CData', S_t);
    drawnow;

    % Shift buffer
    frame1 = frame2;
    frame2 = grayFrame;
end

% Release webcam resource on exit
clear cam;
disp('Webcam stream terminated successfully.');