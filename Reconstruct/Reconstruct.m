clear, clc
load healthy.mat
H = table2array(healthy);
omega = 2*pi*H(:,1);
fmin = min(H(:,1));
minDAQ = 10;
tmax = minDAQ/fmin;
fmax = max(H(:,1));
dt = tmax/(minDAQ * fmax);
t = 0:dt:tmax;
Y = zeros(size(t));
A = abs(H(:,2));
phi0 = H(:,3)*pi/180;
for i = 1:size(t,2)
    Theta = omega*t(1,i) + phi0;
    Y_re = A.*cos(Theta);
    Y_im = (1i*A).*sin(Theta);
    Y(i) = sum(Y_re) + sum(Y_im);
end
plot(t,real(Y))
