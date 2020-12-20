function A = laplacian(B)
%laplacian is the Laplacian operator.
%caculate delta phi

h = fspecial('laplacian',0);
A = imfilter(B,h,'replicate');

