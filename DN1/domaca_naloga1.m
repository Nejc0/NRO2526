% NALOGA 1
podatki = importdata('naloga1_1.txt','',2);
t = podatki.data;

% NALOGA 2
datoteka = fopen('naloga1_2.txt', 'r');
prva_vrstica = fgetl(datoteka);
podatki = sscanf(prva_vrstica, 'stevilo_podatkov_P: %d');
P = zeros(podatki, 1);
for i = 1:podatki
    P(i) = fscanf(fid, '%f', 1);
end
fclose(datoteka);


figure;
plot(t, P, 'r-', 'LineWidth', 2);
xlabel('t [s]');
ylabel('P [W]');
title('graf P(t)');
grid on;





% NALOGA 3

vsota = 0;
for i = 1:length(P)-1
    cas_povp = t(i+1) - t(i);
    moc_povp = (P(i) + P(i+1)) / 2;
    vsota = vsota + cas_povp * moc_povp;
end
trapezna = trapz(t, P);
fprintf('Integral (lastna metoda): %.6f\n', vsota);
fprintf('Integral (trapz): %.6f\n', trapezna);
fprintf('Razlika: %.6e\n', abs(vsota - trapezna));