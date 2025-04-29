function [t, y] = Crank_Nicolson(f, y0, dt, t_end)
    t = 0:dt:t_end;
    n_steps = length(t);
    y = zeros(n_steps, length(y0));
    y(1, :) = y0(:)';  % ensure row vector

    for i = 1:n_steps-1
        % Define the function for fsolve: residual of Crank-Nicolson
        F = @(yn1) yn1 - y(i,:)' - dt/2 * (f(t(i), y(i,:)') + f(t(i+1), yn1));

        % Use explicit Euler step as initial guess
        y_guess = y(i,:)' + dt * f(t(i), y(i,:)');

        % Solve nonlinear system
        options = optimoptions('fsolve','Display','off','FunctionTolerance',1e-4);
        yn1 = fsolve(F, y_guess, options);

        y(i+1,:) = yn1';  % store as row
    end
end
