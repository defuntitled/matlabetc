function [root_newton, root_bisection, root_fzero, difference] = find_roots(f, a, b)
  syms x
  fplot(f, [a,b])
  hold on

  % Newton's method
  f_diff = diff(symfun(f, x));
  f_sym = @(x) eval(vectorize(symfun(f, x)));
  f_diff_sym = @(x) eval(vectorize(symfun(f_diff, x)));
  root_newton = fzero(@(x) x - f_sym(x)/f_diff_sym(x), (a+b)/2);
  plot(root_newton, f_sym(root_newton), 'r*', 'MarkerSize', 10)

  % Bisection method
  eps = 1e-6;
  root_bisection = (a + b)/2;
  while ((b-a)/2 > eps)
    c = (a + b)/2;
    if f_sym(c) == 0
      root_bisection = c;
      break;
    elseif f_sym(c) * f_sym(a) < 0
      b = c;
    else
      a = c;
    end
    root_bisection = c;
  end
  plot(root_bisection, f_sym(root_bisection), 'g*', 'MarkerSize', 10)

  % fzero function
  root_fzero = fzero(f, (a+b)/2);
  plot(root_fzero, f_sym(root_fzero), 'b*', 'MarkerSize', 10)

  difference = [abs(root_newton - root_bisection), abs(root_newton - root_fzero), abs(root_bisection - root_fzero)];
  legend('f(x)', 'Newton', 'Bisection', 'fzero')
end
