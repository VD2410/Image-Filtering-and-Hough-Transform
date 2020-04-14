function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)
%Your implementation here

[row,column] = size(Im);

theta_max = (-90:1:90);
% disp(numel(theta_max))
rho_max = round(sqrt(row^2 + column^2));

H = zeros(2*(rho_max),numel(theta_max)-1);

for i = 1:row
    for j = 1:column
        if Im(i,j)>= threshold
            for t = numel(theta_max)-1:-1:1
                
                r = round((j*cos(theta_max(t)*pi/180)+ i*sin(theta_max(t)*pi/180)) + rho_max )+1;
                
                H(r,t) = H(r,t) +1;
            end
        end
    end
end


thetaScale = rad2deg(0:thetaRes/2:pi);
rhoScale = -rho_max:rhoRes:rho_max;



% figure
% imshow(imadjust(rescale(H)),[],...
%        'XData',thetaScale,...
%        'YData',rhoScale,...
%        'InitialMagnification','fit');
% xlabel('\theta (degrees)')
% ylabel('\rho')
% axis on
% axis normal 
% hold on
% colormap(gca,hot)
% 
% figure;
% imshow(uint8(H),[],'xdata',thetaScale,'ydata',rhoScale);
% xlabel('\theta'),ylabel('\rho')
% axis on, axis normal;
% title('Hough Matrix');
% 
% [H,theta,rho] = hough(Im);
% 
% figure
% imshow(imadjust(rescale(H)),[],...
%        'XData',theta,...
%        'YData',rho,...
%        'InitialMagnification','fit');
% xlabel('\theta (degrees)')
% ylabel('\rho')
% axis on
% axis normal 
% hold on
% colormap(gca,hot)
% 
% figure;
% imshow(uint8(H),[],'xdata',theta,'ydata',rho);
% xlabel('\theta'),ylabel('\rho')
% axis on, axis normal;
% title('Hough Matrix');


end
        
        