function[output] = mergeData(batchData, trackData)

% Input:
% batchData - (centresRadii output from previous batchFindCircles function)
% trackData - (tracking output from previous track function )

% Purpose:
% This function takes the output data from the "find circles" function 
% (x y r t) and the output data from the "track" function (x y t ID), and 
% uses this to match the data such that you get an output array of 
% (x y t ID r)

% Output:
% data - array containing matched data in format (x y t ID r)

%Set size of loop to size of tracking data
n=size(trackData,1);

%set output of function to tracking data array
output=trackData;

% Iterate through each line of the tracking data array
for i=1:n
    
    % Set temporary values of frameNum, xNum and yNum to the corresponding 
    % time value, x value and y value.
    frameNum=trackData(i,3);
    xNum=trackData(i,1);
    yNum=trackData(i,2);
    
    %Find subset (subset1) of tracking data with same time value as frameNum
    subset1=batchData(batchData(:,4)==frameNum,:);
    
    %Find subset of subset1 with same x-value as xNum
    subset2=subset1(subset1(:,1)==xNum,:);
    
    %Find subset of subset2 with same y-value as yNum
    subset3=subset2(subset2(:,2)==yNum,:);
        
    %Adds matched r value from centresRadii array to trackData array
    output(i,5)=subset3(1,3);

end

end

