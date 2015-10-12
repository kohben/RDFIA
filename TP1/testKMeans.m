function [] = testKMeans()

[points,norms] = randomSampling('../TP1/Descriptors/');
M = 1000;
iter = 10;
d = size(points,2);
[chosencenter,chosenerrorq] = solutionKMeans(points,M);
for i=1:iter
	[newcenters,newerrorq] = solutionKMeans(points,M);
	if newerrorq < chosenerrorq
		chosencenter = newcenter;
		chosenerrorq = newerrorq;
	end
end

chosencenter = vertcat(chosencenters,zeros(1,M));
desname = strcat('Dictionnary/dico.mat');
save(desname,'chosencenter');
end