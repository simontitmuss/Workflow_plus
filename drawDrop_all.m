function [a] = drawDrop_all(imageArray1,imageArray2,imageArray3, data, ID, t, border)

frameImage=imageArray1(:,:,t);

%Takes the image array, numerical data, ID and time you are interested in,
%and produces an image centred on that, with a border manually given in the
%function input

[dropImage1, bactNum, r] = dropFrameID(imageArray1, data, ID, t);
[dropImage2, bactNum, r] = dropFrameID(imageArray2, data, ID, t);
[dropImage3, bactNum, r] = dropFrameID(imageArray3, data, ID, t);

f4 = figure(4);

imSize=size(dropImage1,1);
centre = imSize/2;
textPos = imSize-50;
 
image = imagesc(dropImage1);
axis equal
viscircles([centre,centre], (r));

txt = num2str(bactNum);
t = text(textPos,textPos,txt);
t.FontSize=30;
t.Color='r';
t.FontWeight='bold';


f2 = figure(2);
imSize=size(dropImage2,1);
centre = imSize/2;
textPos = imSize-50;
 
image = imagesc(dropImage2);
axis equal
viscircles([centre,centre], (r));

txt = num2str(bactNum);
t = text(textPos,textPos,txt);
t.FontSize=30;
t.Color='r';
t.FontWeight='bold';

f3=figure(3);
imSize=size(dropImage3,1);
centre = imSize/2;
textPos = imSize-50;
 
image = imagesc(dropImage3);
axis equal
viscircles([centre,centre], (r));

txt = num2str(bactNum);
t = text(textPos,textPos,txt);
t.FontSize=30;
t.Color='r';
t.FontWeight='bold';


end