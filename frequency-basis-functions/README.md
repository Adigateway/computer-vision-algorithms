# Frequency Basis Functions

## Overview

This project demonstrates the representation of image data using frequency-domain basis functions in MATLAB.

The implementation explores how images and signals can be represented as combinations of basis functions and how frequency components contribute to the overall structure of an image.

The project provides a foundation for understanding frequency-domain image processing and the relationship between spatial and frequency representations.

## Objective

The main objective is to investigate how images can be represented using frequency basis functions.

The implementation focuses on:

- Understanding frequency-domain representations
- Generating frequency basis functions
- Visualizing spatial and frequency patterns
- Studying the effect of different frequency components
- Understanding low- and high-frequency information
- Relating image structure to frequency content

## Frequency-Domain Representation

An image can be interpreted as a combination of different spatial frequency components.

Low-frequency components generally represent slowly changing image regions, such as:

- Smooth intensity variations
- Large structures
- Gradual illumination changes

High-frequency components generally represent rapid intensity changes, such as:

- Edges
- Fine details
- Texture
- Sharp transitions

A frequency-domain representation therefore provides a different way of analyzing image information compared with direct pixel-based analysis.

## Basis Functions

Basis functions provide a set of fundamental components that can be combined to represent a signal or image.

For image processing, two-dimensional basis functions can be used to describe spatial variations at different frequencies.

The general idea can be represented as:

    Image
      ↓
    Decompose into basis functions
      ↓
    Frequency components
      ↓
    Combine components
      ↓
    Reconstructed image

Each basis function represents a particular spatial frequency pattern.

## Frequency Components

Different basis functions correspond to different spatial frequencies.

Low-frequency basis functions vary slowly across the image.

High-frequency basis functions vary more rapidly.

Conceptually:

    Low Frequency
    ─────────────
    Smooth variation
    Large-scale structures

    High Frequency
    ──────────────
    Rapid variation
    Edges and fine details

The implementation allows these frequency patterns to be visualized and compared.

## Spatial Frequency

Spatial frequency describes how quickly intensity changes across an image.

A low spatial frequency corresponds to gradual changes:

    Dark ────────→ Gray ────────→ Bright

A high spatial frequency corresponds to rapid changes:

    Dark → Bright → Dark → Bright → Dark

This concept is important for understanding Fourier-based image processing.

## Basis Function Visualization

The generated basis functions can be displayed as images.

Visualizing the basis functions makes it possible to observe how their frequency changes as their parameters change.

Typical observations include:

- Increasing frequency produces more rapid intensity variations.
- Lower frequencies produce broader structures.
- Higher frequencies produce finer patterns.
- Different orientations produce different spatial patterns.

## Image Reconstruction

An image can be reconstructed by combining multiple basis functions with appropriate coefficients.

The general representation can be written as:

$begin:math:display$
I\(x\,y\)\=\\sum\_\{u\}\\sum\_\{v\} C\(u\,v\)B\_\{u\,v\}\(x\,y\)
$end:math:display$

where:

- $begin:math:text$I\(x\,y\)$end:math:text$ is the reconstructed image
- $begin:math:text$B\_\{u\,v\}\(x\,y\)$end:math:text$ is a frequency basis function
- $begin:math:text$C\(u\,v\)$end:math:text$ is the coefficient associated with that basis function
- $begin:math:text$u\,v$end:math:text$ determine the frequency components

The coefficients determine how strongly each basis function contributes to the final image.

## Low- and High-Frequency Information

Frequency components can be interpreted according to the amount of spatial variation they contain.

### Low-Frequency Information

Low-frequency components primarily describe:

- Overall image structure
- Smooth regions
- Large-scale intensity changes

### High-Frequency Information

High-frequency components primarily describe:

- Edges
- Fine details
- Texture
- Rapid intensity transitions

This distinction is fundamental to many image-processing techniques.

## Frequency Analysis Pipeline

The overall concept can be summarized as:

    Image / Signal
          ↓
    Frequency Basis Functions
          ↓
    Frequency Components
          ↓
    Analyze Individual Frequencies
          ↓
    Combine Components
          ↓
    Reconstruct / Interpret Image

## Applications

Frequency-domain representations are widely used in computer vision and image processing.

Applications include:

- Image compression
- Image filtering
- Noise reduction
- Edge analysis
- Texture analysis
- Image reconstruction
- Signal processing
- Feature extraction
- Frequency-domain enhancement

## Input

The implementation generates and analyzes frequency basis functions directly in MATLAB.

Depending on the experiment, image or signal data can be represented using the generated frequency components.

## Output

The implementation produces visual representations of frequency basis functions and their spatial patterns.

The results demonstrate how different frequencies contribute to the representation of image information.

## Requirements

- MATLAB
- Basic MATLAB matrix and visualization functionality

## How to Run

1. Open MATLAB.
2. Navigate to the `frequency-basis-functions` directory.
3. Open:

    frequency_basis_functions.m

4. Run the script.
5. Inspect the generated figures and frequency patterns.

## Key Concepts

- Frequency-domain image processing
- Spatial frequency
- Basis functions
- Frequency components
- Low-frequency information
- High-frequency information
- Image representation
- Image reconstruction
- Fourier analysis
- Signal processing
- Computer vision
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
