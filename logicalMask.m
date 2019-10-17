function [mask] = logicalMask(x,y,r,imageArray)

[xx yy]=meshgrid(1:size(imageArray,2),1:size(imageArray,1));

mask = sqrt((xx-x).^2+(yy-y).^2)<=r;

end

