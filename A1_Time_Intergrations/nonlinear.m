clc; clear; close all

% Define parameters
theta0 = [0.2, 1.0];
omega0 = 0.0;
dt = 0.125;
t_end = 100;

% ODE non linear Pendulum
f = @(t, y) [y(2); -sin(y(1))];

% Linearized exact solution for comparison
theta_exactF = @(t,theta0) theta0 * cos(t);


%% For different methods

% Explicit_Euler
figure; hold on;
t = linspace(0,100,1001);
for i = 1:length(theta0)
	theta_exact = theta_exactF(t,theta0(i));
	plot(t, theta_exact, '--');
	y0 = [theta0(i); omega0];
    [t, y] = Explicit_Euler(f, y0, dt, t_end);
    plot(t, y(:, 1));
end
legend("Linearized exact for theta0 = 0.2", "theta0 = 0.2", "Linearized exact for theta0 = 1.0", "theta0 = 1.0")
xlabel('Time');
ylabel('\theta');
legend;
title("Explicit Euler")
grid on
ylim([-4 4])
    


% Heun
figure; hold on;
t = linspace(0,100,1001);
for i = 1:length(theta0)
	theta_exact = theta_exactF(t,theta0(i));
	plot(t, theta_exact, '--');
	y0 = [theta0(i); omega0];
    [t, y] = Heun(f, y0, dt, t_end);
    plot(t, y(:, 1));
end
legend("Linearized exact for theta0 = 0.2", "theta0 = 0.2", "Linearized exact for theta0 = 1.0", "theta0 = 1.0")
xlabel('Time');
ylabel('\theta');
legend;
title("Heun")
grid on
ylim([-1.5 1.5])


% Runge Kutta
figure; hold on;
t = linspace(0,100,1001);
for i = 1:length(theta0)
	theta_exact = theta_exactF(t,theta0(i));
	plot(t, theta_exact, '--');
	y0 = [theta0(i); omega0];
    [t, y] = Runge_Kutta(f, y0, dt, t_end);
    plot(t, y(:, 1));
end
legend("Linearized exact for theta0 = 0.2", "theta0 = 0.2", "Linearized exact for theta0 = 1.0", "theta0 = 1.0")
xlabel('Time');
ylabel('\theta');
legend;
title("Runge Kutta")
grid on
ylim([-1.5 1.5])


% Implicit Euler
figure; hold on;
t = linspace(0,100,1001);
for i = 1:length(theta0)
	theta_exact = theta_exactF(t,theta0(i));
	plot(t, theta_exact, '--');
	y0 = [theta0(i); omega0];
    [t, y] = Implicit_Euler(f, y0, dt, t_end);
    plot(t, y(:, 1));
end
legend("Linearized exact for theta0 = 0.2", "theta0 = 0.2", "Linearized exact for theta0 = 1.0", "theta0 = 1.0")
xlabel('Time');
ylabel('\theta');
legend;
title("Implicit Euler")
grid on
ylim([-1.5 1.5])

% Crank Nicolson
figure; hold on;
t = linspace(0,100,1001);
for i = 1:length(theta0)
	theta_exact = theta_exactF(t,theta0(i));
	plot(t, theta_exact, '--');
	y0 = [theta0(i); omega0];
    [t, y] = Crank_Nicolson(f, y0, dt, t_end);
    plot(t, y(:, 1));
end
legend("Linearized exact for theta0 = 0.2", "theta0 = 0.2", "Linearized exact for theta0 = 1.0", "theta0 = 1.0")
xlabel('Time');
ylabel('\theta');
legend;
title("Crank Nicolson")
grid on
ylim([-1.5 1.5])