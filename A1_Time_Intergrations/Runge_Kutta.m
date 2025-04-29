function [t, y] = Runge_Kutta(f, y0, dt, t_end)
    t = 0:dt:t_end;
    n_steps = length(t);
    y = zeros(n_steps, length(y0));
    y(1, :) = y0;

    for i = 1:n_steps-1
        yi = y(i, :)';  % Convert to column vector
        k1 = f(t(i), yi);
        k2 = f(t(i) + dt/2, yi + dt/2 * k1);
        k3 = f(t(i) + dt/2, yi + dt/2 * k2);
        k4 = f(t(i) + dt, yi + dt * k3);
        yi_next = yi + (dt/6) * (k1 + 2*k2 + 2*k3 + k4);
        y(i+1, :) = yi_next';  % Convert back to row vector
    end
end
