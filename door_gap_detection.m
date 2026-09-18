%% Door Gap Detection using Computer Vision
%
% This project detects the rectangular gap of a door from an RGB image
% using classical image-processing and computer-vision techniques.
%
% Processing pipeline:
%   Image preprocessing
%   -> Sobel gradient extraction
%   -> Edge detection
%   -> Symmetric edge detection
%   -> Hough transform
%   -> Line detection
%   -> Corner point estimation
%
% Required:
%   MATLAB
%   Image Processing Toolbox

clear;
close all;
clc;

%% Load input image

image = imread('./01 - R2441 - i.JPG');
[M, N, C] = size(image);

figure;
imshow(image, 'Border', 'tight');
title('Input Image');

%% Image preprocessing

% Convert RGB image to grayscale
grayImg = rgb2gray(image);

figure;
imshow(grayImg);
title('Grayscale Image');

% Adjust image contrast
contrastAdjusted = imadjust(grayImg);

figure;
imshow(contrastAdjusted);
title('Contrast Adjusted Image');

% Noise reduction using a binomial low-pass filter
binomialFilter = [1 4 6 4 1] / 16;

filteredImage = imfilter(contrastAdjusted, ...
                         binomialFilter, ...
                         'replicate');

filteredImage = imfilter(filteredImage, ...
                         binomialFilter', ...
                         'replicate');

figure;
imshow(filteredImage);
title('Filtered Image with Binomial Low-Pass Filter');

%% Sobel gradient extraction

% Optimized Sobel filter in the x-direction
sobel_x = [-3 0 3;
           -10 0 10;
           -3 0 3] / 32;

img_sobel_x = imfilter(double(image), ...
                       sobel_x, ...
                       'replicate');

% X-direction edge strength
img_edge_strength_x = abs(img_sobel_x);

% Detect negative x-gradients
threshold_x_neg = mean(img_edge_strength_x(:)) * 0.5;

img_neg_edge_x = (img_sobel_x < -threshold_x_neg);

% Noise reduction
img_neg_edge_x = imopen(img_neg_edge_x, strel('disk', 1));

% Dilate by one pixel
img_neg_edge_x = imdilate(img_neg_edge_x, strel('disk', 1));

% Detect positive x-gradients
img_pos_edge_x = (img_sobel_x > threshold_x_neg);

% Noise reduction
img_pos_edge_x = imopen(img_pos_edge_x, strel('disk', 1));

% Dilate by one pixel
img_pos_edge_x = imdilate(img_pos_edge_x, strel('disk', 1));


% Optimized Sobel filter in the y-direction
sobel_y = [-3 -10 -3;
            0   0   0;
            3  10   3] / 32;

img_sobel_y = imfilter(double(image), ...
                       sobel_y, ...
                       'replicate');

% Y-direction edge strength
img_edge_strength_y = abs(img_sobel_y);

% Detect negative y-gradients
threshold_y_neg = mean(img_edge_strength_y(:)) * 0.5;

img_neg_edge_y = (img_sobel_y < -threshold_y_neg);

% Noise reduction
img_neg_edge_y = imopen(img_neg_edge_y, strel('disk', 1));

% Dilate by one pixel
img_neg_edge_y = imdilate(img_neg_edge_y, strel('disk', 1));

% Detect positive y-gradients
img_pos_edge_y = (img_sobel_y > threshold_y_neg);

% Noise reduction
img_pos_edge_y = imopen(img_pos_edge_y, strel('disk', 1));

% Dilate by one pixel
img_pos_edge_y = imdilate(img_pos_edge_y, strel('disk', 1));

%% Visualize gradient information

figure;
imagesc(img_sobel_x);
colorbar;
colormap hsv;
axis off;
title('Sobel X Gradient');

figure;
imagesc(log(1 + img_edge_strength_x));
colorbar;
axis off;
title('X-Gradient Edge Strength');

figure;
imagesc(img_neg_edge_x);
colorbar;
colormap gray;
axis off;
title('Negative X-Gradients');

figure;
imagesc(img_pos_edge_x);
colorbar;
colormap gray;
axis off;
title('Positive X-Gradients');

figure;
imagesc(img_neg_edge_y);
colorbar;
colormap gray;
axis off;
title('Negative Y-Gradients');

figure;
imagesc(img_pos_edge_y);
colorbar;
colormap gray;
axis off;
title('Positive Y-Gradients');

%% Detect door-gap contour candidates

% Detect symmetric vertical edge transitions
img_sym_x = img_neg_edge_x & img_pos_edge_x;

img_sym_x = imopen(img_sym_x, ...
                   strel('disk', 1));

% Symmetric filter for light-dark-light transitions
sym_filter = [-1 2 -1];

img_sym_x = imfilter(double(img_sym_x), ...
                     sym_filter, ...
                     'replicate');

% Combine symmetric transitions with edge strength
candidates_x = img_sym_x & ...
               (img_edge_strength_x > threshold_x_neg);

