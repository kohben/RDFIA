function [ sift ] = computeSIFT( s ,seuilContrast, Ig, Ior, Mg )
sift = zeros(128,1);
seuil = 0.2;
Ior;
Ig;
for idx = 1:4
	for idy = 1:4
                hist = zeros(8,1);
                i1 = 4*(idx-1)+1;
                j1 = 4*(idy-1)+1;

                        for i = i1:i1+3
	                        for j = j1:j1+3 
                                        if Ior(i,j)> 0  
		                                hist(Ior(i,j)) = hist(Ior(i,j)) + Ig(i,j)*Mg(i,j);
                                        end
	                        end
                        end

                sift(8*(idy-1)+32*(idx-1)+1:8*(idy-1)+32*(idx-1)+8,1) = hist;
	        end
       end
if norm(sift) < seuilContrast
	sift = zeros(128,1);
else	
	sift = sift/norm(sift);
	[n,m] = size(sift);
	for i = 1:n
		for j = 1:m
			if sift(i,j) > seuil
				sift(i,j) = seuil;
			end
		end
	end
	sift = sift/norm(sift);
end	

end
