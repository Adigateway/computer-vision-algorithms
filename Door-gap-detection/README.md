# Door Gap Detection

## Overview

This project implements a classical computer vision pipeline for detecting the rectangular gap between a door and its surrounding frame using MATLAB.

The approach processes an input image through grayscale conversion, intensity enhancement, filtering, gradient-based edge detection, morphological processing, Hough transform-based line detection, and geometric line intersection.

The final detected lines are used to estimate the four corner points of the rectangular door gap.

## Objective

The main objective is to detect the boundaries of a rectangular door gap from an image using classical image-processing and geometric techniques.

The implementation focuses on:

- Grayscale image processing
- Intensity adjustment
- Image filtering
- Sobel gradient calculation
- Edge detection
- Binary segmentation
- Morphological operations
- Hough transform
- Line representation in Hesse normal form
- Line intersection
- Geometric corner estimation

## Processing Pipeline

The complete detection pipeline can be summarized as:

    Input RGB Image
          ↓
    Grayscale Conversion
          ↓
    Intensity Adjustment
          ↓
    Low-Pass Filtering
          ↓
    Sobel Gradient Calculation
          ↓
    Gradient Segmentation
          ↓
    Morphological Processing
          ↓
    Symmetric Edge Detection
          ↓
    Hough Transform
          ↓
    Line Detection
          ↓
    Hesse Normal Form
          ↓
    Line Intersections
          ↓
    Four Corner Points
          ↓
    Door Gap Geometry

## Image Preprocessing

### Grayscale Conversion

The input RGB image is first converted into a grayscale representation.

This reduces the image from three color channels to a single intensity channel while retaining the intensity information required for subsequent edge detection.

The grayscale image can then be processed using matrix-based image-processing operations.

## Intensity Adjustment

Intensity adjustment is applied to improve the visibility of relevant structures in the image.

This helps increase the distinction between regions containing the door gap and surrounding areas before calculating image gradients.

## Low-Pass Filtering

A binomial low-pass filter is applied before gradient calculation.

Low-pass filtering reduces high-frequency noise and small image variations.

This helps produce more stable gradients during subsequent edge detection.

The filtering stage can be represented as:

$begin:math:display$
I\_\{filtered\} \= I \* h
$end:math:display$

where:

- $begin:math:text$I$end:math:text$ is the input image
- $begin:math:text$h$end:math:text$ is the low-pass filter
- $begin:math:text$\*$end:math:text$ represents convolution

## Sobel Gradient Detection

The implementation calculates horizontal and vertical image gradients using custom Sobel operators.

The horizontal gradient kernel is:

$begin:math:display$
G\_x \=
\\frac\{1\}\{32\}
\\begin\{bmatrix\}
\-3 \& 0 \& 3\\\\
\-10 \& 0 \& 10\\\\
\-3 \& 0 \& 3
\\end\{bmatrix\}
$end:math:display$

The vertical gradient kernel is:

$begin:math:display$
G\_y \=
\\frac\{1\}\{32\}
\\begin\{bmatrix\}
\-3 \& \-10 \& \-3\\\\
0 \& 0 \& 0\\\\
3 \& 10 \& 3
\\end\{bmatrix\}
$end:math:display$

These gradients describe intensity changes in the horizontal and vertical directions.

## Gradient Segmentation

The calculated gradients are used to identify image regions containing strong directional intensity changes.

Positive and negative gradient responses are considered separately to identify the relevant boundaries of the door gap.

This provides binary regions that can subsequently be refined using morphological operations.

## Morphological Processing

Morphological operations are applied to clean and strengthen the detected edge regions.

The processing includes operations such as:

- Opening
- Dilation

These operations help remove small unwanted regions and strengthen relevant structures.

The goal is to obtain cleaner edge information before applying geometric detection methods.

## Symmetric Edge Detection

The processed gradient information is used to identify symmetric edge structures corresponding to the boundaries of the rectangular door gap.

The detected edges provide the input for the subsequent Hough transform.

## Hough Transform

The Hough transform is used to detect prominent lines within the processed edge image.

Instead of directly searching for lines in image coordinates, the Hough transform represents potential lines in a parameter space.

A line can be represented using:

$begin:math:display$
\\rho \= x\\cos\(\\theta\)\+y\\sin\(\\theta\)
$end:math:display$

where:

- $begin:math:text$\\rho$end:math:text$ is the perpendicular distance from the origin
- $begin:math:text$\\theta$end:math:text$ is the angle of the line normal

Strong peaks in Hough space correspond to prominent image lines.

## Hesse Normal Form

The detected lines are represented using the Hesse normal form:

$begin:math:display$
x\\cos\(\\theta\)\+y\\sin\(\\theta\)\=\\rho
$end:math:display$

This representation is useful because it provides a convenient mathematical representation for calculating intersections between detected lines.

The detected lines can therefore be treated as geometric constraints describing the boundaries of the door gap.

## Line Intersection

The boundaries of the rectangular door gap are represented by multiple detected lines.

Intersections between pairs of lines are calculated to determine the corresponding corner points.

Conceptually:

    ┌────────────────────┐
    │                    │
    │     Door Gap       │
    │                    │
    └────────────────────┘

The four intersections define the estimated corners of the rectangular region.

## Corner Detection

The final geometric stage identifies four corner points from the detected line intersections.

These points provide a compact representation of the detected door-gap geometry.

The detected corners can subsequently be used for:

- Visualization
- Geometric measurements
- Rectangular region estimation
- Further computer-vision processing

## Why Classical Computer Vision?

The project uses a traditional image-processing pipeline rather than a learned deep-learning model.

The detection is based on:

- Image gradients
- Filtering
- Morphological operations
- Hough-based line detection
- Analytical geometry

This makes the individual processing stages interpretable and allows the relationship between image features and the final geometric result to be examined directly.

## Input

The implementation uses images of the door and its surrounding structure.

Example input images include:

- `R2441_door.jpg`
- `R2442_door.jpg`

Place the images in the project's `images` directory if the MATLAB script references them from there.

## Output

The processing produces intermediate and final visualizations including:

- Grayscale images
- Filtered images
- Gradient responses
- Binary edge regions
- Morphologically processed images
- Hough transform results
- Detected lines
- Line intersections
- Estimated door-gap corners

The final result represents the detected rectangular geometry of the door gap.

## Applications

The techniques demonstrated in this project are relevant to:

- Industrial inspection
- Structural measurement
- Quality control
- Geometric object detection
- Robot vision
- Automated inspection systems
- Classical computer vision

A similar pipeline can be adapted to detect other objects with strong straight-line geometric structures.

## Limitations

The approach depends on the quality of the detected image edges and lines.

Performance can be affected by:

- Image noise
- Illumination changes
- Occlusions
- Weak edges
- Background structures
- Incorrect Hough detections
- Perspective distortion

The parameters used for filtering, segmentation, morphology, and line detection may therefore need to be adapted for different image conditions.

## Requirements

- MATLAB
- Image Processing Toolbox
- Input images used by the script

## How to Run

1. Open MATLAB.
2. Navigate to the `door-gap-detection` directory.
3. Make sure the required images are available in the expected location.
4. Open:

    door_gap_detection.m

5. Run the script.
6. Inspect the intermediate processing stages and final detected geometry.

## Key Concepts

- Classical computer vision
- Image preprocessing
- Grayscale conversion
- Low-pass filtering
- Sobel operators
- Image gradients
- Binary segmentation
- Morphological image processing
- Edge detection
- Hough transform
- Hesse normal form
- Line intersection
- Geometric feature detection
- Corner estimation
- Industrial computer vision
