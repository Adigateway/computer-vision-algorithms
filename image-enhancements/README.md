# Image Enhancement

## Overview

This project demonstrates a range of fundamental image enhancement and image-processing techniques using MATLAB.

The implementation explores how image intensity, contrast, statistical properties, correlations, and histograms can be analyzed and modified to improve or understand image information.

The project also includes a real-time motion-detection experiment using an adaptive background model.

## Objective

The main objective is to investigate different techniques for modifying and analyzing digital images.

The implementation covers:

- Image rotation and flipping
- Grayscale conversion
- Intensity transformations
- Brightness adjustment
- Image inversion
- Contrast stretching
- Gamma correction
- Mean and standard-deviation normalization
- Autocorrelation
- Cross-correlation
- Histogram analysis
- Histogram equalization
- Adaptive histogram equalization
- Real-time motion detection

## Image Processing Overview

The different techniques implemented in this project can be grouped into several categories:

    Input Image
         ↓
    Geometric Operations
         ↓
    Intensity Transformations
         ↓
    Contrast Enhancement
         ↓
    Statistical Analysis
         ↓
    Histogram Processing
         ↓
    Motion Detection

## Geometric Image Operations

The implementation demonstrates basic spatial transformations applied directly to image matrices.

These include:

- Image rotation
- Horizontal flipping
- Vertical flipping
- Grayscale conversion
- Row and column operations

These operations provide a foundation for understanding how image data can be manipulated at the pixel and matrix level.

## Image Rotation

The image is rotated using matrix operations.

Instead of relying only on a high-level image rotation function, the implementation demonstrates how image dimensions and pixel ordering can be manipulated directly.

This provides an understanding of how geometric transformations affect the underlying image matrix.

## Image Flipping

Horizontal and vertical image flips are performed by rearranging the rows or columns of the image matrix.

These operations demonstrate how spatial transformations can be implemented through matrix manipulation.

## Grayscale Conversion

Color images are converted into grayscale representations.

A grayscale image contains a single intensity value for each pixel rather than separate red, green, and blue channels.

This simplifies subsequent intensity-based image processing.

## Intensity Transformations

The implementation investigates several methods for modifying pixel intensities.

### Brightness Increase

Pixel intensities are increased by adding a constant value.

This shifts the intensity distribution toward brighter values.

### Brightness Reduction

Pixel intensities are decreased by subtracting a constant value.

This shifts the intensity distribution toward darker values.

### Image Inversion

Image intensities are inverted to create a negative representation.

For an 8-bit image, the transformation can be represented as:

$begin:math:display$
I\_\{new\} \= 255\-I
$end:math:display$

where $begin:math:text$I$end:math:text$ is the original pixel intensity.

## Contrast Enhancement

Contrast enhancement is used to increase the separation between different intensity levels in an image.

The implementation investigates both direct intensity scaling and a custom contrast-spreading operation.

### Contrast Stretching

Contrast stretching expands the range of intensity values.

A general linear transformation can be represented as:

$begin:math:display$
I\_\{new\}
\=
\\frac\{I\-I\_\{min\}\}
\{I\_\{max\}\-I\_\{min\}\}
$end:math:display$

This maps the original intensity range to a larger target range.

Contrast stretching is particularly useful when an image occupies only a limited portion of the available intensity range.

## Gamma Correction

Gamma correction applies a nonlinear transformation to image intensities.

The general form is:

$begin:math:display$
I\_\{out\}\=cI\_\{in\}\^\{\\gamma\}
$end:math:display$

where:

- $begin:math:text$I\_\{in\}$end:math:text$ is the input intensity
- $begin:math:text$I\_\{out\}$end:math:text$ is the output intensity
- $begin:math:text$c$end:math:text$ is a scaling factor
- $begin:math:text$\\gamma$end:math:text$ controls the nonlinear transformation

Different gamma values can emphasize different intensity regions.

The implementation also compares a custom gamma transformation with MATLAB's `imadjust` functionality.

## Statistical Normalization

Image statistics are used to analyze the distribution of pixel intensities.

The implementation considers properties such as:

- Minimum intensity
- Maximum intensity
- Mean intensity
- Standard deviation

Mean and standard-deviation normalization can be used to transform an image according to its statistical characteristics.

This demonstrates how statistical properties can be used as part of image enhancement.

## Correlation Analysis

The implementation explores correlation-based analysis of image data.

### Autocorrelation

Autocorrelation measures the similarity of a signal with a shifted version of itself.

It can be used to investigate repeating structures and spatial patterns.

### Cross-Correlation

Cross-correlation measures the similarity between two different signals or image regions.

It can be useful for identifying relationships between image data and measuring similarity at different relative positions.

## Histogram Analysis

An image histogram represents the distribution of pixel intensities.

The implementation investigates histograms using different numbers of bins:

- 16 bins
- 32 bins
- 64 bins

Changing the number of bins changes the resolution of the intensity distribution.

The histogram provides a useful representation for understanding the brightness and contrast characteristics of an image.

## Histogram Equalization

Histogram equalization is used to redistribute image intensity values.

MATLAB's `histeq` function is used to perform global histogram equalization.

Conceptually:

    Original Image
         ↓
    Calculate Histogram
         ↓
    Redistribute Intensities
         ↓
    Enhanced Image

The technique can improve global contrast when the original image has a limited or uneven intensity distribution.

