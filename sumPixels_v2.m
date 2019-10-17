function[sumPixels] = sumPixels_v2(data, imArray)
    
    useSumMethod=false;
    
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
            
        if useSumMethod
            % Use shitty old method
            sumData = sum(tempImage(tempMask));
            sumPixels(j,6)=sumData;
        else
            % Use Otsu Method (have to invert image for some reason???)
%             iNew = imcomplement(tempImage);
%             iBin = imbinarize(iNew);
%             iFinal = imcomplement(iBin);
            
            [o1, o2] = bwlabel(tempImage&tempMask);
            n=0;
            for iBacteria = 1:max(o2)
                if (sum(sum(o1==iBacteria))>1), n=n+1; end
            end
            sumPixels(j,6) = n;
        end
    end
    
end