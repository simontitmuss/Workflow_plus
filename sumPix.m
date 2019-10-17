function[sumPix] = sumPix(data, imArray)
    
    
    sumPix=data;
    m=size(sumPix,1);
    
    for  j = 1:m
        
        disp(j);

        x=sumPix(j,1);
        y=sumPix(j,2);
        r=sumPix(j,5);
        t=sumPix(j,3);
        
        tempImage = imArray(:,:,t);
        tempMask = logicalMask(x,y,r,tempImage);
            
            sumData = sum(tempImage(tempMask));
            sumPix(j,7)=sumData;
            a= max(tempImage(tempMask));
            sumPix(j,8)=a;
    end
    
save('sumPix.mat','sumPix','-v7.3');
end
