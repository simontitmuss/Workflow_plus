function [stitchedPhase, stitchedYFP] = stitchImagesPhaseOne(startImageFolder, nCols, nRows, nTime, imSize, offsetCol, offsetRow)

    totalImSize = [imSize*nRows, imSize*nCols];
    stitchedPhase = zeros(imSize*nRows,imSize*nCols, nTime,'uint16');
    stitchedYFP = zeros(imSize*nRows,imSize*nCols, nTime,'uint16');
        
    % Get folder names in start location
    strs = dir(startImageFolder);
    strs = strs([strs(:).isdir]);
    strs = strs(~strcmp({strs(:).name},'.'));
    strs = strs(~strcmp({strs(:).name},'..'));
    
    % Parse names to get order
    index = [];
    count = [];
    for j = 1:size(strs, 1)
        
        tmpName = strs(j).name;
        
        underScoreIndx = strfind(tmpName,'_');
        tempCol = str2double(tmpName(underScoreIndx(1)+1:underScoreIndx(2)-1)) + 1;
        tempRow = str2double(tmpName(underScoreIndx(2)+1:end)) + 1;
        
        tempCol = tempCol - offsetCol;
        tempRow = tempRow - offsetRow;

        %Get sorted file names in cell array
        imagesYFP = imageArray_v2([strs(j).folder '\' tmpName],'YFP');
        imagesPhase = imageArray_v2([strs(j).folder '\' tmpName],'Transmitted light');
        
        % Generate mask for this image
        n = size(stitchedYFP);
        mask = false(n(1), n(2), n(3));
        indxRow = [(nRows * imSize) - (tempRow * imSize) + 1, (nRows * imSize) - ((tempRow - 1) * imSize)];
        indxCol = [(nCols * imSize) - (tempCol * imSize) + 1, (nCols * imSize) - ((tempCol - 1) * imSize)];
        mask(indxRow(1):indxRow(2), indxCol(1):indxCol(2), :) = true;
        
        stitchedYFP(mask) = imagesYFP(:,:,1:nTime);
        stitchedPhase(mask) = imagesPhase(:,:,1:nTime);
        
        count = j
        
    end
    
end