% Widen detected candidate lines
candidates_x = imdilate(candidates_x, ...
                        strel('disk', 1));


% Detect symmetric horizontal edge transitions
img_sym_y = img_neg_edge_y & img_pos_edge_y;

img_sym_y = imopen(img_sym_y, ...
                   strel('disk', 1));

% Combine symmetric transitions with edge strength
candidates_y = img_sym_y & ...
               (img_edge_strength_y > threshold_y_neg);

% Widen detected candidate lines
candidates_y = imdilate(candidates_y, ...
                        strel('disk', 1));

%% Visualize contour candidates

figure;
imagesc(max(max(img_sym_x)) - abs(img_sym_x));
colorbar;
colormap gray;
axis off;
title('Symmetric X Edge Detection');

figure;
imagesc(1 - candidates_x);
colorbar;
colormap gray;
axis off;
title('Candidate X for Door Gap');

figure;
imagesc(1 - candidates_y);
colorbar;
colormap gray;
axis off;
title('Candidate Y for Door Gap');

%% Detect door-gap boundary lines

% Widen vertical contours
contours_x_widened = imdilate(candidates_x, ...
                              strel('disk', 2));

% Hough transform for vertical lines
[H_x, theta_x, rho_x] = hough(contours_x_widened);

% Detect peaks in Hough space
peaks_x = houghpeaks(H_x, ...
                     5, ...
                     'threshold', ...
                     ceil(0.3 * max(H_x(:))));

% Detect vertical lines
lines_x = houghlines(candidates_x, ...
                     theta_x, ...
                     rho_x, ...
                     peaks_x, ...
                     'FillGap', 200, ...
                     'MinLength', 500);

% Convert detected vertical lines to Hesse normal form
l_x = [cos(lines_x(1).theta), cos(lines_x(2).theta);
       sin(lines_x(1).theta), sin(lines_x(2).theta);
       lines_x(1).rho,        lines_x(2).rho];


% Widen horizontal contours
contours_y_widened = imdilate(candidates_y, ...
                              strel('disk', 2));

% Hough transform for horizontal lines
[H_y, theta_y, rho_y] = hough(contours_y_widened);

% Detect peaks in Hough space
peaks_y = houghpeaks(H_y, ...
                     5, ...
                     'threshold', ...
                     ceil(0.3 * max(H_y(:))));

% Detect horizontal lines
lines_y = houghlines(candidates_y, ...
                     theta_y, ...
                     rho_y, ...
                     peaks_y, ...
                     'FillGap', 500, ...
                     'MinLength', 300);

% Convert detected horizontal lines to Hesse normal form
l_y = [cos(lines_y(1).theta), cos(lines_y(2).theta);
       sin(lines_y(1).theta), sin(lines_y(2).theta);
       lines_y(1).rho,        lines_y(2).rho];

%% Visualize detected door-gap boundaries

figure;
imshow(image, 'Border', 'tight');
hold on;

% Vertical boundaries
for k = 1:2
    plot([round(-(l_x(2, k) + l_x(3, k)) / l_x(1, k));
          round(-(M * l_x(2, k) + l_x(3, k)) / l_x(1, k))], ...
         [1, M], ...
         'LineWidth', 1, ...
         'Color', 'green');
end

% Horizontal boundaries
for k = 1:2
    plot([1, N], ...
         [round(-(l_y(1, k) + l_y(3, k)) / l_y(2, k));
          round(-(N * l_y(1, k) + l_y(3, k)) / l_y(2, k))], ...
         'LineWidth', 1, ...
         'Color', 'green');
end

title('Detected Door-Gap Boundaries');
hold off;

%% Estimate door-gap corner points

% Apply Hough transform to the final candidate contours
[H_x, theta_x, rho_x] = hough(candidates_x);
[H_y, theta_y, rho_y] = hough(candidates_y);

% Detect strongest line candidates
peaks_x = houghpeaks(H_x, ...
                     5, ...
                     'threshold', ...
                     ceil(0.3 * max(H_x(:))));

peaks_y = houghpeaks(H_y, ...
                     5, ...
                     'threshold', ...
                     ceil(0.3 * max(H_y(:))));

% Ensure that enough lines were detected
if size(peaks_x, 1) < 2
    error('Not enough vertical lines were detected.');
end

if size(peaks_y, 1) < 2
    error('Not enough horizontal lines were detected.');
end

% Parameters of the two vertical lines
row_x_left = peaks_x(1, 1);
col_x_left = peaks_x(1, 2);

row_x_right = peaks_x(2, 1);
col_x_right = peaks_x(2, 2);

Theta_x_left = theta_x(col_x_left);
Rho_x_left = rho_x(row_x_left);

Theta_x_right = theta_x(col_x_right);
Rho_x_right = rho_x(row_x_right);


% Parameters of the two horizontal lines
row_y_up = peaks_y(1, 1);
col_y_up = peaks_y(1, 2);

