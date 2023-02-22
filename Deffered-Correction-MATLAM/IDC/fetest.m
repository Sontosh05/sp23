clear all
close all
sigma=10; r=28; b=8/3;
u10=20; u20=5; u30=-5;
a=0; b=1;
N=160;

f=@(t, u) [sigma*(u(2)-u(1)); r*u(1)-u(2)-u(1)*u(3); u(1)*u(2)-b*u(3)];

[t, u]=ForwardEuler(f, a, b, N);

for i=1:N+1
    if mod(i, 100)==0
        plot3(u(1,:), u(2,:), u(3, :),'-b');
        axis([-20 30 -30 40 -10 60]); view([-13, 8]);
        xlabel('x'); ylabel('y'); zlabel('z');
        grid on
    end
end