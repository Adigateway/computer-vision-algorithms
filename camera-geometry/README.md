# Camera Geometry

## Overview

This project explores fundamental concepts in camera geometry and projective imaging using MATLAB.

The implementation covers camera projection, intrinsic and extrinsic parameters, matrix decomposition, homogeneous coordinates, normalized image coordinates, Direct Linear Transform (DLT), homography estimation, and camera center computation.

The project combines theoretical concepts from computer vision with their numerical implementation using matrix operations and decompositions.

## Objective

The main objective is to understand how a camera represents a 3D scene in a 2D image and how camera parameters can be recovered from projection information.

The implementation focuses on:

- Camera projection matrices
- Intrinsic camera parameters
- Extrinsic camera parameters
- QR decomposition
- SVD-based calculations
- Homogeneous coordinates
- Camera center estimation
- Normalized image coordinates
- Direct Linear Transform (DLT)
- Homography estimation
- Rotation and translation recovery

## Camera Projection

A perspective camera can be represented using a projection matrix:

$begin:math:display$
x \= PX
$end:math:display$

where:

- $begin:math:text$X$end:math:text$ is a 3D point in homogeneous coordinates
- $begin:math:text$x$end:math:text$ is its corresponding image point
- $begin:math:text$P$end:math:text$ is the $begin:math:text$3 \\times 4$end:math:text$ camera projection matrix

The projection matrix can be decomposed as:

$begin:math:display$
P \= K\[R\|t\]
$end:math:display$

where:

- $begin:math:text$K$end:math:text$ is the intrinsic camera matrix
- $begin:math:text$R$end:math:text$ is the camera rotation matrix
- $begin:math:text$t$end:math:text$ is the translation vector

This decomposition separates the internal camera properties from the camera's position and orientation.

## Intrinsic Camera Matrix

The intrinsic matrix describes the internal parameters of the camera.

A typical form is:

$begin:math:display$
K \=
\\begin\{bmatrix\}
f\_x \& s \& c\_x \\\\
0 \& f\_y \& c\_y \\\\
0 \& 0 \& 1
\\end\{bmatrix\}
$end:math:display$

where:

- $begin:math:text$f\_x$end:math:text$ and $begin:math:text$f\_y$end:math:text$ are focal-length parameters
- $begin:math:text$s$end:math:text$ represents skew
- $begin:math:text$c\_x\,c\_y$end:math:text$ represent the principal point

The implementation works with camera matrices and their inverses to transform image coordinates into normalized coordinates.

## Matrix Decomposition

The implementation uses QR decomposition to separate components of a camera-related matrix.

The QR decomposition is written as:

$begin:math:display$
M \= QR
$end:math:display$

where:

- $begin:math:text$Q$end:math:text$ is an orthogonal matrix
- $begin:math:text$R$end:math:text$ is an upper-triangular matrix

The resulting matrices are further transformed to obtain camera-related rotation and intrinsic parameters.

Sign normalization is also applied to maintain consistent parameter conventions.

## Singular Value Decomposition

Singular Value Decomposition (SVD) is used at several stages of the implementation.

For a matrix $begin:math:text$M$end:math:text$:

$begin:math:display$
M \= USV\^T
$end:math:display$

where:

- $begin:math:text$U$end:math:text$ contains left singular vectors
- $begin:math:text$S$end:math:text$ contains singular values
- $begin:math:text$V$end:math:text$ contains right singular vectors

SVD is particularly useful for solving homogeneous linear systems and estimating geometric quantities from image measurements.

## Camera Center

The camera center represents the position of the camera in world coordinates.

It can be obtained from the null space of the projection matrix:

$begin:math:display$
PC \= 0
$end:math:display$

The implementation obtains the camera center using the final right singular vector from the SVD of the projection matrix.

The homogeneous camera center is then normalized by its final coordinate.

## Normalized Image Coordinates

Image coordinates can be normalized using the inverse intrinsic matrix:

$begin:math:display$
x\_\{norm\} \= K\^\{\-1\}x
$end:math:display$

This removes the influence of the camera's intrinsic parameters and provides coordinates in the normalized camera coordinate system.

