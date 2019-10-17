
function [finalData, stitchedPhase, stitchedYFP, stitchedYFPThresh] = PhaseOneTwoSave(nCols, nRows, startImageFolder)

profile on

nTime = 80;
imSize = 1024;

%circle values: 
sens = 0.95;
edge = 0.08;
dropRange = [73 113];
threshVal = 0.0756;

offsetCol = 0;
offsetRow = 0;

[stitchedPhase, stitchedYFP, stitchedYFPThresh] = PhaseOne(nCols, nRows, nTime, imSize, threshVal, startImageFolder, offsetCol, offsetRow);

save('stitchedPhase.mat','stitchedPhase','-v7.3');
save('stitchedYFP.mat','stitchedYFP','-v7.3');
save('stitchedYFPThresh.mat','stitchedYFPThresh','-v7.3');

[finalData] = PhaseTwo(stitchedPhase, stitchedYFPThresh, sens, edge, dropRange);

save('finalData.mat','finalData','-v7.3');

profile viewer

end