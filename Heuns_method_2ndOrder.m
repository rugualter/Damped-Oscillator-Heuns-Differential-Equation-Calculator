% Clears all data and screen
clear all;
close all;
clc;

%mass m (0.5)
m = input('Enter the value of spring-couple mass (m): ');
%dissipative parameter (3)
b = input('Enter the value of dissipative parameter (b): ');
%elastic constant (100)
k = input('Enter the value of elastic constant (k): ');
%natural frequency of oscillation equation
w = sqrt(k/m);
%printing in console the value of natural frequency of oscillation
fprintf('\nThe value of natural frequency of oscillation is: %4.3f\n',w);


% Entering the working equations
f1 = @(t,x,y) y;
f2 = @(t,x,y) -(b/m)*y-(w^2)*x;

%starting time of the analysis
t0 = input('Enter the starting time of the analysis: ' );
%end time of the analysis
tn = input('Enter the end time of the analysis: ' );
%initial condition of the differential equation x(0)=x0
x0 = input('Enter the initial condition x0=x(0): ' );
%initial condition of the differential equation x'(0)=y0
y0 = input('Enter the initial condition y0=x`(0): ' );

%step value
h = input('Enter step value for the Heuns method: ');

% Number of iterations
n = (tn-t0)/h;
%printing in console the number of iterations
fprintf('\nThe number of iterations: %6.0f\n',n);

disp('Time(t)     x(i)');
%Iteration code block for Heun's Method
for i = 1:n+1       %for statement starting from 1 to n+1
    %displaying table of values of time(i) and x(i)
    fprintf('\n%4.5f     %4.5f',t0,x0);
    %Code block that uses the Heun's Method algorithm
    k1x = f1(t0,x0,y0);
    k1y = f2(t0,x0,y0);
    k2x = f1(t0+h,x0+h*k1x,y0+h*k1y);
    k2y = f2(t0+h,x0+h*k1x,y0+h*k1y);
    x1 = x0 + 0.5*(k1x+k2x)*h;
    y1 = y0 + 0.5*(k1y+k2y)*h;
    %Saving time interval values
    time(i) = t0;
    %Saving solution x(t) values
    xvalue(i) = x1;
    x0 = x1;        %saving x(i) values to the next iteration
    y0 = y1;        %saving y(i) values to the next iteration
    t0 = t0+h;      %incrementing t(i) values by h to the next interation
end

%plotting the solution of differential equation time vs x(t)
plot(time,xvalue);          %plotting command
title('Graph of the solution of Damped Oscillator using Heun`s Method');
xlabel('Time t')            %creating x-axis label
ylabel('Value of x');       %creating y-axis label
grid on;                    %activating grid of the plot

%displaying the solution x(t) at tn value
fprintf('\nThe solution when x(%4.1f)= %4.5f\n.',time(end), xvalue(end));