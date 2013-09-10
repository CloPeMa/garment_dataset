title:      CloPeMa Garment Dataset
author:     Daniela Krejčová
            Libor Wagner
            Vladimír Smutný
created:    July 10, 2013

# CloPeMa Garment Dataset

The CloPeMa Garment Dataset cantains RGB and Depth images of various garments in
different configurations.

## Data

## Anotation

### Field description

- 1: **path_c** Path to the RGB image
- 2: **path_d** Path to the depth image
- 3: **name**   Name of the garment
- 4: **type**   Type of the garment
- 5: **shape**  Shape of the garment
- 6: **in**     Denothes whether the garment is all in the frame or par of it is
                outside the frame.
- 7: **n**      Number of point in the countour polygon
- 8-(8+2*n):    The rest of the fields are points of the countour polygon for
                RGB and depth image respectively

## Tools

The dataset is accompanied with set of tools that may support the use of this
dataset and tools that were used to create this dataset.

### Annotation GUI (Matlab)

## Citation Request