## Adaptive Histogram Equalization

Adaptive histogram equalization is also investigated using MATLAB's `adapthisteq`.

Unlike global histogram equalization, adaptive histogram equalization operates on local regions of an image.

This allows contrast enhancement to be adapted to different areas of the image.

It can be particularly useful when an image contains regions with significantly different illumination or contrast.

## Histogram Processing Comparison

The implementation allows different approaches to histogram-based enhancement to be compared.

```text
Original Image
      │
      ├───────────────┐
      │               │
      ▼               ▼
  Histogram       Adaptive
  Equalization   Equalization
      │               │
      ▼               ▼
 Global Contrast   Local Contrast
  Enhancement      Enhancement
```

## Motion Detection

The project also includes a basic real-time motion-detection experiment using a webcam.

The motion detector uses an adaptive background model and frame differencing.

### Motion Detection Pipeline

    Webcam
       ↓
    Capture Frame
       ↓
    Convert to Grayscale
       ↓
    Estimate Background
       ↓
    Calculate Frame Difference
       ↓
    Apply Threshold
       ↓
    Binary Motion Mask

### Background Model

The background is estimated from previous grayscale frames.

The implementation uses a weighted combination of two previous frames:

$begin:math:display$
H\_t \= \\alpha F\_\{t\-1\} \+ \(1\-\\alpha\)F\_\{t\-2\}
$end:math:display$

where:

- $begin:math:text$H\_t$end:math:text$ is the estimated background
- $begin:math:text$F\_\{t\-1\}$end:math:text$ is the previous frame
- $begin:math:text$F\_\{t\-2\}$end:math:text$ is the frame before it
- $begin:math:text$\\alpha$end:math:text$ controls the contribution of each frame

The implementation uses:

    alpha = 0.5;

This allows the background estimate to adapt over time.

### Frame Difference

The current frame is compared with the estimated background:

$begin:math:display$
A\_t \= \|I\_t\-H\_t\|
$end:math:display$

where:

- $begin:math:text$I\_t$end:math:text$ is the current grayscale frame
- $begin:math:text$H\_t$end:math:text$ is the estimated background
- $begin:math:text$A\_t$end:math:text$ represents the difference between the current image and the estimated background

Large differences indicate potential motion.

### Motion Thresholding

A threshold is applied to the difference image:

$begin:math:display$
S\_t \=
\\begin\{cases\}
1 \& A\_t \> \\tau\\\\
0 \& A\_t \\leq \\tau
\\end\{cases\}
$end:math:display$

where $begin:math:text$\\tau$end:math:text$ represents the motion-detection threshold.

The implementation uses:

    tau = 30;

Pixels whose difference exceeds the threshold are classified as motion.

### Binary Motion Mask

The thresholding operation produces a binary mask:

    0 → No detected motion
    1 → Detected motion

This provides a simple representation of the areas of the scene that have changed.

## Input

The image-processing sections use example image files including:

    FilingCabinet.jpg
    Cosmea.jpg
    FlowerpotsDark.jpg
    FlowerPotsBright.jpg

The motion-detection section uses a live webcam as its input.

## Output

The implementation produces visual and numerical results demonstrating:

- Rotated images
- Flipped images
- Grayscale images
- Brightened images
- Darkened images
- Inverted images
- Contrast-enhanced images
- Gamma-corrected images
- Image statistics
- Autocorrelation results
- Cross-correlation results
- Histograms with different bin sizes
- Histogram-equalized images
- Adaptively equalized images
- Adaptive background estimation
- Binary motion masks

## Applications

The image-enhancement techniques demonstrated in this project are relevant to applications such as:

- Computer vision preprocessing
- Image enhancement
- Image analysis
- Feature extraction
- Image quality improvement
- Pattern analysis
- Object detection preprocessing

The motion-detection component provides a foundation for applications such as:

- Surveillance
- Activity monitoring
- Security systems
- Real-time scene analysis
- Camera-based monitoring

## Limitations

The techniques demonstrated in this project are fundamental image-processing methods and may require additional processing for complex real-world scenarios.

For example, basic motion detection can be affected by:

- Changes in illumination
- Shadows
- Camera movement
- Background changes
- Image noise

More advanced computer vision systems can address these challenges using additional filtering, background-subtraction methods, object tracking, or machine-learning-based approaches.

## Requirements

- MATLAB
- Image Processing Toolbox
- Webcam support for the motion-detection section
- A compatible webcam for real-time processing

## How to Run

1. Open MATLAB.
2. Navigate to the `image-enhancement` directory.
3. Make sure the required image files are available in the expected location.
4. Open:

    image_enhancement.m

5. Run the script.
6. The image-processing results will be displayed in MATLAB figures.

For the motion-detection section:

1. Connect a compatible webcam.
2. Allow MATLAB to access the webcam if requested.
3. Run the motion-detection portion of the implementation.
4. Observe the generated motion mask.

## Key Concepts

- Digital image processing
- Image matrix manipulation
- Geometric transformations
- Grayscale images
- Intensity transformations
- Brightness adjustment
- Image inversion
- Contrast stretching
- Gamma correction
- Image normalization
- Mean and standard deviation
- Autocorrelation
- Cross-correlation
- Image histograms
- Histogram equalization
- Adaptive histogram equalization
- Background modeling
- Frame differencing
- Image thresholding
- Binary motion detection
- Real-time computer vision
```
