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

# Part 1 — Fourier Frequency Analysis

## Frequency-Domain Representation

An image can be represented either in the spatial domain or in the frequency domain.

In the spatial domain, an image is represented directly by its pixel intensities.

In the frequency domain, the image is represented using spatial frequency components.

The 2D Discrete Fourier Transform (DFT) converts an image from the spatial domain into its frequency representation.

Conceptually:

```text
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
