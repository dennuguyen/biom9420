% MAIN FILE:
%   enzyme_kinetics_activity.m
% 
% CALLS:
%   plot_marble_transferase.m
%   marble_transferase_table.m
%   lineweaver_burk_plot.m
% 
% AUTHOR:
%   Dan Huy Nguyen (z5206032)
%   Completed on 23/06/2019
% 
% =========================== Enzyme Background ===========================
% Enzymes are catalysts which lowers the activation energy of reactions.
% Substrates (S) bind to the enzyme's active site to form the enzyme-substrate complex.
% Substrates become the product (P) of reaction.
% 
% Velocity of reaction is denoted by (V)
% Concentration is denoted by [ ]
% 
%         !!!As [S] increases, V increases to V_max asymptotically!!!
% 
% ======================= Michaelis-Menten Kinetics =======================
%   1. [enzyme] limits reaction
%   2. [enzyme] << [substrate]
%   3. enzyme activity is independent of other factors
%   4. enzyme reaction is irreversible
%   5. enzyme does not bind the product
%   6. [enzyme-substrate] reaches equilibrium faster than [S] or [P]
% 
%                       V = V_max * [S] /(K_m + [S])
% 
% Michaelis-Menten constant (K_m) is [S] where V = V_max / 2
% It is also a measure of affinity between enzyme and substrate; dissociation constant
% As K_m decreases, affinity increases, dissociation decreases


format compact

% Number of marbles transferred from substrate container = [S]
number_marbles = [0 5 10 15 20 25 30 40];

% Trial vectors have number of marbles transferred from substrate container
% in 10 seconds with respect to number of marbles in substrate container = [V]
% Marble Transferase 1
trial_1 = [0 5 7 8 7 6 9 9];
trial_2 = [0 5 9 8 11 10 8 12];
trial_3 = [0 4 9 10 10 13 13 11];
% Marble Transferase 2
trial_4 = [0 5 7 7 10 8 9 11];
trial_5 = [0 5 7 10 11 9 11 11];
trial_6 = [0 5 8 10 10 10 10 11];

% Plotting Marble Transferase 1
[fig(1), f] = plot_marble_transferase(1, number_marbles, trial_1, trial_2, trial_3);
% Plotting Marble Transferase 2
[fig(2), g] = plot_marble_transferase(2, number_marbles, trial_4, trial_5, trial_6);

% Plotting Lineweaver-Burk Plot 1
[fig(3), H] = lineweaver_burk_plot(1, number_marbles, trial_1, trial_2, trial_3);
% Plotting Lineweaver-Burk Plot 2
[fig(4), I] = lineweaver_burk_plot(2, number_marbles, trial_4, trial_5, trial_6);

% Getting Table of Enzyme Velocity & Michaelis-Menten Constant
F = coeffvalues(f);
G = coeffvalues(g);
[fig(5)] = marble_transferase_table(F, G, H, I);

% Saving Figures
fprintf('\n')
fprintf('Saving figures...\n')
hgsave(fig, 'enzyme_kinetic_activity.fig');

% Prompt to Close File
fprintf('\n')
fprintf('-------------------------------------------------\n')
fprintf('PRESS ANY KEY TO TERMINATE PROGRAM AND ITS MEMORY\n')
fprintf('-------------------------------------------------\n')
fprintf('\n')

% Wait for User Input
pause

% Close File
format
clear trial_1 trial_2 trial_3 trial_4 trial_5 trial_6 number_marbles f F g G H I fig
close(1, 2, 3, 4, 5)
