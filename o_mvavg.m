function y = o_mvavg(x,windowSize)
% a = windowsSize
% if a is odd, then b = (a-1)/2, y(n) = 1/a * (x(n-b) + x(n-b+1) + ...+
% x(n+b), eg. y(3) = 1/3 * (y(1) + y(2) + y(3))
% if a = 4 is even, y(3) = 1/4 * (y(1) + y(2) + y(3) + y(4))

b = (1/windowSize)*ones(1,windowSize);
a = 1;
y1 = filter(b,a,x);

xsize = length(x)
y = nan(1,xsize);

in1 = fix(windowSize/2);
for i = 1:in1
    y(i) = mean(x(1:i));
end
in2 = xsize-in1+1;
for i = in2:xsize
    y(i) = mean(x(in2:i));
end
if ~~mod(windowSize,2)
    y(in1+1:in2-1) = y1(windowSize:end);
else
    y(in1+1:in2) = y1(windowSize:end);
end



end