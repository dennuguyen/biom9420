function [fig] = marble_transferase_table(F, G, H, I)

% TABLE OF V_max AND K_m:
%   marble_transferase_table.m
% 
% SENDS:
%   enzyme_kinetics_activity.m


% Maximum Enzyme Velocity
% V_max from plot_marble_transferase.m
V_max_PMT = {num2str(F(1)) num2str(G(1))};
V_max_PMT = strcat(V_max_PMT, '  (marbles/10 seconds)');
% V_max from lineweaver_burk_plot.m
V_max_LBP = {num2str(H(1)) num2str(I(1))};
V_max_LBP = strcat(V_max_LBP, '  (marbles/10 seconds)');

% Michaelis_Menten Constant
% K_m from plot_marble_transferase.m
K_m_PMT = {num2str(F(2)) num2str(G(2))};
K_m_PMT = strcat(K_m_PMT, '    (marbles/container)');
% K_m from lineweaver_burk_plot.m
K_m_LBP = {num2str(F(2)) num2str(G(2))};
K_m_LBP = strcat(K_m_LBP, '    (marbles/container)');

% Creating Table
fig = figure('Color', [1 1 1], ...
    'OuterPosition', [802.3333, 865, 667.6667, 267.3333]);

% Displaying Table in Figure
uitable('Data', [[V_max_PMT(:) V_max_LBP(:)]'; [K_m_PMT(:) K_m_LBP(:)]'], ...
    'ColumnName', ["Marble Transferase 1", "Marble Transferase 2"], ...
    'ColumnWidth', {189 189}, ...
    'RowName', ["V_max, V vs [S]", "V_max, 1/V vs 1/[S]", ...
    "K_m, V vs [S]", "K_m, 1/V vs 1/[S]"], ...
    'BackgroundColor', [1 1 1], ...
    'OuterPosition', [32, 24.3333333333333, 594.3333333333333, 93]);

% Creating Title
annotation(fig, ...
    'textbox', [0.334211444596769, 0.707083458474717, 0.380371660859466, 0.215962441314554], ...
    'String', {'Marble Transferase Table'}, ...
    'FontWeight', 'bold', ...
    'FontSize', 12, ...
    'FontName', 'SansSerif', ...
    'EdgeColor', 'none');