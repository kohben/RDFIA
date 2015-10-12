function [ nc ] = assignementKMeans( listPts , centers )
nc=0;
K = size(centers,1);
alpha = size(centers,2);
x = size(listPts,1);
repPts = repmat(listPts,1,size(centers,1));
centersFlat = reshape(centers',1,numel(centers));
repCenters = repmat(centersFlat,size(listPts,1),1);

diff = repPts-repCenters;
diff = diff.*diff;
norm = sum(reshape(diff',[alpha,x*K]),1);
linNorm = reshape(norm,[K,x]);

[minvalues,nc] = min(linNorm,[],1);

end