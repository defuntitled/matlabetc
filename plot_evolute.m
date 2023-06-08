function plot_evolute(x, y, t)
    x_values = x(t);
    y_values = y(t);

    dx_dt = gradient(x_values, t);
    dy_dt = gradient(y_values, t);

    d2x_dt2 = gradient(dx_dt, t);
    d2y_dt2 = gradient(dy_dt, t);

	  curv = (dx_dt .^ 2 + dy_dt .^ 2) ./ (dx_dt .* d2y_dt2 - d2x_dt2 .* dy_dt);

    figure;

    p = plot(x_values, y_values, 'b', 'LineWidth', 2);
    hold on;
    for i=1:length(t)
      scatter(x_values(i) - curv(i) .* dy_dt(i), y_values(i) + curv(i) .* dx_dt(i), 'r', 'LineWidth', 2);
      pause(0.05);
    endfor
    hold off;

    title('curve & evolute');
    xlabel('x');
    ylabel('y');
    legend('curve', 'evalute');
	axis equal;
end
