% NALOGA 1
podatki = importdata('naloga1_1.txt','',2);
t = podatki.data;

% NALOGA 2
fid = fopen('naloga1_2.txt', 'r');
header = fgetl(fid);
num_values = sscanf(header, 'stevilo_podatkov_P: %d');
P = zeros(num_values, 1);
for i = 1:num_values
    P(i) = fscanf(fid, '%f', 1);
end
fclose(fid);


figure;
plot(t, P, 'b-', 'LineWidth', 1.5);
xlabel('t [s]');
ylabel('P [W]');
title('graf P(t)');
grid on;





% NALOGA 3

integral_trap = 0;
for i = 1:length(P)-1
    dt = t(i+1) - t(i);
    integral_trap = integral_trap + (P(i) + P(i+1)) * dt / 2;
end

integral_builtin = trapz(t, P);
fprintf('Integral (lastna metoda): %.6f\n', integral_trap);
fprintf('Integral (trapz): %.6f\n', integral_builtin);
fprintf('Razlika: %.6e\n', abs(integral_trap - integral_builtin));