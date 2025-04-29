clc; clear; close all

% Initial conditions
theta0 = 0.2;
omega0 = 0.0;
y0 = [theta0; omega0];
t_end = 100;

% Define dt range
dt_values = linspace(0.001, 0.5, 40);  % 10 values from 0.01 to 1
L2_errors_Explicit = zeros(size(dt_values));
L2_errors_Heun = zeros(size(dt_values));
L2_errors_RK = zeros(size(dt_values));
L2_errors_Implicit = zeros(size(dt_values));
L2_errors_CN = zeros(size(dt_values));

% ODE and exact solution
f = @(t, y) [y(2); -y(1)];
theta_exactF = @(t) theta0 * cos(t);

% Loop over dt values
for i = 1:length(dt_values)
    dt = dt_values(i);
    disp(i)

    % Explicit Euler
    disp("Euler")
    [t, y] = Explicit_Euler(f, y0, dt, t_end);
    theta_exact = theta_exactF(t);
    L2_errors_Explicit(i) = norm(y(:,1) - theta_exact');

    % Heun
    disp("Heun")
    [t, y] = Heun(f, y0, dt, t_end);
    theta_exact = theta_exactF(t);
    L2_errors_Heun(i) = norm(y(:,1) - theta_exact');

    % Runge-Kutta
    disp("Runge-Kutta")
    [t, y] = Runge_Kutta(f, y0, dt, t_end);
    theta_exact = theta_exactF(t);
    L2_errors_RK(i) = norm(y(:,1) - theta_exact');

    % Implicit Euler
    disp("Implicit Euler")
    [t, y] = Implicit_Euler(f, y0, dt, t_end);
    theta_exact = theta_exactF(t);
    L2_errors_Implicit(i) = norm(y(:,1) - theta_exact');

    % Crank-Nicolson
    disp("Crank-Nicolson")
    [t, y] = Crank_Nicolson(f, y0, dt, t_end);
    theta_exact = theta_exactF(t);
    L2_errors_CN(i) = norm(y(:,1) - theta_exact');
end

% Plot
figure; hold on
plot(dt_values, L2_errors_Explicit, 'o-', 'DisplayName', 'Explicit Euler','LineWidth',3)
plot(dt_values, L2_errors_Heun, 's-', 'DisplayName', 'Heun','LineWidth',3)
plot(dt_values, L2_errors_RK, '^-', 'DisplayName', 'Runge-Kutta','LineWidth',3)
plot(dt_values, L2_errors_Implicit, 'd-', 'DisplayName', 'Implicit Euler','LineWidth',3)
plot(dt_values, L2_errors_CN, 'x-', 'DisplayName', 'Crank-Nicolson','LineWidth',3)
xlabel('\Delta t')
ylabel('L_2 Norm of Error')
legend('Location', 'northwest')
title('L_2 Error vs Time Step Size')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
grid on
