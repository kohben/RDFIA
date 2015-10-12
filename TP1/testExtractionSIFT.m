function [] = testExtractionSIFT (I,s)

Mx = [1 0 -1 ; 2 0 -2 ; 1 0 -1];
My = [1 2 1; 0 0 0;-1 -2 -1];
% On remarque que Mx = hx*hy avec hx =[1 ; 2 ;1] et 
% hy = [1  0 -1] De plus My = transpose(Mx) donc
% My = transpose(hy) * transpose(hx)
hx =[1 ; 2 ;1];
hy = [1 0 -1];


[n,m] = size(I);
Ix = convolution_separable(I,hy,hx)/4;
Iy = convolution_separable(I,hx',hy')/4;
Ig = (Ix.^2+Iy.^2).^1/2;
Ior = orientation (Ix,Iy,Ig);
Mg = gaussSIFT(s);

 
%Ig(x0:x0+s,y0:y0+s)
%Ior(x0:x0+s,y0:y0+s)

delta = s/2
r = denseSampling( I, s, delta );
patch = r(:,randi(size(r,2)))
x0 = patch(1);
y0 = patch(2)
sift = computeSIFT(s,Ig(x0:x0+s-1,y0:y0+s-1),Ior(x0:x0+s-1,y0:y0+s-1),Mg);
size(sift);

visuSIFT( I, Ig,Ior, patch ,'visu',s,sift)
		
