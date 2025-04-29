function [t, y] = Implicit_Euler(f, y0, dt, t_end)
    t = 0:dt:t_end;
    n_steps = length(t);
    y = zeros(n_steps, length(y0));
    y(1, :) = y0(:)';  % Ensure row vector format

    options = optimoptions('fsolve', ...
        'Display', 'off', ...
        'FunctionTolerance', 1e-10, ...
        'StepTolerance', 1e-10);

    for i = 1:n_steps - 1
        % Current state as column vector
        y_current = y(i, :)';

        % Define residual for implicit Euler: F(yn+1) = yn+1 - yn - dt * f(tn+1, yn+1)
        F = @(yn1) yn1 - y_current - dt * f(t(i+1), yn1);

        % Use a good initial guess: explicit Euler step
        y_guess = y_current + dt * f(t(i), y_current);

        % Solve using fsolve
        yn1 = fsolve(F, y_guess, options);

        y(i+1, :) = yn1';  % Store result as row
    end
end
