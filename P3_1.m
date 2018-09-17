dots = 100;
count = 1;
E1 = zeros(1, 1000); E2 = zeros(1, 1000); E3 = zeros(1, 1000);       % 1000 different sample sizes
E4 = zeros(1, 1000); E5 = zeros(1, 1000); 
while dots <= 100000
    x = rand(1, dots);
    y = sin(pi * x);
    p1 = zeros(1, dots); p2 = zeros(1, dots); p3 = zeros(1, dots);
    p4 = zeros(1, dots); p5 = zeros(1, dots); 
    for i = 1 : dots        % For each sample size, calculate corresponding formula
        p1(i) = y(i) / x(i); p2(i) = - y(i) / (x(i)+1); p3(i) = y(i) / (x(i)+2);
        p4(i) = - y(i) / (x(i)+3); p5(i) = y(i) / (x(i)+4); 
    end
    E1(count) = mean(p1); E2(count) = mean(p2); E3(count) = mean(p3);
    E4(count) = mean(p4); E5(count) = mean(p5); 
    count = count + 1;
    dots = dots + 100;
end
 figure(1); plot(E1); title("value of I(1)"); xlabel("sample size / 100"); axis([0 1000 min(E1) max(E1)]);
 hold on; figure(2); plot(E2); title("value of I(2)"); xlabel("sample size / 100"); axis([0 1000 min(E2) max(E2)]);
 hold on; figure(3); plot(E3); title("value of I(3)"); xlabel("sample size / 100"); axis([0 1000 min(E3) max(E3)]);
 hold on; figure(4); plot(E4); title("value of I(4)"); xlabel("sample size / 100"); axis([0 1000 min(E4) max(E4)]);
 hold on; figure(5); plot(E5); title("value of I(5)"); xlabel("sample size / 100"); axis([0 1000 min(E5) max(E5)]);