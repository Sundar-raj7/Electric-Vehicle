%%Basic Arithmetic Operations:

%Perform simple arithmetic oprations:

%Addition 
a = 5;
b = 3;
sumResult = a + b;

% Subtraction
subResult = a - b;

% Multiplication
mulResult = a * b;

% Division
divResult = a / b;

%%Use built-in functions like sqrt, abs, and round.

%sqrt

sqrtResult = sqrt(sumResult);

%abs
absResult = abs(subResult);

%round
roundedResult = round(divResult);

fprintf('Sum: %d\n', sumResult);
fprintf('Subtraction: %d\n', subResult);
fprintf('Multiplication: %d\n', mulResult);
fprintf('Division: %.2f\n', divResult);
fprintf('Square Root: %.2f\n', sqrtResult);
fprintf('Absolute Value: %d\n', absResult);
fprintf('Rounded Value: %d\n', roundedResult);