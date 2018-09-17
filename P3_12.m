x = rand(1, 1000);
y = sin(pi * x);
sum = 0;
for n = 1 : 10100100
    p = zeros(1, 1000);
    for i = 1 : 1000
        p(i) = (-1)^(n-1) * (y(i) / (x(i)+(n-1)));
    end
    sum = sum + mean(p);    % sum of all periods of Integration
end
mean(p) 
sum