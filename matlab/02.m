# point filtering.
image = imread('furukawa.jpg');
imshow(image);
figure;
imshow(image - uint8(ones(size(image)) * 128));
figure;
imshow(image / 2)
figure;
# Incorrect somewhere
imshow(uint8(double(image / 255.0).^0.333 * 255))
figure;
imshow(uint8((double(image) / 255.0).^0.333 * 255))

figure;
imshow(uint8(int32(ones(size(image))) * 255 - int32(image)));
figure;
imshow(uint8(double(image) + ones(size(image)) * 128))

# box filtering.
figure;
gimage = rgb2gray(image);
imshow(gimage);
figure;
imshow(uint8(conv2(rgb2gray(image), ones(3, 3) / 9.0)))
figure;
imshow(uint8(conv2(rgb2gray(image), ones(7, 7) / 49.0)))

# sharpening filter.
figure;
sharp_filter = [0 0 0 ; 0 2 0 ; 0 0 0] - ones(3, 3) / 9.0;
imshow(uint8(conv2(gimage, sharp_filter)));

# sobel
figure;
sobelx = [1 0 -1; 2 0 -2; 1 0 -1];
imshow(uint8(conv2(gimage, sobelx)));
figure;
imshow(uint8(abs(conv2(gimage, sobelx))));

sobely = sobelx';
figure;
imshow(uint8(abs(conv2(gimage, sobely))));

