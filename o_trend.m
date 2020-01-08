function [trend] = o_trend(data,time);

% trend = o_trend(data,time)
% data should be lon * lat * time

if size(time,2)>1
    time = time';
end
m = size(data,1);
n = size(data,2);

trend = nan(m,n);
% bint = nan(m,n,2);
% r = nan(m,n);
% rint = nan(m,n);
% stats = nan(m,n);

for i = 1:m
    for j = 1:n
        y = squeeze(data(i,j,:));
        [trend(i,j)] = regress(y,time);
    end
end
    
end