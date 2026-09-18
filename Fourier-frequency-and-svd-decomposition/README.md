# Frequency and SVD Image Analysis

## Overview

This project demonstrates two complementary approaches to image analysis using MATLAB:

- Frequency-domain analysis using the 2D Fourier Transform
- Image decomposition using Singular Value Decomposition (SVD)

The Fourier-based section analyzes the frequency content of an image and demonstrates frequency-domain filtering. The SVD section represents an image using a combination of rank-1 components and investigates how image information can be approximated using a limited number of singular components.

Together, the implementations demonstrate two different mathematical representations of image information.

## Objective

The main objectives are to:

- Analyze images in the spatial and frequency domains
- Generate and inspect 2D Fourier spectra
- Separate low- and high-frequency information
- Apply frequency-domain filtering
- Reconstruct images after frequency filtering
- Decompose an image using SVD
- Investigate low-rank image approximations
- Understand how image information is distributed across different components

---

## Part 1 — Fourier Frequency Analysis

### Frequency-Domain Representation

An image can be represented either in the spatial domain or in the frequency domain.

In the spatial domain, an image is represented directly by its pixel intensities.

In the frequency domain, the image is represented using spatial frequency components.

The 2D Discrete Fourier Transform (DFT) converts an image from the spatial domain into its frequency representation.

Conceptually:

    Spatial-Domain Image
            ↓
          2D FFT
            ↓
    Frequency-Domain Representation
            ↓
    Frequency Analysis / Filtering
            ↓
         Inverse FFT
            ↓
    Reconstructed Image

### Implementation

The Fourier-analysis section works with an image and calculates its 2D Fourier Transform using MATLAB.

The frequency representation contains information about how rapidly intensity changes across the image.

The implementation investigates both the magnitude and phase of the Fourier representation.

### 2D Fourier Transform

The 2D Fourier Transform can be represented conceptually as:

$begin:math:display$
F\(u\,v\) \=
\\sum\_x \\sum\_y
f\(x\,y\)
e\^\{\-j2\\pi\\left\(\\frac\{ux\}\{M\}\+\\frac\{vy\}\{N\}\\right\)\}
$end:math:display$

where:

- $begin:math:text$f\(x\,y\)$end:math:text$ is the spatial-domain image
- $begin:math:text$F\(u\,v\)$end:math:text$ is the frequency-domain representation
- $begin:math:text$u\,v$end:math:text$ are frequency coordinates
- $begin:math:text$M\,N$end:math:text$ are the image dimensions

MATLAB's `fft2` function is used to calculate the 2D Fourier Transform.

### Magnitude and Phase

The Fourier Transform produces complex-valued coefficients.

Each coefficient contains both magnitude and phase information.

The magnitude can be calculated as:

$begin:math:display$
\|F\(u\,v\)\|
$end:math:display$

and the phase as:

$begin:math:display$
\\angle F\(u\,v\)
$end:math:display$

The magnitude spectrum shows the strength of different frequency components, while the phase contains information about their spatial alignment.

### Frequency Shifting

The zero-frequency component is normally located at the corners of the Fourier spectrum.

The implementation uses frequency shifting to move the low-frequency components toward the center of the visualization.

This makes the frequency spectrum easier to interpret.

### Frequency-Domain Filtering

The implementation applies a Gaussian frequency-domain filter to modify the frequency content of the image.

A low-pass filter preserves low-frequency components while attenuating high-frequency components.

A high-pass filter has the opposite effect and emphasizes higher-frequency information.

Conceptually:

    Original Image
          ↓
         FFT
          ↓
    Frequency Spectrum
          ↓
    Apply Frequency Mask
          ↓
    Filtered Spectrum
          ↓
      Inverse FFT
          ↓
     Filtered Image

### Low-Pass Filtering

Low-pass filtering preserves slowly varying image information while reducing high-frequency components.

The resulting image generally appears smoother because high-frequency details and sharp transitions are attenuated.

Typical effects include:

- Smoothing
- Noise reduction
- Reduction of fine details

### High-Pass Filtering

High-pass filtering emphasizes rapid intensity changes.

These changes are commonly associated with:

- Edges
- Fine details
- Sharp transitions

The resulting image therefore emphasizes high-frequency structures.

---

## Part 2 — SVD Image Decomposition

### Singular Value Decomposition

Singular Value Decomposition provides a mathematical way of decomposing a matrix into three components.

For an image matrix $begin:math:text$A$end:math:text$:

$begin:math:display$
A \= U\\Sigma V\^T
$end:math:display$

where:

- $begin:math:text$U$end:math:text$ contains the left singular vectors
- $begin:math:text$\\Sigma$end:math:text$ contains the singular values
- $begin:math:text$V\^T$end:math:text$ contains the right singular vectors

An image can therefore be represented as a combination of simpler rank-1 matrices.

### Image Decomposition

Each singular value corresponds to the contribution of a particular component to the original image.

The image can be approximated using only the first $begin:math:text$k$end:math:text$ singular components:

