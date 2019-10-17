function [dropImage, bactNum, r] = dropFrameID(imageArray, data, ID, t)

tempImage = (imageArray(:,:,t));

tempData = data(data(:,4)==ID,:);
tempData = tempData(tempData(:,3)==t,:);

x=uint16(tempData(1,2));
y=uint16(tempData(1,1));
r=tempData(1,5);
bactNum=tempData(1,6);

border = 20;
dropImage = tempImage(x-(r+border):x+(r+border),y-(r+border):y+(r+border));

end