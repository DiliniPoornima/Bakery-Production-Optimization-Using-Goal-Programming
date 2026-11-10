
clc;
clear;

% Equality constraint matrix
Aeq = [
    30 10 1 -1 0 0 0 0 0 0;
    90 17 0 0 1 -1 0 0 0 0;
    1/650 1/2000 0 0 0 0 1 -1 0 0;
    1/500 1/1800 0 0 0 0 0 0 1 -1
];

% Right-hand side
beq = [1400000; 1925000; 70; 84];

% Objective function coefficients
f = [0; 0; 1; 0; 0; 1; 0; 1; 0; 1];

% Lower bounds
lb = zeros(10,1);

% Upper bounds
ub = [];

% Solve using linear programming
[x, fval] = linprog(f, [], [], Aeq, beq, lb, ub);

% Extract optimal production levels
x_solution = x(1:2);

% Extract deviation variables
deviations = x(3:end);

% Display results
disp('Optimal Production Levels:');
disp(['Bread: ', num2str(x_solution(1))]);
disp(['Buns: ', num2str(x_solution(2))]);

disp('Deviations from Goals:');
disp(deviations);

disp('Objective Function Value:');
disp(fval);