$begin:math:display$
A\_k \=
\\sum\_\{i\=1\}\^\{k\}
\\sigma\_i u\_i v\_i\^T
$end:math:display$

where:

- $begin:math:text$k$end:math:text$ is the number of components used
- $begin:math:text$\\sigma\_i$end:math:text$ is the $begin:math:text$i$end:math:text$-th singular value
- $begin:math:text$u\_i$end:math:text$ is the corresponding left singular vector
- $begin:math:text$v\_i$end:math:text$ is the corresponding right singular vector

Using fewer components produces a lower-rank approximation of the original image.

### Implementation

The SVD section loads an image and decomposes its image matrix using MATLAB's `svd` function.

The individual rank-1 components are then used to investigate how the image can be reconstructed from a limited number of singular components.

The implementation examines the contribution of the leading components and demonstrates the concept of low-rank image representation.

### Rank-1 Components

Each individual component can be expressed as:

$begin:math:display$
A\_i \= \\sigma\_i u\_i v\_i\^T
$end:math:display$

This is a rank-1 approximation of the original image.

Adding multiple components together progressively reconstructs more information from the original image.

Conceptually:

    Original Image
          ↓
          SVD
          ↓
    Singular Components
          ↓
    ┌───────────────┐
    │ Component 1   │
    │ Component 2   │
    │ Component 3   │
    │      ...      │
    │ Component k   │
    └───────────────┘
          ↓
    Combine Components
          ↓
    Approximate Image

### Low-Rank Approximation

The singular values are ordered from largest to smallest.

The first few components therefore capture a significant portion of the image structure.

Using only a subset of the components can provide an approximation while reducing the number of values required to represent the image.

This is one of the mathematical foundations behind low-rank image compression and dimensionality reduction.

---

## Fourier Analysis vs. SVD

The two approaches analyze image information in fundamentally different ways.

| Method | Representation | Main Focus |
|---|---|---|
| Fourier Transform | Frequency domain | Spatial frequencies |
| SVD | Matrix decomposition | Rank and image structure |
| Fourier filtering | Frequency components | Smoothing and detail extraction |
| SVD reconstruction | Singular components | Low-rank approximation |

Fourier analysis describes an image in terms of spatial frequencies, while SVD describes the image as a combination of matrix components.

---

## Combined Processing Overview

The complete project can be summarized as:

    Image
      │
      ├───────────────────────────┐
      │                           │
      ▼                           ▼
    Fourier                      SVD
    Analysis                  Decomposition
      │                           │
      ▼                           ▼
    Frequency                Singular Values
    Spectrum                 and Vectors
      │                           │
      ├─────────────┐             │
      │             │             │
      ▼             ▼             ▼
    Low-Pass      High-Pass    Rank Reduction
    Filtering     Filtering    / Approximation
      │             │             │
      ▼             ▼             ▼
    Filtered      Filtered     Reconstructed
    Image         Image        Image

## Input

The project uses image data for the Fourier and SVD experiments.

The Fourier-analysis section can operate on an input image such as:

`Input_image.png`

The SVD section uses an image such as:

`Cosmea.jpg`

The required image files should be placed in the expected location relative to the MATLAB script.

## Output

The implementation generates visualizations showing the results of both image-analysis approaches.

### Fourier Analysis

The Fourier section produces visualizations of:

- Original image
- Fourier magnitude spectrum
- Fourier phase information
- Low-pass filtered result
- High-pass filtered result
- Reconstructed images after inverse Fourier transformation

### SVD Analysis

The SVD section produces visualizations of:

- Original image
- Individual SVD components
- Rank-1 image contributions
- Low-rank image approximations
- Reconstructed image using selected singular components

## Applications

The concepts demonstrated in this project are relevant to several areas of computer vision and image processing, including:

- Image filtering
- Image enhancement
- Noise reduction
- Edge analysis
- Frequency-domain processing
- Image compression
- Dimensionality reduction
- Low-rank approximation
- Feature representation

## Requirements

- MATLAB
- Image Processing Toolbox where required by the image-processing functions used
- Input image files for the corresponding experiments

## How to Run

1. Open MATLAB.
2. Navigate to the `frequency-and-svd-image-analysis` directory.
3. Make sure the required input images are available.
4. Open the MATLAB script:

`frequency_and_svd_image_analysis.m`

5. Run the script.
6. The Fourier-analysis and SVD results will be displayed in MATLAB figures.

## Key Concepts

- 2D Discrete Fourier Transform
- Fast Fourier Transform (FFT)
- Frequency-domain representation
- Magnitude spectrum
- Phase spectrum
- Frequency shifting
- Low-pass filtering
- High-pass filtering
- Inverse Fourier Transform
- Singular Value Decomposition (SVD)
- Rank-1 decomposition
- Low-rank approximation
- Image reconstruction
- Dimensionality reduction
- Image compression concepts        ↓
     Inverse FFT
        ↓
Reconstructed Image
