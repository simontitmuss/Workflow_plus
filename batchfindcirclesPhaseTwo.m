function [centres, radii, centresRadii] = batchfindcirclesPhaseTwo(imArray, sens, edge, range)

    % Input: 
    % 3D array of time sequential phase contrast images
    
    % Purpose:
    % Detects circles in phase contrast images and stores their repesctive
    % positions and size
    
    % Output:
    % centres - (x y) co-ordinates of circles found in images, alongside
    % respective time step
    % radii - radii of of circles found in images, alongside
    % respective time step
    % centresRadii - merged array of centres + radii
    

    centres = {};
    radii = {};
    centresRadii= {};
    
    % n set to size of third dimension of image array, i.e. number of time steps
    n=size(imArray,3);
    
    parfor i = 1:n
        
        % Uses function "imfindcircles" on the i'th image from image array, running through all time steps, using user defined settings
        % Creates a temporary array with all (x y radii) values of circles found in image pulled from array
        [tmpCentres, tmpRadii, ~] = imfindcircles(imArray(:,:,i),range,'Sensitivity',sens,'EdgeThreshold',edge,'Method','TwoStage','ObjectPolarity','Dark');
        
        % Time value added to end of each temporary array, matched to size of temporary array
        tmpCentresRadii = [tmpCentres, tmpRadii, i*ones(size(tmpCentres, 1), 1)];
        tmpCentres = [tmpCentres, i*ones(size(tmpCentres, 1), 1)];
        tmpRadii = [tmpRadii, i*ones(size(tmpRadii, 1), 1)];
        
        % i'th element of each output array set from temporary value
        centres{i} = tmpCentres;
        radii{i} = tmpRadii;
        centresRadii{i} = tmpCentresRadii; 
    end 
   
   % Catenates the cell array into a single 2D array 
   centres = cat(1, centres{1,:});
   radii = cat(1, radii{1,:});
   centresRadii = cat(1, centresRadii{1,:});
   
end

