% 
% x1 = zeros(1,12);
% y1 = zeros(1,12);
% x2 = zeros(1,12);
% y2 = zeros(1,12);
% img1 = imread("goi1.jpg");
% figure(1); imshow(img1);
% img2 = imread("goi2.jpg");
% figure(2); imshow(img2);
% for i=1:12
%      figure(1);
%      [x1(i),y1(i)] = ginput(1);
% 
%      figure(2);
%      [x2(i),y2(i)] = ginput(1);
% end
% 
% % B part
% X = [x1' y1' ones(12,1)];
% 
% theta_x = X \ x2';
% theta_y = X \ y2';
% 
% a = theta_x(1);
% b = theta_x(2);
% t_x = theta_x(3);
% c = theta_y(1);
% d = theta_y(2);
% t_y = theta_y(3);
% 
% 
% A = [a,b; c,d];
% t = [t_x; t_y];
% 
% moving_points = [x1',y1'];
% fixed_points = [x2', y2'];
% 
% tform = fitgeotrans(moving_points, fixed_points, 'affine');
% 
% outputView = imref2d(size(img2(:,:,1)));
% 
% img_affine = imwarp(img1, tform, 'OutputView', outputView);
% 
% figure(3);
% imshow(img_affine)

% C part 

[m,n,channels] = size(img2);

img_3 = zeros(m, n, channels, 'uint8');


for y = 1:m
    for x = 1:n
        op2 = [x; y];

        op1 = A \ (op2 - t);

        x1_srce = op1(1);
        y1_srce = op1(2);

        if x1_srce >=1 && x1_srce <= size(img1,2) && ...
           y1_srce >=1 && y1_srce <= size(img1,1)

           x0 = floor(x1_srce);
           y0 = floor(y1_srce);

           x_ceil = x0+1;
           y_ceil = y0+1;

           if x_ceil > size(img1,2)
               x_ceil = size(img1,2);
           end

           if y_ceil > size(img1,1)
               y_ceil = size(img1,1);
           end

           alpha = x1_srce - x0;
           beta  = y1_srce - y0;

           % Bilinear interpolation

           for ch = 1:channels

               Q11 = double(img1(y0,  x0, ch));
               Q21 = double(img1(y0,  x_ceil, ch));
               Q12 = double(img1(y_ceil,  x0, ch));
               Q22 = double(img1(y_ceil,  x_ceil, ch));

               value = (1-alpha)*(1-beta)*Q11 + ...
               alpha*(1-beta)*Q21 + ...
               (1-alpha)*beta*Q12 + ...
               alpha*beta*Q22;

               img_3(y,x,ch) = uint8(value);

           end
        end
    end
end

figure(4);
imshow(img_3);
title('Transformed Image');


