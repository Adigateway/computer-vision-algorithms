%% Synthetic Binary Shape Mask Generator

N = 100;            % Canvas dimension (NxN)
cx = 50; cy = 50;   % Shape center coordinates
r = 25;             % Circle radius
side = 50;          % Square side length

% Generate spatial coordinate grid
[X, Y] = meshgrid(1:N);
dist = hypot(X - cx, Y - cy);

% Generate Circle Masks
circle_filled = dist <= r;
circle_outline = bwperim(circle_filled); 

% Generate Square Masks
square_filled = false(N);
half_side = side / 2;
square_filled((cy - half_side):(cy + half_side - 1), ...
              (cx - half_side):(cx + half_side - 1)) = true;

square_outline = bwperim(square_filled);

% Store masks in a struct for batch export and preview
masks.circle_filled  = circle_filled;
masks.circle_outline = circle_outline;
masks.square_filled  = square_filled;
masks.square_outline = square_outline;

% Export PNG files
fields = fieldnames(masks);
for k = 1:numel(fields)
    imwrite(masks.(fields{k}), [fields{k} '.png']);
end

% Preview generated masks
figure('Name', 'Generated Masks', 'NumberTitle', 'off');
for k = 1:numel(fields)
    subplot(2, 2, k);
    imshow(masks.(fields{k}));
    title(fields{k}, 'Interpreter', 'none');
end