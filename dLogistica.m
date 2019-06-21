% Derivada da fun��o log�stica [gl]=dLogistica(b,u)
% Atrav�s da derivada da fun��o log�stica, gl � a derivada, b o coeficiente
% e u � a entrada da fun��o.
function [y]=dLogistica(u)
    b = 1;
    y = (b.*exp((-b.*u)))./((1+exp((-b.*u))).^2);
end
