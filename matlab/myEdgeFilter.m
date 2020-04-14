function [img1] = myEdgeFilter(img0, sigma)
%Your implemention

h = (2 * ceil(3 * sigma) + 1) ;

Gaussian_Filter = fspecial('gaussian',h,sigma);

img1 = myImageFilter(img0,Gaussian_Filter);

% imshow(img1)
% figure;

sobelx = [1 0 -1; 2 0 -2; 1 0 -1];
sobely = sobelx';

imgx = myImageFilter(img1,sobelx);

% imshow(imgx);
% figure;

imgy = myImageFilter(img1,sobely);

% imshow(imgy);
% figure;

img_magnitude = sqrt(imgx.*imgx + imgy.*imgy);
 
% imshow(img_magnitude);
% figure;

img_direction = atan2(imgy,imgx) * (180.0/pi);
% 
% imshow(img_direction);
% figure;

neg = img_direction < 0;

% disp(img_direction)
% disp(neg);

% imshow(neg);
% figure;

dir_image = img_direction + 180 * neg;

% disp(dir_image);

% imshow(dir_image)

new_image = zeros(size(img1));


new_image((dir_image < 22.5) | (dir_image > 157.5)) = 0;

new_image(dir_image >= 22.5 & dir_image < 67.5) = 45;

new_image(dir_image >= 67.5 & dir_image < 112.5) = 90;

new_image(dir_image >= 112.5 & dir_image <= 157.5) = 135;

% disp(new_image);
% imshow(new_image);
% figure;
% imshow(new_image);
% figure;

img1 = zeros(size(img1));
[row,column] = size(img1);

for i=2:row-1
    for j=2:column-1
        if (new_image(i,j)==0)
            img1(i,j) = (img_magnitude(i,j) == max([img_magnitude(i,j), img_magnitude(i,j+1), img_magnitude(i,j-1)]));
        elseif (new_image(i,j)==45)
            img1(i,j) = (img_magnitude(i,j) == max([img_magnitude(i,j), img_magnitude(i+1,j-1), img_magnitude(i-1,j+1)]));
        elseif (new_image(i,j)==90)
            img1(i,j) = (img_magnitude(i,j) == max([img_magnitude(i,j), img_magnitude(i+1,j), img_magnitude(i-1,j)]));
        elseif (new_image(i,j)==135)
            img1(i,j) = (img_magnitude(i,j) == max([img_magnitude(i,j), img_magnitude(i+1,j+1), img_magnitude(i-1,j-1)]));
        end
    end
end



% imshow(img1);
% figure;
img1 = img1.*img_magnitude;
% imshow(img1);
% figure;
% imshow(edge(img0))
                
        
        
