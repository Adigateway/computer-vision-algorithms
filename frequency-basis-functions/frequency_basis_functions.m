%% Task 5.1 (a): Display 3x3 Binary Image
Img = [0 1 1; 
       0 1 0; 
       1 1 0];

figure(1);
imagesc(Img);
colormap gray;
axis image;
colorbar;
title('3x3 Binary Input Image');

%% Task 5.1 (b): 1D Row Fourier Basis Functions
[M, N] = size(Img);
n = 0:(N-1);          % Spatial row indices (1xN)
v = (0:(N-1))';       % Frequency indices (Nx1)

% Vectorized computation of row basis using Euler's formula: exp(j * 2 * pi * v * n / N)
w_N_v = exp(1i * 2 * pi * (v * n) / N);

figure(2);
sgtitle('1D Row Fourier Basis Functions (N = 3)');
for v_idx = 1:N
    % Real Part
    ax1 = subplot(N, 2, 2 * v_idx - 1);
    imagesc(real(w_N_v(v_idx, :)), [-1 1]);
    colormap gray; axis image;
    title(sprintf('Real (v = %d)', v_idx - 1));
    ylabel(sprintf('w_N^{%d}', v_idx - 1), 'Rotation', 0, 'HorizontalAlignment', 'right');
    xticks([]); yticks([]);

    % Imaginary Part
    ax2 = subplot(N, 2, 2 * v_idx);
    imagesc(imag(w_N_v(v_idx, :)), [-1 1]);
    colormap gray; axis image;
    title(sprintf('Imag (v = %d)', v_idx - 1));
    xticks([]); yticks([]);
end

%% Task 5.1 (c): 1D Column Fourier Basis Functions
m = (0:(M-1))';       % Spatial column indices (Mx1)
u = 0:(M-1);          % Frequency indices (1xM)

% Vectorized computation of column basis matrix
w_M_u = exp(1i * 2 * pi * (m * u) / M);

figure(3);
sgtitle('1D Column Fourier Basis Functions (M = 3)');
for u_idx = 1:M
    % Real Part
    ax1 = subplot(M, 2, 2 * u_idx - 1);
    imagesc(real(w_M_u(:, u_idx)), [-1 1]);
    colormap gray; axis image;
    title(sprintf('Real (u = %d)', u_idx - 1));
    ylabel(sprintf('w_M^{%d}', u_idx - 1), 'Rotation', 0, 'HorizontalAlignment', 'right');
    xticks([]); yticks([]);

    % Imaginary Part
    ax2 = subplot(M, 2, 2 * u_idx);
    imagesc(imag(w_M_u(:, u_idx)), [-1 1]);
    colormap gray; axis image;
    title(sprintf('Imag (u = %d)', u_idx - 1));
    xticks([]); yticks([]);
end