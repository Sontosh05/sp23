clear all
close all

n=5;
A=rand(n, n);
A=A+A'; % Symmetric Matrix
B=rand(n, n);
B=B*B'; %Positive semidefinite Matric
delta=0.4; % delta
g=rand(n); % vector g

p=Optimization(A, B, g, delta, n)

