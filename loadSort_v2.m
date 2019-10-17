function [strs] = loadSort_v2(inputFolder, typeChoice)


    % Outputs M x 1 structure containing name, folder, dates, bytes, isdir,
    % datenum of all files in input folder ending with .tif
    strs = dir([inputFolder '\*.tif']);
    
    % Outputs 2 x M cell that contains file path and file name off all .tif
    % files in input folder
    strs = cat(1,{strs.folder},{strs.name});
    
    m=size(strs,2);
    index = [];
    isType = [];
    
    for j = 1:m
        
        %tmpName = j'th file name from strs
        tmpName = strs{2,j};
        
        %Find locations of underscores in tmpName
        underScoreIndx = strfind(tmpName,'_');
        
        %tempNum = number between first and second underscores
        tempNum = 1 + str2double(tmpName(underScoreIndx(1)+1:underScoreIndx(2)-1));
        
        %type = type of image file (yfp or transmitted light) from between
        %2nd and 3rd underscores
        type = tmpName(underScoreIndx(2)+1:underScoreIndx(3)-1);
        
        if ~strcmp(type,typeChoice)
            continue;
        end
        isType = [isType j];
        index = [index, tempNum];   
    end
    tmpStrs = cell(2, size(strs,2)/2);
    tmpStrs(1:2,index) = strs(1:2,isType);
    strs=tmpStrs;
end

