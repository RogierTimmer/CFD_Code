function [t, y] = Heun(f, y0, dt, t_end)
    t = 0:dt:t_end;
    n_steps = length(t);
    y = zeros(n_steps, length(y0));
    y(1, :) = y0;

    for i = 1:n_steps-1
        k1 = f(t(i), y(i, :)')';
        y_predictor = y(i, :) + dt * k1;
        k2 = f(t(i+1), y_predictor')';
        y(i+1, :) = y(i, :) + 0.5 * dt * (k1 + k2);
    end
end