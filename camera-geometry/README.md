# Camera Geometry

## Overview

This project demonstrates fundamental concepts in camera geometry and 3D-to-2D projective imaging using MATLAB.

The implementation covers camera calibration parameters, matrix decomposition, homogeneous coordinates, normalized image coordinates, the Direct Linear Transform (DLT), homography estimation, and camera pose recovery.

## Objective

The main objective is to understand how a camera represents 3D points in image coordinates and how the underlying camera parameters can be recovered from projection measurements.

The implementation focuses on:

- Camera projection matrices
- Intrinsic camera parameters
- QR decomposition
- SVD-based calculations
- Homogeneous coordinates
- Normalization of image coordinates
- Direct Linear Transform (DLT)
- Homography estimation
- Rotation and translation recovery
- Camera center estimation

## Camera Projection

A perspective camera can be represented using a projection matrix:

\[
x = PX
\]

where:

- \(X\) is a 3D point in homogeneous coordinates
- \(P\) is the \(3 \times 4\) camera projection matrix
- \(x\) is the corresponding image point in homogeneous coordinates

The projection matrix can be decomposed into intrinsic and extrinsic camera parameters.

A typical formulation is:

\[
P = K[R \mid t]
\]

where:

- \(K\) represents the camera's intrinsic parameters
- \(R\) represents the camera rotation
- \(t\) represents the camera translation

---

## Implementation

### 1. Camera Matrix Decomposition

The first part of the implementation works with a camera projection matrix and separates its components using matrix decompositions.

QR decomposition is used to obtain matrices that can be related to the intrinsic and rotational components of the camera.

The implementation also applies sign normalization to ensure a consistent representation of the intrinsic matrix and rotation matrix.

### 2. Camera Center Estimation

The camera center is calculated from the projection matrix using its null space.

SVD is used to determine the null-space vector:

\[
PX = 0
\]

The last right-singular vector of the projection matrix provides the homogeneous representation of the camera center.

The homogeneous coordinates are then normalized so that the final coordinate is equal to one.

### 3. Normalized Image Coordinates

The implementation also demonstrates how pixel coordinates can be converted into normalized camera coordinates.

Given the intrinsic matrix \(K\), image coordinates can be normalized using:

\[
x_{norm} = K^{-1}x
\]

This removes the effects of the camera's intrinsic parameters and provides coordinates in the normalized camera coordinate system.

### 4. Direct Linear Transform

The Direct Linear Transform (DLT) is used to estimate a projective transformation from corresponding 3D and image points.

The measurement matrix is constructed from the point correspondences and solved using Singular Value Decomposition.

The solution is obtained from the singular vector corresponding to the smallest singular value.

### 5. Homography Estimation

The DLT formulation is used to estimate a \(3 \times 3\) homography matrix:

\[
x' = Hx
\]

The estimated homography is normalized and decomposed to obtain information about the camera rotation and translation relative to the observed plane.

### 6. Rotation Matrix Recovery

The first two columns of the normalized homography provide information about the first two rotation axes.

The third axis is obtained using the cross product:

\[
r_3 = r_1 \times r_2
\]

SVD is then used to enforce orthogonality and obtain a valid rotation matrix.

---

## Processing Pipeline

```text
Camera Projection Matrix
          ↓
Matrix Decomposition
          ↓
Intrinsic / Rotation Components
          ↓
Camera Center Estimation
          ↓
Normalize Image Coordinates
          ↓
Construct DLT Measurement Matrix
          ↓
SVD
          ↓
Estimate Homography
          ↓
Recover Rotation and Translation
