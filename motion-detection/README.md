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
- Visualizing the detected motion in real time

## Detection Pipeline

The overall processing pipeline is:

```text
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
