function [resultsArray] = threshVal(centresRadiiManual, testYFP, valStart, valEnd, increment, method);

method=int8(method);

if method==1
    text = sprintf('You have chosen chai squared test');
    disp(text);
elseif method==2
    text = sprintf('You have chosen absolute test');
    disp(text);
else
    text = sprintf('error');
    disp(text);
    return
end

if method==1
    %Delete all droplets with zero bacteria
    deleteIndex = ~any(centresRadiiManual(:,7),2);
    centresRadiiManual(deleteIndex,:) = [];
end


m = size(centresRadiiManual,1);
threshVal = valStart;
tempResults = [];
tempSum = [];
resultsArray = [];
count=1;

while threshVal<(valEnd+increment)
    
    disp(threshVal);

    testThresh = uint16(imbinarize(testYFP, threshVal));
    
    for  j = 1:m

        x=centresRadiiManual(j,1);
        y=centresRadiiManual(j,2);
        r=centresRadiiManual(j,3);

        tempImage = testThresh;
        tempMask = logicalMask(x,y,r,tempImage);

        [o1, o2] = bwlabel(tempImage&tempMask);

        n=0;

        for iBacteria = 1:max(o2)
            if (sum(sum(o1==iBacteria))>1), n=n+1; end
        end

        tempResults(j,1) = centresRadiiManual(j,7);
        tempResults(j,2) = n;
        if method==1;
            tempResults(j,3) = ((tempResults(j,1) - tempResults(j,2))^2)/(tempResults(j,1));
        else
            tempResults(j,3) = abs(tempResults(j,1) - tempResults(j,2));
        end

    end
    
    tempSum = sum(tempResults);
    
    resultsArray(count,1) = threshVal;
    resultsArray(count,2) = tempSum(3);

    count = count + 1;
    threshVal = threshVal + increment;
    
end

end