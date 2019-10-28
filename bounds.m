%Int_flour_comp subsets.

%[Low_Sums] = Low_Sums(data, imArray)
%low_sums_logic= Low_Sums(:, 7)<6E6;
%Low_Sums=Low_Sums(low_sums_logic,:);

data= sumPix;
imArray= stitchedYFP;
    m=size(data,1);
    Outside_bounds=0;
    M=size(imArray);
    
 for  j = 1:m %each row of data

  x=data(j,1);
  y=data(j,2);
  r=data(j,5);
    

      if x-r<0
          Outside_bounds= Outside_bounds+1;

      elseif x+r > M(2)
          Outside_bounds= Outside_bounds+1;

      elseif y-r<0
          Outside_bounds= Outside_bounds+1;

      elseif y+r> M(1)
          Outside_bounds= Outside_bounds+1;
      end

 
    
            if x-r<0
                data(j,9)= 1;
                
            elseif x+r > M(2)
                data(j,9)= 1;
                
            elseif y-r<0
                data(j,9)= 1;
                
            elseif y+r> M(1)
                data(j,9)= 1;
            else data(j,9)=0;
            end
            
            
 end