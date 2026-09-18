# Image Fundamentals

## Overview

This project demonstrates fundamental image-processing concepts using MATLAB.

The implementation works with digital images at the pixel level and explores basic operations such as image loading, region-of-interest extraction, grayscale pixel analysis, intensity distributions, synthetic image generation, binary image creation, and geometric image annotation.

## Objective

The main objective is to understand how digital images are represented and manipulated using MATLAB.

The implementation focuses on:

- Loading and displaying images
- Extracting regions of interest (ROI)
- Analyzing pixel intensities
- Identifying grayscale pixels
- Generating synthetic image data
- Visualizing intensity distributions
- Creating binary image patterns
- Drawing geometric objects on images

## Image Representation

A digital image can be represented as a matrix of pixel values.

For a grayscale image, each pixel contains a single intensity value.

For an RGB image, each pixel contains three values corresponding to:

- Red
- Green
- Blue

MATLAB represents an RGB image as a three-dimensional matrix:

    Height × Width × 3

The three layers correspond to the red, green, and blue channels.

## Implementation

The implementation contains several experiments that demonstrate fundamental image-processing operations.

The overall workflow can be summarized as:

    Input Image
         ↓
    Load and Display
         ↓
    Extract Region of Interest
         ↓
    Analyze Pixel Values
         ↓
    Generate Synthetic Images
         ↓
    Create Binary Patterns
         ↓
    Annotate Image with Geometric Shapes

## Image Loading and Visualization

The implementation first loads an RGB image using MATLAB's `imread` function.

The image is then displayed using MATLAB's image visualization functions.

This demonstrates the basic workflow for importing image data into MATLAB and displaying its pixel structure.

## Region of Interest Extraction

A rectangular region of interest (ROI) is extracted from the input image.

The ROI is selected using MATLAB matrix indexing:

    imgROI = img(row_start:row_end, col_start:col_end, :);

This allows a smaller portion of an image to be isolated for further analysis.

ROI extraction is commonly used in computer vision when only a specific part of an image is relevant to the processing task.

## Grayscale Pixel Detection

The implementation analyzes the RGB channels to identify pixels whose three color components are equal.

For an RGB pixel:

$begin:math:display$
R \= G \= B
$end:math:display$

the pixel represents a grayscale intensity.

A logical mask is created to identify these pixels.

The mask can then be applied to the original image to isolate the grayscale regions.

The processing can be summarized as:

    RGB Image
        ↓
    Compare R, G and B Channels
        ↓
    Create Logical Mask
        ↓
    Identify Grayscale Pixels

## Synthetic Image Generation

The project also demonstrates how image matrices can be generated directly in MATLAB without using an external image.

### Uniform Random Intensities

A synthetic image is generated using random intensity values within a specified range.

This demonstrates how pixel intensity values can be initialized programmatically.

### Gaussian-Distributed Intensities

Another synthetic image is generated using normally distributed random values.

The image is defined using a mean and standard deviation:

$begin:math:display$
I \= \\mu \+ \\sigma N\(0\,1\)
$end:math:display$

where:

- $begin:math:text$\\mu$end:math:text$ is the desired mean intensity
- $begin:math:text$\\sigma$end:math:text$ is the standard deviation
- $begin:math:text$N\(0\,1\)$end:math:text$ is a standard normal random variable

A histogram is used to visualize the resulting intensity distribution.

## Binary Image Generation

The implementation also creates a synthetic binary-style image using matrix indexing.

Different regions of the image are assigned specific intensity values to create a structured pattern.

This demonstrates how simple image patterns can be generated directly by manipulating pixel matrices.

## Geometric Image Annotation

The implementation uses MATLAB's `insertShape` functionality to overlay geometric objects onto an image.

The example includes:

- A line
- A circle
- A rectangle

These shapes can be used to highlight regions, boundaries, or other areas of interest within an image.

The general processing flow is:

    Original Image
          ↓
    Define Geometric Coordinates
          ↓
    Insert Line
          ↓
    Insert Circle
          ↓
    Insert Rectangle
          ↓
    Display Annotated Image

## Input

The main image-processing example uses:

    TestbildFernseher.jpg

Additional synthetic images are generated directly within the MATLAB script.

## Output

The implementation produces visualizations of:

- The original image
- An extracted region of interest
- Pixels identified as grayscale
- Randomly generated intensity images
- Intensity histograms
- A synthetic binary image
- An image annotated with geometric shapes

## Requirements

- MATLAB
- Image Processing Toolbox for functions such as `insertShape`

## How to Run

1. Open MATLAB.
2. Navigate to the `image-fundamentals` directory.
3. Make sure the required input image is available in the expected location.
4. Open:

    image_fundamentals.m

5. Run the script.
6. The generated figures and image-processing results will be displayed in MATLAB.

## Key Concepts

- Digital image representation
- RGB images
- Pixel intensities
- Image matrices
- Region of interest (ROI)
- Logical masks
- Grayscale pixels
- Random image generation
- Gaussian intensity distributions
- Histograms
- Binary images
- Matrix indexing
- Image annotation
- Geometric primitives
