# Motion Detection

## Overview

This project demonstrates a basic real-time motion-detection system using MATLAB and a webcam.

The implementation detects changes between consecutive video frames by maintaining an adaptive background model and comparing the current frame against the estimated background.

The resulting difference image is thresholded to produce a binary motion mask.

## Objective

The main objective is to implement a simple image-based motion-detection pipeline using temporal information from a video stream.

The implementation focuses on:

- Capturing frames from a webcam
- Converting video frames to grayscale
- Maintaining an adaptive background model
- Calculating frame-to-background differences
- Applying a threshold to detect motion
- Generating a binary motion mask
- Visualizing detected motion in real time

## Detection Pipeline

The overall processing pipeline is:

    Webcam
       ↓
    Capture Video Frame
       ↓
    Convert to Grayscale
       ↓
    Update Background Model
       ↓
    Calculate Absolute Difference
       ↓
    Apply Threshold
       ↓
    Binary Motion Mask
       ↓
    Visualize Detected Motion

## Background Modeling

Instead of comparing every frame directly with a single fixed reference frame, the implementation maintains an adaptive estimate of the background.

The background model is updated using previous grayscale frames.

The update is based on a weighted combination:

$begin:math:display$
H\_t \= \\alpha F\_\{t\-1\} \+ \(1\-\\alpha\)F\_\{t\-2\}
$end:math:display$

where:

- $begin:math:text$H\_t$end:math:text$ is the estimated background
- $begin:math:text$F\_\{t\-1\}$end:math:text$ is the previous frame
- $begin:math:text$F\_\{t\-2\}$end:math:text$ is the frame before it
- $begin:math:text$\\alpha$end:math:text$ controls the contribution of each previous frame

The implementation uses:

    alpha = 0.5;

This allows the background estimate to adapt as the scene changes.

## Frame Difference

The current grayscale frame is compared with the estimated background.

The absolute difference is calculated as:

$begin:math:display$
A\_t \= \|I\_t \- H\_t\|
$end:math:display$

where:

- $begin:math:text$I\_t$end:math:text$ is the current grayscale frame
- $begin:math:text$H\_t$end:math:text$ is the estimated background
- $begin:math:text$A\_t$end:math:text$ represents the amount of change at each pixel

Pixels with larger differences indicate potential movement.

## Motion Thresholding

A threshold is applied to the difference image to distinguish significant changes from small intensity variations.

The binary motion mask is defined as:

$begin:math:display$
S\_t \=
\\begin\{cases\}
1 \& A\_t \> \\tau\\\\
0 \& A\_t \\leq \\tau
\\end\{cases\}
$end:math:display$

where $begin:math:text$\\tau$end:math:text$ is the motion-detection threshold.

The implementation uses:

    tau = 30;

Pixels above the threshold are classified as motion.

## Binary Motion Mask

The thresholding operation produces a binary image.

    0 → No detected motion
    1 → Detected motion

The binary mask provides a simple representation of which areas of the scene have changed.

The mask can be visualized to observe the regions where motion is detected.

## Real-Time Processing

The webcam is accessed using MATLAB's `webcam` functionality.

Frames are continuously captured inside a processing loop.

The general workflow is:

    Start Webcam
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
    Display Motion Mask
         ↓
    Update Previous Frames
         ↓
    Repeat

The previous frames are updated after each iteration so that the background model continuously adapts to the scene.

## Implementation Parameters

The motion detector uses two main parameters.

### Background Adaptation

    alpha = 0.5;

This controls how the background estimate is calculated from previous frames.

A different value changes the contribution of the previous frames to the background model.

### Detection Threshold

    tau = 30;

This determines how large the pixel difference must be before it is classified as motion.

Changing the threshold affects the sensitivity of the detector.

A lower threshold can detect smaller changes but may also respond to minor image variations.

A higher threshold requires larger changes before motion is detected.

## Input

The system uses a live webcam stream as its input.

Each captured frame is processed individually.

No pre-recorded video or external dataset is required.

## Output

The implementation produces:

- Live grayscale video frames
- An adaptive background estimate
- Frame-difference information
- A binary motion mask

The binary mask highlights regions where significant changes are detected.

## Limitations

This implementation is intentionally simple and demonstrates the fundamental concept of background-based motion detection.

Potential sources of false detections include:

- Changes in lighting
- Camera movement
- Shadows
- Small image fluctuations
- Background objects that change over time

More advanced systems can address these issues using techniques such as:

- Morphological filtering
- Connected-component analysis
- Improved background-subtraction algorithms
- Object tracking
- Object detection
- Deep-learning-based vision models

## Applications

Basic motion detection can be used as a building block for applications such as:

- Surveillance systems
- Activity monitoring
- Security cameras
- Traffic monitoring
- Human movement detection
- Camera-triggered systems
- Real-time computer vision

## Requirements

- MATLAB
- Image Processing Toolbox
- MATLAB webcam support
- A compatible webcam

## How to Run

1. Connect a compatible webcam to the computer.
2. Open MATLAB.
3. Navigate to the `motion-detection` directory.
4. Open:

    motion_detection.m

5. Run the script.
6. Allow MATLAB to access the webcam if requested.
7. The motion-detection process will start.

The system will continuously capture and process frames.

To stop the processing, interrupt the MATLAB script.

## Key Concepts

- Computer vision
- Video processing
- Real-time image processing
- Frame differencing
- Background modeling
- Adaptive background estimation
- Image thresholding
- Binary image masks
- Grayscale image processing
- Temporal image analysis
- Webcam-based motion detection