row_y_down = peaks_y(2, 1);
col_y_down = peaks_y(2, 2);

Theta_y_up = theta_y(col_y_up);
Rho_y_up = rho_y(row_y_up);

Theta_y_down = theta_y(col_y_down);
Rho_y_down = rho_y(row_y_down);


% Hesse normal form of the detected boundaries
l_x_left = [cos(Theta_x_left), ...
            sin(Theta_x_left), ...
            Rho_x_left];

l_x_right = [cos(Theta_x_right), ...
             sin(Theta_x_right), ...
             Rho_x_right];

l_y_up = [cos(Theta_y_up), ...
          sin(Theta_y_up), ...
          Rho_y_up];

l_y_down = [cos(Theta_y_down), ...
            sin(Theta_y_down), ...
            Rho_y_down];

%% Calculate corner points

% Top-left corner
lb = [ ...
    -(l_x_left(2) * l_y_up(3) - ...
      l_y_up(2) * l_x_left(3)) / ...
     (l_x_left(1) * l_y_up(2) - ...
      l_x_left(2) * l_y_up(1)), ...

    -(l_x_left(1) * l_y_up(3) - ...
      l_y_up(1) * l_x_left(3)) / ...
     (l_x_left(1) * l_y_up(2) - ...
      l_x_left(2) * l_y_up(1))];

% Bottom-left corner
lu = [ ...
    -(l_x_left(2) * l_y_down(3) - ...
      l_y_down(2) * l_x_left(3)) / ...
     (l_x_left(1) * l_y_down(2) - ...
      l_x_left(2) * l_y_down(1)), ...

    -(l_x_left(1) * l_y_down(3) - ...
      l_y_down(1) * l_x_left(3)) / ...
     (l_x_left(1) * l_y_down(2) - ...
      l_x_left(2) * l_y_down(1))];

% Top-right corner
rb = [ ...
    -(l_x_right(2) * l_y_up(3) - ...
      l_y_up(2) * l_x_right(3)) / ...
     (l_x_right(1) * l_y_up(2) - ...
      l_x_right(2) * l_y_up(1)), ...

    -(l_x_right(1) * l_y_up(3) - ...
      l_y_up(1) * l_x_right(3)) / ...
     (l_x_right(1) * l_y_up(2) - ...
      l_x_right(2) * l_y_up(1))];

% Bottom-right corner
ru = [ ...
    -(l_x_right(2) * l_y_down(3) - ...
      l_y_down(2) * l_x_right(3)) / ...
     (l_x_right(1) * l_y_down(2) - ...
      l_x_right(2) * l_y_down(1)), ...

    -(l_x_right(1) * l_y_down(3) - ...
      l_y_down(1) * l_x_right(3)) / ...
     (l_x_right(1) * l_y_down(2) - ...
      l_x_right(2) * l_y_down(1))];

%% Display final detection

figure;
imshow(image, 'Border', 'tight');
hold on;

% Left boundary
plot([round(-(l_x_left(2) + l_x_left(3)) / l_x_left(1));
      round(-(M * l_x_left(2) + l_x_left(3)) / l_x_left(1))], ...
     [1, M], ...
     'LineWidth', 1, ...
     'Color', 'red');

% Right boundary
plot([round(-(l_x_right(2) + l_x_right(3)) / l_x_right(1));
      round(-(M * l_x_right(2) + l_x_right(3)) / l_x_right(1))], ...
     [1, M], ...
     'LineWidth', 1, ...
     'Color', 'green');

% Upper boundary
plot([1, N], ...
     [round(-(l_y_up(1) + l_y_up(3)) / l_y_up(2));
      round(-(N * l_y_up(1) + l_y_up(3)) / l_y_up(2))], ...
     'LineWidth', 1, ...
     'Color', 'red');

% Lower boundary
plot([1, N], ...
     [round(-(l_y_down(1) + l_y_down(3)) / l_y_down(2));
      round(-(N * l_y_down(1) + l_y_down(3)) / l_y_down(2))], ...
     'LineWidth', 1, ...
     'Color', 'green');

% Corner points
plot(lb(1), lb(2), 'ro', 'MarkerFaceColor', 'r');
plot(lu(1), lu(2), 'go', 'MarkerFaceColor', 'g');
plot(ru(1), ru(2), 'bo', 'MarkerFaceColor', 'b');
plot(rb(1), rb(2), 'ko', 'MarkerFaceColor', 'k');

title('Door Gap Detection and Corner Points');

hold off;

%% Display detected corner coordinates

fprintf('\nDetected door-gap corner points:\n');
fprintf('Top-left:     (%.2f, %.2f)\n', lb(1), lb(2));
fprintf('Bottom-left:  (%.2f, %.2f)\n', lu(1), lu(2));
fprintf('Top-right:    (%.2f, %.2f)\n', rb(1), rb(2));
fprintf('Bottom-right: (%.2f, %.2f)\n', ru(1), ru(2));