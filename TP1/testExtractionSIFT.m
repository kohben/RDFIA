function [] = testExtractionSIFT (I,s)

Mx = [1 0 -1 ; 2 0 -2 ; 1 0 -1];
My = [1 2 1; 0 0 0;-1 -2 -1];
% On remarque que Mx = hx*hy avec hx =[1 ; 2 ;1] et 
% hy = [1  0 -1] De plus My = transpose(Mx) donc
% My = transpose(hy) * transpose(hx)
hx =[1 ; 2 ;1];
hy = [1 0 -1];


[n,m] = size(I);
Ix = convolution_separable(I,hy,hx);
Iy = convolution_separable(I,hx',hy');
Ig = (Ix.^2+Iy.^2).^1/2;
Ior = orientation (Ix,Iy,Ig);
Mg = gaussSIFT(s);

x0 = 125;
y0 = 100;
 
%Ig(x0:x0+s,y0:y0+s)
%Ior(x0:x0+s,y0:y0+s)
Mg;
sift = computeSIFT(s,Ig(x0:x0+s-1,y0:y0+s-1),Ior(x0:x0+s-1,y0:y0+s-1),Mg);
size(sift)
patch = [x0;y0];
visuSIFT( I, Ig,Ior, patch ,'visu',s,sift)
		
