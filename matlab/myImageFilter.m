function [img1] = myImageFilter(img0, h)

l=length(h);

pad = (l -1) / 2;

pad_image = padarray(img0,[pad pad],'replicate','both');
[r,c] = size(pad_image);
img1=zeros(size(img0));
% h = flip(h,2);
for i = 1 : r - l

    for j = 1 : c - l
        
        img1(i,j) = sum(sum(pad_image(i:i+l-1,j:j+l-1).*h));
        
    end

end
% imshow(img1);
% figure;
% imshow(conv2(img0,h));
% figure;