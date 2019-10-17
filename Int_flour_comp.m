%Intergrated flouresence comparison
%[sumPix] = sumPix(data, imArray)

rad = sumPix (:,5);
rad_sq= (rad).^2;
pixel_sum = sumPix(:,7);
Pix_sum_norm=pixel_sum./rad_sq;

% plot(sumPix(:,6), Pix_sum_norm, 'x')
% xlabel ('Bacteria count')
% ylabel('Normalised pixel sum')




[p,s] =polyfit(sumPix(:,6), Pix_sum_norm, 1);
[y, delta]= polyval(p, sumPix(:,6), s); % delta returns standard error estimate
% figure (2)
% plot(sumPix(:,6),Pix_sum_norm,'.')
% hold on
% plot(sumPix(:,6),y)
% hold off
% xlabel ('Bacteria count')
% ylabel('Normalised pixel sum')


figure (3)
plot(sumPix(:,6),Pix_sum_norm,'.')
hold on
plot(sumPix(:,6),y, 'r-')
plot(sumPix(:,6),y+2*delta, 'm-',sumPix(:,6),y-2*delta, 'm--' )
hold off
xlabel ('Bacteria count')
ylabel('Normalised pixel sum')



R_sq= 1 - (s.normr/norm(Pix_sum_norm - mean(Pix_sum_norm)))^2;

%-------------------------------
max_pixel_val= sumPix(:,8);

for i= 1:size(sumPix,1);
    if sumPix(i, 6)==0 
        
zero_bact_max_pixel(i)=sumPix(i,8);
    else
        present_bact_max_pixel(i) = sumPix(i,8);

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