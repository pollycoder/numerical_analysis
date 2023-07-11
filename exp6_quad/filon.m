



function integral_value = filon(func,a,b,N,n)
    h = (b - a) / (2 * N);
    theta = n * h;
    alpha = (theta.^2 + theta * sin(theta) * cos(theta) - 2 * sin(theta).^2) ...
         / power(theta, 3);
    beta = 2 * (theta * (1 + cos(theta).^2) - 2 * sin(theta) * cos(theta)) ...
        / power(theta, 3);
    gamma =  4 * (sin(theta) - theta * cos(theta)) / (power(theta, 3));

    s_2N = 0.5 * func(a) * sin(n * a) + 0.5 * func(b) * sin(n * b);
    s_2N_1 = 0.5 * func(a + h) * sin(n * (a + h));

    for i=1:N
        s_2N=s_2N+func(a + i * 2 * h) * sin(n * (a + i * 2 * h));
        s_2N_1=s_2N_1+func(a + (i * 2 + 1) * h)*sin(n*(a + (i * 2 + 1) * h));
    end
    integral_value=h * (alpha * (func(b) * cos(n * b) - func(a) * cos(n * a)) + beta * s_2N + gamma * s_2N_1);

end
