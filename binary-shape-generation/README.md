Binary Shape Generation

Overview

This project demonstrates the generation and visualization of binary geometric shapes using MATLAB.

Binary images contain pixels with two possible intensity values, typically representing foreground and background regions. The implementation creates simple geometric shapes programmatically and explores how their binary structure can be represented as matrices.

Objective

The main objective is to generate basic geometric shapes as binary images and visualize their pixel structures.

The implementation focuses on:

* Creating binary images using MATLAB matrices
* Generating geometric shapes programmatically
* Controlling shape dimensions and position
* Visualizing binary images
* Understanding the relationship between mathematical shapes and pixel-based representations

Approach

The shapes are generated directly from pixel coordinates rather than being loaded from an existing image.

The general process is:

Define image dimensions
        ↓
Create binary image matrix
        ↓
Generate geometric shape
        ↓
Assign foreground pixels
        ↓
Display binary image

Geometric conditions are used to determine which pixels belong to the shape.

For example, a circular region can be defined using the distance of each pixel from a specified center:

[
(x-x_c)^2 + (y-y_c)^2 \leq r^2
]

where:

* (x_c, y_c) are the coordinates of the circle center
* (r) is the radius
* Pixels satisfying the condition belong to the foreground region

Implementation

The MATLAB script generates binary geometric shapes and displays the resulting images.

The generated shapes can be represented using binary matrices where:

* 0 represents the background
* 1 represents the foreground shape

The implementation also demonstrates how changing geometric parameters affects the resulting binary image.

Input

No external image or dataset is required.

The shapes are generated entirely within MATLAB using predefined dimensions and geometric parameters.

Output

The script produces MATLAB figures showing the generated binary shapes.

The resulting images can be used as simple test patterns for further image-processing operations such as:

* Morphological operations
* Connected-component analysis
* Shape detection
* Boundary extraction
* Object classification

Requirements

* MATLAB
* Image Processing Toolbox, if required by the functions used in the implementation

How to Run

1. Open MATLAB.
2. Navigate to the binary-shape-generation directory.
3. Open:

binary_shape_generation.m

4. Run the script.
5. The generated binary shapes will be displayed in MATLAB figures.

Key Concepts

* Binary image representation
* Pixel coordinates
* Geometric shape generation
* Matrix-based image creation
* MATLAB image visualization
* Digital representation of geometric objects
