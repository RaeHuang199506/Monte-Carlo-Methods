pi = zeros(1, 1000);                 % 1000 different sample sizes
dots = 100; 
index = 1; isExist = 0; n = 0;
while dots <= 100000
    p = zeros(1, dots);
    count = 0;
    for i = 1 : dots                % For each sample size, estimate pi
       x = rand(); y = rand();
       if(x^2 + y^2 <= 1)           % To judge whether the point is inside or outside of the quarant
          p(i) = 1;
          count = count + 1;
       else
           p(i) = 0;
       end
    end
    pi(index) = 4 * mean(p);        % To calculate pi
    if(isExist == 0 && (1.96 * sqrt(var(p)) / sqrt(dots) <= 0.7854 * 0.01))
                                    % To be within 1% of the true value of pi (with probability 0.95)
        n = dots
        isExist = 1;
    end
    dots = dots + 100;              % Each time the sample size increase 100 dots
    index = index + 1;
end
pi(1000)
plot(pi); title("value of pi"); xlabel("sample size / 100"); axis([0 1000 min(pi) max(pi)]);