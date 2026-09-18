%% SECTION 1: ROTATION, FLIPPING, & SORTING
% Read original image
img = imread('FilingCabinet.jpg');
figure(1); imshow(img); title('Original Image');

% Part (a): Rotate 90 degrees clockwise
rotated_img = fliplr(permute(img, [2, 1, 3]));
figure(2); imshow(rotated_img); title('Rotated Image (90° Clockwise)');

% Part (b): Flip rotated image horizontally & vertically
flipped_img = flipud(fliplr(rotated_img));
figure(3); imshow(flipped_img); title('Flipped Rotated Image');

% Part (c): Convert to grayscale and sort rows/columns
gray_image = rgb2gray(rotated_img);
sorted_columns = sort(gray_image, 1);
sorted_rows = sort(gray_image, 2);

figure(4);
subplot(1, 2, 1); imshow(sorted_columns); title('Sorted Columns');
subplot(1, 2, 2); imshow(sorted_rows); title('Sorted Rows');

%% SECTION 2: ARITHMETIC OPERATIONS & CONTRAST
cosmea = imread('Cosmea.jpg');
flowerpots = imread('FlowerpotsDark.jpg');

% (a) Brightness shifts & color inversion (uint8 clips at 0 and 255)
cosmea_add_100 = cosmea + 100; % Increases brightness
figure(5); imshow(cosmea_add_100); title('Cosmea +100 Brightness');

cosmea_subtract_100 = cosmea - 100; % Decreases brightness
figure(6); imshow(cosmea_subtract_100); title('Cosmea -100 Brightness');

cosmea_inverted = 255 - cosmea;
figure(7); imshow(cosmea_inverted); title('Inverted Color Channels');

% (b) Scale dark flowerpots image to full [0, 255] range
flowerpots_gray = rgb2gray(flowerpots);
min_val = min(flowerpots_gray(:));
max_val = max(flowerpots_gray(:));
disp(['Minimum grayscale value: ', num2str(min_val)]);
disp(['Maximum grayscale value: ', num2str(max_val)]);

flowerpots_scaled = uint8(255 * (double(flowerpots_gray) - double(min_val)) / double(max_val - min_val));
figure(8); imshow(flowerpots_scaled); title('Scaled Grayscale Image [0, 255]');
figure(9); imshow(flowerpots); title('Original Dark Flowerpots');

% Contrast spreading (requires custom contrast_spread.m function)
cosmea_gray = rgb2gray(cosmea);
Gmin1 = 0; Gmax1 = 127;
contrast_spread1 = contrast_spread(cosmea_gray, Gmin1, Gmax1);

Gmin2 = 128; Gmax2 = 255;
contrast_spread2 = contrast_spread(cosmea_gray, Gmin2, Gmax2);

figure(10); imshow(cosmea_gray); title('Original Grayscale Image');
figure(11); imshow(contrast_spread1); title('Contrast Spread [0, 127]');
figure(12); imshow(contrast_spread2); title('Contrast Spread [128, 255]');

% (d) Gamma compression
gamma = 0.5;
flowerpots_compressed_custom = uint8(255 * (double(flowerpots_gray)/255).^gamma);

figure(13); imshow(flowerpots_gray); title('Original Grayscale Image');
figure(14); imshow(flowerpots_compressed_custom); title(['Compressed Custom Gamma = ' num2str(gamma)]);

flowerpots_compressed_imadjust = imadjust(flowerpots_gray, [], [], gamma);
figure(15); imshow(flowerpots_compressed_imadjust); title(['Compressed imadjust Gamma = ' num2str(gamma)]);

%% SECTION 3: IMAGE STATISTICS & HISTOGRAMS
flowerpots_bright = imread('FlowerPotsBright.jpg');
flowerpots_gray_bright = rgb2gray(flowerpots_bright);

% Statistical properties (calculated on 2D grayscale image)
mean_value = mean2(flowerpots_gray_bright);
std_value = std2(flowerpots_gray_bright); 
disp(['Mean: ', num2str(mean_value)]);
disp(['Standard Deviation: ', num2str(std_value)]);

% Normalization
flowerpots_normalized = (double(flowerpots_gray_bright) - mean_value) / std_value;
figure(16); imshow(flowerpots_normalized, []); title('Normalized Grayscale Image');

% Auto & Cross-Correlation
num_pixels = numel(flowerpots_normalized);
autocorrelation = sum(flowerpots_normalized(:).^2) / num_pixels;
disp(['Autocorrelation: ', num2str(autocorrelation)]);

flowerpots_negative = -flowerpots_normalized;
cross_correlation = sum(flowerpots_normalized(:) .* flowerpots_negative(:)) / num_pixels;
disp(['Cross-correlation: ', num2str(cross_correlation)]);

% Binned Histograms
figure(17);
subplot(3, 1, 1); imhist(flowerpots_gray_bright, 16); title('16 Bins');
subplot(3, 1, 2); imhist(flowerpots_gray_bright, 32); title('32 Bins');
subplot(3, 1, 3); imhist(flowerpots_gray_bright, 64); title('64 Bins');

% Histogram Equalization
flowerpots_histeq = histeq(flowerpots_gray_bright);
figure(18); imshow(flowerpots_histeq); title('Histogram Equalized Image');
figure(19); imhist(flowerpots_histeq, 64); title('64-Bin Histogram of Equalized Image');

% Adaptive Histogram Equalization
flowerpots_adapthisteq = adapthisteq(flowerpots_gray_bright);
figure(20);
subplot(1, 2, 1); imshow(flowerpots_histeq); title('Global Histogram Equalized');
subplot(1, 2, 2); imshow(flowerpots_adapthisteq); title('Local Adaptive Histogram Equalized');