% Training: Norm1 Table Columns
AT = Norm(:, 1);
V = Norm(:, 2);
AP = Norm(:, 3);
Y =  Norm(:, 4);

% 1 Input (n = 1)
I1 = zeros(2, 3);
% Models 1 - 3
for i = 1:3
    X1 = ones(7654, 2);
    X1(:, 2) = Norm(:, i);
    I1(:, i) = mldivide(X1, Y);
end
disp("1 Input, Models 1 - 3:");
disp(I1);

% 2 Inputs (n = 2)
I2 = zeros(3, 3);
X2 = ones(7654, 3);
% Model 4
X2(:, 2) = AT;
X2(:, 3) = V;
I2(:, 1) = mldivide(X2, Y);
% Model 5
X2(:, 2) = V;
X2(:, 3) = AP;
I2(:, 2) = mldivide(X2, Y);
% Model 6
X2(:, 2) = AP;
X2(:, 3) = AT;
I2(:, 3) = mldivide(X2, Y);
disp("2 Inputs, Models 4 - 6:");
disp(I2);

% 3 Inputs (n = 3)
I3 = zeros(4, 1);
% Model 7
X3 = ones(7654, 4);
X3(:, 2) = AT;
X3(:, 3) = V;
X3(:, 4) = AP;
I3(:, 1) = mldivide(X3, Y);
disp("3 Inputs, Model 7:");
disp(I3);

% Testing: Test Table Columns
T_AT = Test(:, 1);
T_V = Test(:, 2);
T_AP = Test(:, 3);
T_Y =  Test(:, 4);
% Model Equations
M1 = I1(1, 1) + I1(2, 1)*T_AT;
M2 = I1(1, 2) + I1(2, 2)*T_V;
M3 = I1(1, 3) + I1(2, 3)*T_AP;

M4 = I2(1, 1) + I2(2, 1)*T_AT + I2(3, 1)*T_V;
M5 = I2(1, 2) + I2(2, 2)*T_V + I2(3, 2)*T_AP;
M6 = I2(1, 3) + I2(2, 3)*T_AP + I2(3, 3)*T_AT;

M7 = I3(1, 1) + I3(2, 1)*T_AT + I3(3, 1)*T_V + I3(3, 1)*T_AP;
% Compare
T = table(M1, M2, M3, M4, M5, M6, M7);
writetable(T, 'NewResults.xlsx');
