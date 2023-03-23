function blad = identA(X0)
load obiekt.mat;
y_rzecz = y;
clear y;
K = X0(1);
T = X0(2);
theta = X0(3);
%---------------------------------------- ------%
% tutaj kod, który będzie obliczał %
% odpowiedź skokową obiektu symulowanego %
% o takiej samej długości jak odpowiedź %
% obiektu rzeczywistego %
obiekt = tf([0 K],[T, 1], 'Inputdelay', theta);
[y_sym, t1] = step(obiekt, 1:60);
%---------------------------------------- ------%
e = y_rzecz - y_sym;
blad = sum(e.^2) / length(e);
end