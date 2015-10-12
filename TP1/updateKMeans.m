function [ newcenters , errorq , movecenters ] = updateKMeans( listPts , centers  , nc)
	newcenters = 0;
	errorq=0;
      movecenters=0;
N = size(listPts,1);
d = size(listPts,2);
K = size(centers,1);
bar = zeros(K,d+1);
for i = 1:size(nc,2)
    bar(nc(1,i),1:d) = bar(nc(1,i),1:d) + listPts(i,:);
    bar(nc(1,i),d+1) = bar(nc(1,i),d+1) + 1;
end
5
for j = 1:K
 if bar(j,d+1) == 0
  bar(j,d+1) = 1;
  bar(j,1:d) = centers(j,:);
 end
end
bar(:,d+1);
newcenters = bsxfun(@rdivide,double(bar(:,1:d)),double(bar(:,d+1)));
movecenters = sum(sum((centers-newcenters).*(centers-newcenters),1),2);
6
errorq = 0
for i = 1:size(nc,2)
    errorq = errorq + sum((newcenters(nc(i),:)-listPts(i,:)).*(newcenters(nc(i),:)-listPts(i,:)));
end
end