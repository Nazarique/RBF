%  Na fun��o log�stica, usa-se [g]=Logistica(b,u)
% g � o valor de sa�da, b � o valor do coeficiente da fun��o e u � a
% vari�vel com os valores a ser passado pela fun��o.

function [y]=Logistica(u)
    b = 1;
    y = 1./(1.+exp(-b.*u)); % fun��o log�stica
end