%   Matlad code implementing Chan-Vese model in the paper 'Active Contours Without Edges'
%   This method works well for bimodal images, for example the image 'three.bmp'


clear;
close all;
clc;

Img=imread('three.bmp');      % example that CV model works well
 %Img=imread('vessel.bmp');    % Warning: example image that CV model does NOT work well
 %Img=imread('twoCells.bmp');   % Warning: example image that CV model does NOT work well
U=Img(:,:,1);

% get the size
[nrow,ncol] =size(U);
phi=4*ones(nrow,ncol);
phi(6:end-5,6:end-5)=-4;
ic=nrow/2;
jc=ncol/2;
%r=20;
%phi_0 = 4*sdf2circle(nrow,ncol,ic,jc,r);
phi_0 = phi;
figure; mesh(phi_0); title('Signed Distance Function')

delta_t = 500;
lambda = 5;
lambda_1 = 1;
lambda_2 = 1;
nu= 1;
epsilon=1.5;
mu = 0.2/delta_t;

I=double(U);
% iteration should begin from here
phi=phi_0;
figure(2);
subplot(1,2,1); mesh(phi);
subplot(1,2,2); imagesc(uint8(I));colormap(gray)
hold on;
plotLevelSet(phi,0,'r');

numIter = 1;
for k=1:100,
    phi = evolution_cv(I, phi, mu, nu, lambda,lambda_1,lambda_2, delta_t, epsilon, numIter);   % update level set function
    if mod(k,2)==0
        pause(.5);
        figure(2); clc; axis equal; 
        title(sprintf('Itertion times: %d', k));
        subplot(1,2,1); mesh(phi);
        subplot(1,2,2); imagesc(uint8(I));colormap(gray)
        hold on; plotLevelSet(phi,0,'r');
    end    
end;
