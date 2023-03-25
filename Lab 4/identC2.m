function blad = identC(X0)
load pomiary_3out.mat
K = X0(1);
T = X0(2);
y = pomiary_3out(:,2) - pomiary_3out(1,2);
global n; 
t=1:300; 
for i=1:n %wektor biegunów transmitancji
    A(i)=-1/T;
end
model=zpk([],A,K/T^n); 
y_sym=step(model,t);
e = y-y_sym;
blad = sum(e.^2) / length(e);