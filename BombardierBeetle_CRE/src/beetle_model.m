% beetle_model.m
% Chemical Reaction Engineering model of Bombardier Beetle defense mechanism
% Guided by Prof. Sonali Das (Mar’24–May’24)

% Reaction scheme simplified:
% H2O2 + Hydroquinone --> p-Benzoquinone + H2O (exothermic, rapid)
% Heat generation modeled via energy balance

% Define parameters
k = 1.5;           % reaction rate constant
Ea = 55000;        % activation energy (J/mol)
R = 8.314;         % gas constant
Cp = 75;           % heat capacity (J/mol-K)
rho = 1000;        % density (mol/m^3)
T0 = 298;          % initial temperature (K)
C0 = [2; 2];       % initial concentrations [H2O2; Hydroquinone] mol/L

% ODE system
function dCdt = beetle_odes(t, C)
    H2O2 = C(1);
    HQ = C(2);
    T = C(3);
    k_eff = k * exp(-Ea/(R*T));
    r = k_eff * H2O2 * HQ;
    dH2O2 = -r;
    dHQ = -r;
    dT = (r*50000)/(rho*Cp); % Heat released
    dCdt = [dH2O2; dHQ; dT];
end

% Initial conditions [H2O2; HQ; Temperature]
y0 = [C0(1); C0(2); T0];

% Solve ODEs
[t,y] = ode45(@beetle_odes, [0 5], y0);

% Plot results
figure;
subplot(2,1,1);
plot(t, y(:,1), 'r', t, y(:,2), 'b', 'LineWidth', 1.5);
xlabel('Time (s)'); ylabel('Concentration (mol/L)');
legend('H2O2','Hydroquinone');
title('Substrate Consumption in Beetle Reaction');

subplot(2,1,2);
plot(t, y(:,3), 'k', 'LineWidth', 1.5);
xlabel('Time (s)'); ylabel('Temperature (K)');
title('Temperature Rise in Beetle Chamber');

saveas(gcf, 'reaction_plots.png');
