function[countPixels] = countPixels(data, imArray)
        
    sumPixels=data;
    m=size(sumPixels,1);
    
    for  j = 1:m
        
        disp(j);

        x=sumPixels(j,1);
        y=sumPixels(j,2);
        r=sumPixels(j,5);
        t=sumPixels(j,3);
        
        tempImage = imArray(:,:,t);
        tempMask = logicalMask(x,y,r,tempImage);

            [o1, o2] = bwlabel(tempImage&tempMask);
            n=0;
            for iBacteria = 1:max(o2)
                if (sum(sum(o1==iBacteria))>1), n=n+1; end
            end
            sumPixels(j,6) = n;
        end
    end
    
end