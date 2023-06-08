function plot_animated_involute(x, y, start_t, end_t)
	step = 0.01;
	diff = @(f) @(t) (f(t + step) - f(t - step)) ./ (2 .* step);
    dx_dt = diff(x);
    dy_dt = diff(y);
	helper = @(t) sqrt(dx_dt(t) .^ 2 + dy_dt(t) .^ 2);
	multiplier = @(t) integral(helper, start_t, t) ./ helper(t);
  involute_x = @(t) x(t) - dx_dt(t) .* multiplier(t);
	involute_y = @(t) y(t) - dy_dt(t) .* multiplier(t);

	t = start_t:step:end_t;
	inv_values_x = zeros(1, length(t));
	inv_values_y = zeros(1, length(t));
	for i = 1:length(t)
		inv_values_x(i) = involute_x(t(i));
		inv_values_y(i) = involute_y(t(i));
	end
    figure;
    plot(x(t), y(t), 'b', 'LineWidth', 2);
    hold on;
    for i = 1:length(t)
          scatter(inv_values_x(i), inv_values_y(i), 'r', 'LineWidth', 2);
          pause(0.05);
    endfor
	hold off;
    axis equal;
    legend('curve', 'involute');
    xlabel('x');
    ylabel('y');
end