The implementation uses:

- A predefined intrinsic matrix
- Image points in homogeneous coordinates
- The inverse intrinsic matrix
- Matrix multiplication to obtain normalized coordinates

## Direct Linear Transform

The Direct Linear Transform (DLT) is used to estimate a projective transformation from corresponding points.

The implementation constructs a measurement matrix from:

- 3D/world coordinates
- Normalized image coordinates
- Homogeneous coordinates
- Skew-symmetric matrices

For each point correspondence, constraints are added to the measurement matrix.

The resulting system can be written as:

$begin:math:display$
Ah \= 0
$end:math:display$

where:

- $begin:math:text$A$end:math:text$ is the measurement matrix
- $begin:math:text$h$end:math:text$ contains the unknown transformation parameters

## Homography Estimation

The homography is estimated by solving the DLT system using SVD.

After computing:

$begin:math:display$
A \= USV\^T
$end:math:display$

the solution is obtained from the right singular vector associated with the smallest singular value.

The resulting vector is reshaped into a $begin:math:text$3 \\times 3$end:math:text$ homography matrix:

$begin:math:display$
H \=
\\begin\{bmatrix\}
h\_1 \& h\_2 \& h\_3
\\end\{bmatrix\}
$end:math:display$

The matrix is then normalized before extracting rotation and translation information.

## Homography Decomposition

The homography provides information about the camera transformation relative to a planar scene.

The implementation extracts:

- The first two columns of the homography
- The translation component
- A third rotation direction using the cross product

The rotation matrix is then refined using SVD to ensure that it satisfies the properties of a valid rotation matrix.

The resulting rotation matrix satisfies approximately:

$begin:math:display$
R\^TR \= I
$end:math:display$

and has the appropriate orthogonal structure for a rotation matrix.

## Overall Pipeline

The camera-geometry workflow can be summarized as:

    Camera / Projection Matrix
              ↓
    Matrix Decomposition
              ↓
    Intrinsic + Rotation Parameters
              ↓
    SVD Analysis
              ↓
    Camera Center
              ↓
    Image Coordinate Normalization
              ↓
    DLT Measurement Matrix
              ↓
    SVD
              ↓
    Homography Estimation
              ↓
    Homography Decomposition
              ↓
    Rotation + Translation

## Mathematical Tools Used

The implementation makes extensive use of matrix-based computer vision techniques:

| Method | Purpose |
|---|---|
| QR decomposition | Camera matrix decomposition |
| SVD | Solving homogeneous systems and geometric estimation |
| Matrix inversion | Coordinate normalization |
| Homogeneous coordinates | Projective geometry |
| Cross product | Completing the rotation matrix |
| DLT | Projective transformation estimation |
| Homography | Planar projective mapping |

## Input

The implementation uses predefined camera matrices and corresponding 3D and image points.

The main inputs include:

- Camera projection matrix
- Intrinsic camera matrix
- 3D world coordinates
- Image coordinates

## Output

The implementation calculates and displays quantities including:

- Camera-related matrix components
- Intrinsic parameters
- Rotation matrices
- Translation vectors
- Camera center
- Normalized image coordinates
- DLT measurement matrix dimensions
- Estimated homography

## Requirements

- MATLAB
- Basic matrix operations
- MATLAB Linear Algebra functionality
- Custom helper functions used by the script, such as `myInvK` and `mySkewMat`

## How to Run

1. Open MATLAB.
2. Navigate to the `camera-geometry` directory.
3. Open:

    camera_geometry.m

4. Make sure the required helper functions are available in the MATLAB path.
5. Run the script.
6. Inspect the calculated camera parameters, normalized coordinates, homography, rotation matrix, and translation vector in the MATLAB command window.

## Key Concepts

- Projective geometry
- Perspective camera model
- Camera projection
- Intrinsic parameters
- Extrinsic parameters
- Homogeneous coordinates
- Normalized image coordinates
- QR decomposition
- Singular Value Decomposition
- Camera center
- Direct Linear Transform
- Homography
- Rotation matrix
- Translation vector
- 3D-to-2D projection
