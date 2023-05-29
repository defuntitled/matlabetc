function plot_surface_and_normal(f, point,mesh_range)
  [X,Y] = meshgrid([mesh_range(1,:),mesh_range(2,:)]);
  Z = f(X,Y);
  surf(X,Y,Z);
  [gx, gy] = gradient(Z);
  g = [gx((point(2)-mesh_range(2,1))*2,(point(1)-(mesh_range(1,1))*2)), gy((point(2)-mesh_range(2,1))*2,(point(1)-(mesh_range(1,1))*2)), -1];
  normal = g;
  hold on;
  quiver3(point(1), point(2), f(point(1), point(2)), normal(1), normal(2), normal(3), 'r', 'LineWidth', 2);
  xlabel("x");
  ylabel("y");
  axis equal;
  xlim([-10,10]);
  ylim([-10,10]);
  zlim([-10,10]);
  hold off;
endfunction

