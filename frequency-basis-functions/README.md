# Frequency Basis Functions

## Overview

This project demonstrates the representation of a 2D image using frequency basis functions in MATLAB.

The implementation explores how an image can be represented as a combination of sinusoidal and complex-valued basis functions. This provides an introduction to frequency-domain image representation and the mathematical foundations behind Fourier-based image processing.

## Objective

The main objective is to understand how spatial image information can be represented using frequency components.

The implementation focuses on:

- Representing images as matrices
- Generating 2D frequency basis functions
- Working with complex-valued sinusoidal functions
- Visualizing individual frequency components
- Understanding spatial and frequency-domain representations

## Frequency Representation

An image can be interpreted as a combination of different spatial frequency components.

Low-frequency components generally describe slowly changing image information, such as:

- Smooth intensity variations
- Large-scale structures
- Gradual transitions

High-frequency components describe rapidly changing information, such as:

- Edges
- Fine details
- Sharp intensity transitions

A 2D frequency basis function can be represented using a complex exponential:

\[
\phi_{u,v}(x,y)
=
e^{j2\pi\left(\frac{ux}{M}+\frac{vy}{N}\right)}
\]

where:

- \(x,y\) are spatial coordinates
- \(u,v\) are frequency indices
- \(M,N\) are the image dimensions
- \(j\) is the imaginary unit

Using different values of \(u\) and \(v\) produces different spatial frequency patterns.

## Implementation

The MATLAB implementation creates a small binary image and generates frequency basis functions for different frequency indices.

The resulting basis functions are complex-valued. Their real and imaginary components can be visualized separately to show the sinusoidal structure of each frequency component.

The implementation therefore provides a visual connection between:

```text
Spatial Image
      ↓
Pixel Matrix
      ↓
Frequency Basis Functions
      ↓
Complex Sinusoidal Components
      ↓
Real / Imaginary Components
