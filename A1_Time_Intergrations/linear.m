clc; clear; close all

% Define parameters
theta0 = 0.2;
omega0 = 0.0;
y0 = [theta0; omega0];
dt = [0.125,0.25,0.5];
t_end = 100;

% ODE linear Pendulum
f = @(t, y) [y(2); -y(1)];

% Exact solution for comparison
theta_exactF = @(t) theta0 * cos(t);


%% For different methods

% Explicit_Euler
figure; hold on;
t = linspace(0,100,1001);
theta_exact = theta_exactF(t);
plot(t, theta_exact, 'r--');
for i = 1:length(dt)
    [t, y] = Explicit_Euler(f, y0, dt(i), t_end);
    plot(t, y(:, 1));
end
legend("Exact", "dt = 0.125", "dt = 0.25", "dt = 0.5")
xlabel('Time');
ylabel('\theta');
legend;
title("Explicit Euler")
grid on
ylim([-4 4])
    


% Heun
figure; hold on
t = linspace(0,100,1001);
theta_exact = theta_exactF(t);
plot(t, theta_exact, 'r--');
for i = 1:length(dt)
    [t, y] = Heun(f, y0, dt(i), t_end);
    plot(t, y(:, 1));
end
legend("Exact", "dt = 0.125", "dt = 0.25", "dt = 0.5")
xlabel('Time');
ylabel('\theta');
legend;
title("Heun")
grid on
ylim([-1 1])


% Runge Kutta
figure; hold on
t = linspace(0,100,1001);
theta_exact = theta_exactF(t);
plot(t, theta_exact, 'r--');
for i = 1:length(dt)
    [t, y] = Runge_Kutta(f, y0, dt(i), t_end);
    plot(t, y(:, 1));
end
legend("Exact", "dt = 0.125", "dt = 0.25", "dt = 0.5")
xlabel('Time');
ylabel('\theta');
legend;
title("Runge Kutta")
grid on
ylim([-0.4 0.4])


% Implicit Euler
figure; hold on
t = linspace(0,100,1001);
theta_exact = theta_exactF(t);
plot(t, theta_exact, 'r--');
for i = 1:length(dt)
    [t, y] = Implicit_Euler(f, y0, dt(i), t_end);
    plot(t, y(:, 1));
end
legend("Exact", "dt = 0.125", "dt = 0.25", "dt = 0.5")
xlabel('Time');
ylabel('\theta');
legend;
title("Implicit Euler")
grid on
ylim([-0.4 0.4])

% Crank Nicolson
figure; hold on
t = linspace(0,100,1001);
theta_exact = theta_exactF(t);
plot(t, theta_exact, 'r--');
for i = 1:length(dt)
    [t, y] = Crank_Nicolson(f, y0, dt(i), t_end);
    plot(t, y(:, 1));
end
legend("Exact", "dt = 0.125", "dt = 0.25", "dt = 0.5")
xlabel('Time');
ylabel('\theta');
legend;
title("Crank Nicolson")
grid on
ylim([-0.4 0.4])






%% For the same dt

figure; hold on
