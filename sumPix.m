function[sumPix] = sumPix(data, imArray)
    
    
    sumPix=data;
    m=size(sumPix,1);
        M=size(imArray);

    for  j = 1:m;
        
       

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
            
            
            if x-r<0
                sumPix(j,9)= 1;
                
            elseif x+r > M(2)
                sumPix(j,9)= 1;
                
            elseif y-r<0
                sumPix(j,9)= 1;
                
            elseif y+r> M(1)
                sumPix(j,9)= 1;
            else sumPix(j,9)=0;
            end
            
            
            
    end
    
save('sumPix.mat','sumPix','-v7.3');
end
