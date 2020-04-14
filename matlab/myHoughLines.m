function [rhos, thetas] = myHoughLines(H, nLines)
%Your implemention here
Hmax = nlfilter(H,[3 3],@(b) all(b(5) >= b([1 2 3 4 6 7 8 9])));
% disp(max(Hmax))
[rho, theta] = find(Hmax == max(Hmax));
% disp(rho);
rhos = [];thetas = [];
i=1;
while numel(rhos)<=nLines*200
    if Hmax(rho(i),theta(i)) > 0
        rhos = [rhos;rho(i)];
        thetas = [thetas;theta(i)];
    end
    i=i+1;
end
end
        