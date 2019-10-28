%Intergrated flouresence comparison
data= sumPix_1204_4_inside_bounds;

rad = data(:,5);
rad_sq= (rad).^2;
pixel_sum = data(:,7);
Pix_sum_norm=pixel_sum./(6.23*rad_sq);

[p,s] =polyfit(data(:,6), Pix_sum_norm, 1);
[y, delta]= polyval(p, data(:,6), s); % delta returns standard error estimate


  plot(data(:,6), data(:,7), 'x')
  xlabel ('Bacteria count')
  ylabel('Pixel sum')


% figure (2)
% plot(data(:,6),Pix_sum_norm,'.')
% hold on
% plot(data(:,6),y)
% hold off
% xlabel ('Bacteria count')
% ylabel('Normalised pixel sum')


figure (3)
plot(data(:,6),Pix_sum_norm,'.')
hold on
plot(data(:,6),y, 'r-')
plot(data(:,6),y+2*delta, 'm-',data(:,6),y-2*delta, 'm--' )
hold off
xlabel ('Bacteria count')
ylabel('Normalised pixel sum')



R_sq= 1 - (s.normr/norm(Pix_sum_norm - mean(Pix_sum_norm)))^2;

%-------------------------------
max_pixel_val= data(:,8);

for i= 1:size(data,1);
    if data(i, 6)==0 
        
zero_bact_max_pixel(i)=data(i,8);
    else
        present_bact_max_pixel(i) = data(i,8);

    end
end

zero_bact_max_pixel = nonzeros(zero_bact_max_pixel);
 present_bact_max_pixel =nonzeros( present_bact_max_pixel);
 
 
 figure (4)
 plot( present_bact_max_pixel)
 hold on 
 plot (zero_bact_max_pixel)
 
 hold off
 ylabel ('Pixel value')
legend ('present bacteria','zero count')

