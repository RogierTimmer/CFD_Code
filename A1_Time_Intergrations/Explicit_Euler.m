function [t,y] = Explicit_Euler(f, y0,dt,t_end)
    t = 0:dt:t_end;
    n_steps = length(t);
    y = zeros(n_steps, length(y0));
    y(1, :) = y0;

    for i = 1:n_steps-1
        y(i+1, :) = y(i, :) + dt * f(t(i), y(i, :)')';
    end
end