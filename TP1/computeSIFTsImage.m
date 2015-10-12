function [sifts,r] = computeSIFTsImage(I)
seuilContrast = 20;
hx = [1 ; 2 ;1];
hy = [1 0 -1];
s = 16;
delta = s/2;

[n,m] = size(I);
Ix = convolution_separable(I,hy,hx)/4;
Iy = convolution_separable(I,hx',hy')/4;
Ig = (Ix.^2+Iy.^2).^1/2;
Ior = orientation (Ix,Iy,Ig);
Mg = gaussSIFT(s);

r = denseSampling( I, s, delta );
sifts = zeros(size(r,2),128);
for i = 1:size(r,2)
	patch = r(:,i);
	
	sift = computeSIFT( s ,seuilContrast, Ig(patch(1):patch(1)+s-1,patch(2):patch(2)+s-1) ,Ior(patch(1):patch(1)+s-1,patch(2):patch(2)+s-1), Mg );
	sifts(i,:)= sift;
end
sifts= sifts';
end