function [stitchedPhase, stitchedYFP, stitchedYFPThresh] = PhaseOne(nCols, nRows, nTime, imSize, threshVal, startImageFolder, offsetCol, offsetRow)

% INPUT: XXX, # of columns in image grid, # of rows in image grid, # of
% time steps over experimental run, size of individual images in grid
% (measured in pixels), image folder location of microscope images.

% OUTPUT: Stitched moasaics of brightfield, YFP and thresholded YFP
% microscope images. These are stored as 3D arrays (X by Y by time).

% ----------------------------------------------------------------------

% profile on

% Run image stitiching script on raw images from microscope
[stitchedPhase, stitchedYFP] = stitchImagesPhaseOne(startImageFolder, nCols, nRows, nTime, imSize, offsetCol, offsetRow);

% Initialise array in prep for thresholding of stitched YFP image
stitchedYFPThresh = zeros(imSize*nRows,imSize*nCols, nTime,'uint16');

% Loop across complete set of YFP images, thresholding them using
% imbinarize function (manually set threshold value)
n = size(stitchedYFP, 3);

for i = 1:n
    stitchedYFPThresh(:,:,i) = uint16(imbinarize(stitchedYFP(:,:,i), threshVal));
end

% profile viewer

end
