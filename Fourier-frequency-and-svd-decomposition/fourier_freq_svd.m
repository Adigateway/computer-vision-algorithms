%% SECTION 1: TASK 6.1 - SYNTHETIC 2D COSINE SIGNAL & SPECTRA
clear; clc; close all;

% Task 6.1 (a): Generate 2D Synthetic Cosine Signal
M = 300; 
N = 400;
k1 = 2; 
k2 = 4;
phi = 0;

[m, n] = meshgrid(0:N-1, 0:M-1);
G = cos(2*pi*(m*k1/M + n*k2/N) - deg2rad(phi));

figure(1);
subplot(1, 2, 1);
imagesc(G); colormap gray; colorbar; axis image;
title('2D Cosine Image');

subplot(1, 2, 2);
surf(G, 'EdgeColor', 'none'); colormap gray; colorbar;
title('2D Cosine Surface Plot');

% Task 6.1 (b): 2D FFT, Magnitude & Phase Spectra
G_fft_shifted = fftshift(fft2(G));
magnitude = abs(G_fft_shifted);
phase = angle(G_fft_shifted);

figure(2);
subplot(1, 2, 1);
imagesc(log(1 + magnitude)); colormap gray; colorbar; axis image;
title('Magnitude Spectrum');

subplot(1, 2, 2);
imagesc(phase); colormap gray; colorbar; axis image;
title('Phase Spectrum');

% Parameter Shift Analysis
k1 = 7; k2 = 9; phi = 45; 
G_new = cos(2*pi*(m*k1/M + n*k2/N) - deg2rad(phi));
G_new_fft_shifted = fftshift(fft2(G_new));

figure(3);
imagesc(log(1 + abs(G_new_fft_shifted))); colormap gray; colorbar; axis image;
title('Magnitude Spectrum (k_1=7, k_2=9, \phi=45^\circ)');


%% SECTION 2: TASK 6.1 - IMAGE FOURIER ANALYSIS & GAUSSIAN FILTERING

% Task 6.1 (c): Read Image and Compute 2D FFT
if exist('Input_image.png', 'file')
    Input_image = imread('Input_image.png');
else
    Input_image = imread('cameraman.tif'); % Fallback sample image
end

if size(Input_image, 3) == 3
    Input_image_gray = rgb2gray(Input_image);
else
    Input_image_gray = Input_image;
end

Input_image_gray_fft_shifted = fftshift(fft2(double(Input_image_gray)));
magnitude_input = abs(Input_image_gray_fft_shifted);
phase_input = angle(Input_image_gray_fft_shifted);

figure(4);
subplot(1, 3, 1); imshow(Input_image_gray); title('Original Image');
subplot(1, 3, 2); imagesc(log(1 + magnitude_input)); colormap gray; colorbar; axis image; title('Magnitude Spectrum');
subplot(1, 3, 3); imagesc(phase_input); colormap gray; colorbar; axis image; title('Phase Spectrum');

% Task 6.1 (d): 2D Gaussian Weighting Matrix (Low-Pass Filter)
[M_img, N_img] = size(Input_image_gray);
u0 = N_img / 2; 
v0 = M_img / 2;

sigma_u = N_img / 10;
sigma_v = M_img / 10;

[u, v] = meshgrid(0:N_img-1, 0:M_img-1);
u_shifted = u - u0;
v_shifted = v - v0;

W = exp(- (u_shifted.^2 / (2*sigma_u^2) + v_shifted.^2 / (2*sigma_v^2)));

figure(5);
imagesc(W); colormap gray; colorbar; axis image;
title('2D Gaussian Weighting Matrix (Frequency Domain)');

% Task 6.1 (e) & (f): Low-Pass vs High-Pass Filtering & Reconstruction
% Low-Pass Filtering
abs_low_shift = W .* magnitude_input;
G_low_fft = abs_low_shift .* exp(1i * phase_input); % Reconstruct complex spectrum
G_low = ifft2(ifftshift(G_low_fft));

% High-Pass Filtering
inverse_W = 1 - W;
abs_high_shift = inverse_W .* magnitude_input;
G_high_fft = abs_high_shift .* exp(1i * phase_input); % Reconstruct complex spectrum
G_high = ifft2(ifftshift(G_high_fft));

% Display Filter Comparison
figure(6);
subplot(1, 3, 1); imshow(Input_image_gray, []); title('Original Image');
subplot(1, 3, 2); imshow(abs(G_low), []); title('Low-Pass Filtered Image');
subplot(1, 3, 3); imshow(abs(G_high), []); title('High-Pass Filtered Image');


%% SECTION 3: TASK 6.2 - SINGULAR VALUE DECOMPOSITION (SVD) BASIS IMAGES

% Task 6.2 (a): SVD Outer Product Basis Decomposition
if exist('Cosmea.jpg', 'file')
    imgread = imread('Cosmea.jpg');
else
    imgread = imread('peppers.png'); % Fallback sample image
end

im = rgb2gray(imgread);
im = imresize(im, [400, 600]);

[U, S, V] = svd(double(im));

figure(7);
sgtitle('First 20 SVD Rank-1 Outer Product Basis Images (u_i \cdot v_i^T)');
for i = 1:20
    subplot(5, 4, i);
    imagesc(U(:, i) * V(:, i)');
    colormap gray; axis image;
    title(sprintf('i = %d', i));
    xticks([]); yticks([]);
    endfou