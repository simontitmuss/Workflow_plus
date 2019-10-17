function[output] = processDataCutoff(data, time, cutoff)

sepData = dataSep(data);
sepData = sepData(cellfun('size', sepData, 1) >= cutoff);

numberOfDroplets = size(sepData, 1);
output = zeros(time + 1, numberOfDroplets);

for i = 1:numberOfDroplets
    
        tempDropData = sepData{i,1};
        timeLength = size(tempDropData,1);
       
        timeStart = tempDropData(1,3);
        timeEnd = timeStart + timeLength - 1;

        output(timeStart+1:timeEnd+1, i) = tempDropData(:,6);
        
        output(1:timeStart, i) = NaN;
        output(timeEnd+2:time+1, i) = NaN;
        
        output(1,i) = tempDropData(1,4);

end

end