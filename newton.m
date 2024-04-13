x_values = input('Enter x values :');
f_values = input('Enter y values :');

% Create divided-differences table
n = length(x_values);
F = zeros(n, n);
F(:,1) = f_values';


for j = 2:n
    for i = j:n
        F(i,j) = (F(i,j-1) - F(i-1,j-1)) / (x_values(i) - x_values(i-j+1));
    end
end

% Coefficients for the interpolating polynomial
coefficients = F(n, :);

% Construct the interpolating polynomial
syms x;
polynomial = coefficients(1);
for i = 2:n
    term = coefficients(i);
    for j = 1:i-1
        term = term * (x - x_values(j));
    end
    polynomial = polynomial + term;
end

% Display the polynomial
disp('Interpolating Polynomial:');
disp(polynomial);


z = input('check point z: ');


% Estimate f(4.5) using the polynomial
estimated_value = subs(polynomial,z);

disp('Estimated f(z):');
disp(estimated_value);