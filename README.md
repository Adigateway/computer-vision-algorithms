# Door Gap Detection using MATLAB

A classical computer vision project for detecting the boundaries and corner points of a rectangular door gap from an RGB image.

The project implements a complete image-processing pipeline in MATLAB without relying on deep-learning-based object detection.

## Overview

The goal of this project is to identify the four boundaries of a door gap and estimate their intersection points from an input image.

The detection pipeline combines image preprocessing, gradient-based edge detection, morphological operations, Hough transforms, and geometric line intersection.

## Computer Vision Pipeline

```text
RGB Image
    │
    ▼
Grayscale Conversion
    │
    ▼
Contrast Enhancement
    │
    ▼
Binomial Low-Pass Filtering
    │
    ▼
Sobel Gradient Extraction
    │
    ▼
Positive / Negative Edge Detection
    │
    ▼
Morphological Processing
    │
    ▼
Symmetric Edge Detection
    │
    ▼
Hough Transform
    │
    ▼
Door-Gap Boundary Detection
    │
    ▼
Hesse Normal Form
    │
    ▼
Line Intersections
    │
    ▼
Four Corner Points
```

## Methods

### Image Preprocessing
The input RGB image is converted to grayscale and its contrast is enhanced using MATLAB’s `imadjust` function. A binomial low-pass filter is then applied to reduce image noise before extracting image gradients.

### Sobel Gradient Detection
Custom Sobel filters are used to calculate horizontal and vertical image gradients. Positive and negative gradient responses are separated to identify potential boundaries of the door gap.

### Morphological Processing
Morphological opening and dilation are applied to reduce small noisy structures and strengthen the detected edge regions.

### Symmetric Edge Detection
The gradient information is combined to identify symmetric edge transitions that can correspond to the boundaries of the door gap.

### Hough Transform
The Hough transform is used to detect dominant horizontal and vertical lines from the processed edge information. The detected lines are represented using the Hesse normal form:

$$a \cdot x + b \cdot y + c = 0$$

### Corner Point Estimation
The intersections between the detected horizontal and vertical lines are calculated to estimate the four corners of the door gap. The final result is visualized directly on the original image.

## Example Result

The final visualization shows the detected door-gap boundaries together with the estimated corner points. The MATLAB script generates the detection overlay during execution.

![Door Gap Detection Result](images/detection_result.jpg)

## Technologies

* **MATLAB**
* **Image Processing Toolbox**
* Sobel filtering
* Morphological image processing
* Hough transform
* Hesse normal form
* Geometric line intersection

## Requirements

* MATLAB
* Image Processing Toolbox

## How to Run

1. Clone or download the repository.
2. Open MATLAB.
3. Set the repository directory as the MATLAB working directory.
4. Make sure the input images are located inside the `images` folder.
5. Run:
   ```matlab
   door_gap_detection
   ```

The script generates intermediate visualizations and a final image showing the detected door-gap boundaries and corner points.

## Project Structure

```text
matlab-door-gap-detection/
│
├── README.md
├── door_gap_detection.m
├── .gitignore
│
└── images/
    ├── R2441_door.jpg
    ├── R2442_door.jpg
    └── detection_result.jpg
```

## Key Concepts

This project demonstrates practical understanding of:

* Image preprocessing
* Grayscale image analysis
* Custom convolution filters
* Sobel edge detection
* Threshold-based segmentation
* Mathematical morphology
* Hough-space analysis
* Line detection
* Hesse normal representation
* Geometric line intersections
* Feature localization

## Future Improvements

* Automatic selection of the strongest door-gap lines
* Improved robustness to different lighting conditions
* Perspective correction
* Automatic rejection of false Hough-line detections
* Processing of video streams instead of individual images
* Real-time implementation for robotic or industrial vision applications

## Author

**Aditya Srivatsa Adiraju**  
*Robotics | Computer Vision | Machine Learning*
