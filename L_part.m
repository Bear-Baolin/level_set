function A=L_part(g,f,phi)
%g gaussian smoothed image
%phi 
%f
[vx,vy]=gradient(g);
[ux,uy]=gradient(phi);
norm=sqrt(ux.^2 + uy.^2 + 1e-10);    
Nx=ux./norm;[nxx,~]=gradient(Nx);
Ny=uy./norm;[~,nyy]=gradient(Ny);
K=nxx+nyy;
A = f.*(vx.*Nx + vy.*Ny + g.*K);