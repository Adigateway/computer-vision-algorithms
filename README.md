# MATLAB Computer Vision

A collection of MATLAB implementations covering fundamental concepts in **computer vision, image processing, camera geometry, frequency analysis, and image analysis**.

The repository focuses mainly on classical computer vision techniques and their mathematical foundations.

## Projects

| Project | Main Topics |
|---|---|
| [Door Gap Detection](./door-gap-detection/) | Edge detection, Sobel filters, morphology, Hough transform, line intersections |
| [Image Fundamentals](./image-fundamentals/) | RGB images, ROI, pixel operations, binary images, image annotation |
| [Camera Geometry](./camera-geometry/) | Camera matrices, QR, SVD, DLT, homography, rotation & translation |
| [Image Enhancement](./image-enhancement/) | Intensity, contrast, gamma correction, histograms, equalization |
| [Motion Detection](./motion-detection/) | Webcam, background estimation, frame differencing, thresholding |
| [Frequency Basis Functions](./frequency-basis-functions/) | Fourier basis functions, spatial frequency |
| [Frequency & SVD Image Analysis](./frequency-and-svd-image-analysis/) | 2-D FFT, frequency filtering, SVD, low-rank reconstruction |
| [Binary Shape Generation](./binary-shape-generation/) | Binary images, geometric shapes, pixel-based shape generation |

## Repository Structure

```text
matlab-computer-vision/
│
├── README.md
├── .gitignore
│
├── door-gap-detection/
├── image-fundamentals/
├── camera-geometry/
├── image-enhancement/
├── motion-detection/
├── frequency-basis-functions/
├── frequency-and-svd-image-analysis/
└── binary-shape-generation/
```

Each project contains its MATLAB implementation and a dedicated README explaining the techniques used.

## Main Concepts

This repository demonstrates practical understanding of:

* **Image Processing** — Filtering, intensity transformation, contrast enhancement, histograms
* **Feature Detection** — Gradients, edges, morphology, Hough transforms
* **Computer Vision Geometry** — Camera projection, homogeneous coordinates, DLT, homography
* **Frequency Analysis** — Fourier basis functions, FFT, frequency-domain filtering
* **Linear Algebra** — QR decomposition, SVD, matrix-based image representation
* **Video Processing** — Webcam acquisition and motion detection
* **Binary Vision** — Masks and geometric shape generation

## Technologies

* **MATLAB**
* **Image Processing Toolbox**
* MATLAB Webcam Support Package (where required)

## Purpose

The goal of this repository is to demonstrate the implementation and understanding of core computer vision algorithms using MATLAB, from basic image manipulation to geometric vision and frequency-domain analysis. Each project can be explored independently through its corresponding directory.
