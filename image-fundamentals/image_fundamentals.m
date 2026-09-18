% Read and display original image
img = imread('TestbildFernseher.jpg');
figure(1); image(img); axis image;

% 2.1 part (b) - Extract ROI
imgROI = img(250:278, 175:245, :);
figure(2); image(imgROI); axis image;

% 2.1 part (c) - Retain monochrome/gray pixels
gray_values = (img(:,:,1) == img(:,:,2)) & (img(:,:,2) == img(:,:,3));
result_img = img;
result_img(repmat(~gray_values, [1, 1, 3])) = 0; % Fixed 'repmat' typo
figure(3); image(result_img); axis image;

% 2.2 Synthetic images
testImg_1 = randi([65 255], 100, 100);
mu = 128;
sigma = 50;
testImg_2 = mu + sigma .* randn(100, 100);

% Dedicated figure window for histogram
figure(4); 
histogram(testImg_2); 
title('Histogram of testImg 2');

% 2.2 (b) - Alternating bar width pattern
testImg_3 = zeros(100, 110);
for k = 1:10
    testImg_3(:, (1 + (k - 1) * k):(k * k)) = 255;
end

% Subplot display using uint8 casting for proper 0-255 grayscale mapping
figure(5);
subplot(1,3,1); image(uint8(testImg_1)); axis('image', 'off'); colormap gray; title('Uniform Noise');
subplot(1,3,2); image(uint8(testImg_2)); axis('image', 'off'); colormap gray; title('Gaussian Noise');
subplot(1,3,3); image(uint8(testImg_3)); axis('image', 'off'); colormap gray; title('Bar Pattern');

% Shape annotations
img_annotated = imread('TestbildFernseher.jpg');
img_annotated = insertShape(img_annotated, 'Line', [54,88,445,411], 'Color', 'blue', 'LineWidth', 5);
img_annotated = insertShape(img_annotated, 'Circle', [250,250,234], 'Color', 'red', 'LineWidth', 5);
img_annotated = insertShape(img_annotated, 'Rectangle', [54,88,391,323], 'Color', 'green', 'LineWidth', 5);

figure(6);
imshow(img_annotated); % Fixed 'imshow' typo