% Example to show how to read and display annotation in matlab.

% Add yamlmatlab library to matlab PATH
addpath('./yaml');

% Read the annotation file
ann = read_annotation('../example/cloA00023.yaml');

% Read the image
im = imread(['../example/' ann.path_c]);

% Show annotation
show_annotation(im, ann);

%% Example of folded

% Read the annotation file
ann = read_annotation('../example/cloA02321.yaml');

% Read the image
im = imread(['../example/' ann.path_c]);

% Show annotation
show_annotation(im, ann);
