function [fig, best_fit] = plot_marble_transferase(number, number_marbles, trial_a, trial_b, trial_c)

% PLOTTING OF MARBLE TRANSFERASE:
%   plot_marble_transferase.m
% 
% SENDS:
%   enzyme_kinetics_activity.m


% Trials Placed in Matrix
trial_matrix = [trial_a; trial_b; trial_c];

% Get the Trial Mean and Standard Deviation
trial_mean = mean(trial_matrix);
trial_std = std(trial_matrix);

% PLOTTING
fig = figure

% Plotting Error Bars and Data Points
errorbar(number_marbles, trial_mean, trial_std, 'o', 'MarkerEdgeColor', 'black')
axis([0 50 0 14])

% Curve of Best Fit
hold on

% Getting the Coefficients to a(1).*(1-exp(-x/a(2)))
x_limit = [0, 50];
a = lsqcurvefit(@(a, number_marbles) a(1).*(1-exp(-number_marbles/a(2))), x_limit, number_marbles, trial_mean);

% Fitting a(1).*(1-exp(-x/a(2))) to the Data Set
x = linspace(0, 50, 100);
y = a(1)*(1-exp(-x/a(2)));
log_fit_type = fittype('a1*(1-exp(-x/a2))', 'dependent', {'y'}, 'independent', {'x'}, ...
    'coefficients', {'a1', 'a2'});
best_fit = fit(x', y', log_fit_type, 'StartPoint', [1, 1]);
plot(best_fit, 'r')
hold off

% Plotting Asymptote
hold on
asymptote = @(x) a(1) + 1e-100*x; % BUG: Figure does not show horizontal plot
plot(x, asymptote(x), 'k--')
hold off

% Title, Label Axes
grid on
xlabel('Substrate Concentration, [S] (marbles/container)')
ylabel('Enzyme Velocity, V (marbles/10 seconds)')
legend('Location', 'southeast')
legend('Data Point with Error Bar', 'Curve of Best Fit', 'V_{max}')
title("Marble Transferase " + number)