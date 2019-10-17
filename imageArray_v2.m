function [imageArray] = imageArray_v2(imageFolder, typeChoice)

    %Get sorted file names in cell array
    imageNames = loadSort_v2(imageFolder, typeChoice);
    
    % n = total number of images in folder
    n=size(imageNames,2);
    imageArray=[];
    for i = 1:n
        tempIm = [imageNames{1,i},'\', imageNames{2,i}];
        imreadResult=imread(tempIm);
        imageArray=cat(3, imageArray, imreadResult);
    end
    
    

end

