image = imread('rice.png');

subplot(2,2,1); 
imshow(image);
title("Input image: " + newline);

strelled = strel('disk',15);

background = imopen(image,strelled);

image2 = image - background;

image3 = imadjust(image2);

binarized_image = imbinarize(image3);
binarized_image = bwareaopen(binarized_image,50);

subplot(2,2,2);
imshow(binarized_image);
title("Output image of Thresholding: " + newline);

[L, num] = bwlabel(binarized_image);

RGB_label = label2rgb(L,'spring','k','shuffle');

subplot(2,2,3);
imshow(RGB_label);
title("Output image of Morphological Operations: " + newline);

connected_component_image = bwconncomp(binarized_image,4);
connected_component_image.NumObjects;

subplot(2,2,4);
axis off;
title("Number of grains: " + connected_component_image.NumObjects + newline);
