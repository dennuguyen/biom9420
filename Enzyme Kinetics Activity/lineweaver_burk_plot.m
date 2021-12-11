function [fig, output] = lineweaver_burk_plot(number, number_marbles, trial_a, trial_b, trial_c)

% LINEWEAVER-BURK PLOT:
%   lineweaver_burk_plot.m
% 
% SENDS:
%   enzyme_kinetics_activity.m


% Trials Placed in Matrix
trial_matrix = [trial_a; trial_b; trial_c];

% Get the Trial Mean
trial_mean = mean(trial_matrix);

% Invert the Enzyme Velocity and Substrate Concentration
inverse_number = 1./number_marbles;
inverse_mean = 1./trial_mean;

% Remove Inf
inverse_number(any(isinf(inverse_number), 'all')) = [];
inverse_mean(any(isinf(inverse_mean), 'all')) = [];

% PLOTTING
fig = figure
scatter(inverse_number, inverse_mean, 'x', 'b')
axis([-0.14, 0.22, 0, 0.24])

% Line of Best Fit
hold on

% Getting Coefficients to a(1)*x + a(2)
x_lim = linspace(-0.14, 0.22, 7);
a = polyfit(inverse_number, inverse_mean, 1);

% Plotting a(1)*x + a(2)
y = polyval(a, x_lim);
plot(x_lim, y, 'r')
hold off

% % Title, Label Axes
grid on
xlabel('1/[S] (container/marbles)')
ylabel('1/V (10 seconds/marbles)')
legend('Location', 'southeast')
legend('Data Point', 'Line of Best Fit')
title("Lineweaver-Burk Plot of Marble Tranferase " + number)

% Maximum Enzyme Velocity
% y(0) = a(2) is the y-intercept
V_max = 1/a(2);

% Michaelis_Menten Constant
range = -0.14:0.00001:0;
[~, index] = min(abs(y - 0));
x_int = range(index);
K_m = -1/x_int;

% Create Output
output = [V_max K_m];
