function plot_animated_involute(curve)
  t = linspace(0, 2*pi, 100);  % параметризация кривой
  x = curve(t)';
  dx = gradient(x);  % первая производная
  ddx = gradient(dx);  % вторая производная

  % построение графика кривой
  plot(x(:,1), x(:,2), 'b', 'LineWidth', 1);
  hold on;

  % построение эвольвенты порциями (по 10 точек за раз)
  step = 10;
  for i = 1:step:length(t)-step
    K = (dx(i:i+step-1,1).*ddx(i:i+step-1,2) - ...
         dx(i:i+step-1,2).*ddx(i:i+step-1,1)) ./ ...
        (dx(i:i+step-1,1).^2 + dx(i:i+step-1,2).^2).^0.5;
    inv_x = x(i:i+step-1,1) - dx(i:i+step-1,2) ./ K;
    inv_y = x(i:i+step-1,2) + dx(i:i+step-1,1) ./ K;

    h = plot(inv_x, inv_y, 'r', 'LineWidth', 1.5);
    pause(0.05);
    delete(h);
  end

  hold off;
endfunction

