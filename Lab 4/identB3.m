function blad = identB(X0)
load pomiary_3out.mat;
y_rzecz = pomiary_3out(:,3) - pomiary_3out(1,3);
clear y;
K = X0(1);
T1 = X0(2);
T2 = X0(3);
theta = X0(4);
%---------------------------------------- ------%
% tutaj kod, który będzie obliczał %
% odpowiedź skokową obiektu symulowanego %
% o takiej samej długości jak odpowiedź %
% obiektu rzeczywistego %
obiekt = tf([0 0 K],[T1*T2, T1+T2, 1], 'Inputdelay', abs(theta));
[y_sym, t1] = step(obiekt, 1:300);
%---------------------------------------- ------%
e = y_rzecz - y_sym;
blad = sum(e.^2) / length(e);
end