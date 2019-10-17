function [finalData] = PhaseTwo(stitchedPhase, stitchedYFPThresh, sens, edge, dropRange)

% INPUT: 3-dimensional arrays of stitched brightfield images, and stitched
% YFP images (post thresholding).

% OUTPUT: (x y t ID r bact#) of all droplets tracked across all images,
% pulled from the large scale stitched images output from Phase One.

% ----------------------------------------------------------------------

% profile on

% Finds the droplets in each brightfield image, across all time steps,
% outputting the position of each droplet by it's centre alongside it's radius. 
[centres, radii, centresRadii] = batchfindcirclesPhaseTwo(stitchedPhase, sens, edge, dropRange);
%disp("Droplets detected successfully")


% Using the centre positions of the droplets output by the previous
% function, the track function links each droplet from one frame to the
% next as best as possible, manually set a maximum distance (in pixels)
% which droplets are expected to move between one frame and next. 
[tracking] = track(centres, 75);

%disp("Droplet positions tracked successfully")

[data] = mergeData(centresRadii, tracking);

%disp("Droplet positions and radii merged correctly with tracking data")

[finalData] = sumPixels_v2(data, stitchedYFPThresh);

%disp("Bacteria counted successfully")

% profile viewer

end
