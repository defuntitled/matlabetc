pendulum.m = 1;
pendulum.l = 1;

theta0 = pi/4;

tspan = [0, 10];

function [t, theta] = pendul2(pendulum, theta0, tspan)


    m = pendulum.m;
    l = pendulum.l;
    g = 9.81;

    pendulum_eq = @(t, y) [y(2); -(g/l)*sin(y(1))];

    [t, y] = ode45(pendulum_eq, tspan, [theta0, 0]);

    x = l*sin(y(:, 1));
    y = -l*cos(y(:, 1));

    x = [0; x];
    y = [0; y];

    theta = [x, y];
end


[t, theta] = pendul2(pendulum, theta0, tspan);

figure;
axis equal;
for i = 1:length(t)
    plot(theta(i, 1), theta(i, 2), 'o');
    hold on;
    plot(theta(1:i, 1), theta(1:i, 2));
    hold off;
    axis([-1.5 1.5 -1.5 0.5]);
    drawnow;
end


pendulum.m = 1;
pendulum.l = 1;

theta0 = pi/4;

tspan = [0, 10];

[t, theta] = pendul2(pendulum, theta0, tspan);

figure;
axis equal;
for i = 1:length(t)
    plot(theta(i, 1), theta(i, 2), 'o');
    hold on;
    plot(theta(1:i, 1), theta(1:i, 2));
    hold off;
    axis([-1.5 1.5 -1.5 0.5]);
    drawnow;
end

