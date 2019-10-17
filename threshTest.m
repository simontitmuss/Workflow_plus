function [testYFP, testThresh, centresRadii] = threshTest(testPhase, testYFP, threshVal);


%Threshold the raw YFP image with input threshold value
testThresh = uint16(imbinarize(testYFP, threshVal));
%testThresh = uint16(imbinarize(testYFP,'adaptive','ForegroundPolarity','dark','Sensitivity',threshVal));

%Detect circles in the image
[centres, radii, centresRadii] = batchfindcirclesPhaseTwo(testPhase, 0.9, 0.06, [70 85]);

m = size(centresRadii,1);

for  j = 1:m

    x=centresRadii(j,1);
    y=centresRadii(j,2);
    r=centresRadii(j,3);

    tempImage = testThresh;
    tempMask = logicalMask(x,y,r,tempImage);

    [o1, o2] = bwlabel(tempImage&tempMask);

    n=0;

    for iBacteria = 1:max(o2)
        if (sum(sum(o1==iBacteria))>1), n=n+1; end
    end

    centresRadii(j,5) = n;
    centresRadii(j,6) = j;

end

tempTxt = num2str(centresRadii(:,5));
tempTxt2 = num2str(centresRadii(:,6));

f1 = figure;
axs1 = axes(f1);
image1 = [];
image1 = imagesc(testYFP);
colormap gray;
axis equal;
viscircles(axs1, [centresRadii(:,1),centresRadii(:,2)], centresRadii(:,3));
text(centresRadii(:,1), centresRadii(:,2), tempTxt2, 'Color', 'red', 'FontSize', 14);

f2 = figure;
axs2 = axes(f2);
image2 = [];
image2 = imagesc(testThresh);
colormap gray;
axis equal;
viscircles(axs2, [centresRadii(:,1),centresRadii(:,2)], centresRadii(:,3));
text(centresRadii(:,1), centresRadii(:,2), tempTxt2, 'Color', 'yellow', 'FontSize', 14);

f3 = figure;
axs3 = axes(f3);
image3 = [];
image3 = imagesc(testPhase);
colormap gray;
axis equal;
viscircles(axs3, [centresRadii(:,1),centresRadii(:,2)], centresRadii(:,3));
text(centresRadii(:,1), centresRadii(:,2), tempTxt2, 'Color', 'red', 'FontSize', 14);

end
