function g = edge_function(I,p)
%general edge-detector g
%I original image
%p the order p>=1
h = fspecial('gaussian',5,1.8);%��˹�����ģ��
I_gauss = imfilter(I,h);%��ͼ����и�˹�˲�
[f_fx,f_fy]=forward_gradient(I_gauss);
[f_bx,f_by]=backward_gradient(I_gauss);
mag1=sqrt(f_fx.^2+f_fy.^2+1e-10);
g = 1./(1+mag1.^2+1e-10);


