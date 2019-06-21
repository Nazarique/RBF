
clear all
clc
rede = 'Iris';
qN = 5; %incremento de neuronios
Nm = 50; %qtdd maxima de neuronios
v = 1:(Nm/qN);
Dados = load('Iris.txt');
x = Dados(:,1:4);
d = Dados(:,5:end);
f = 'l';
for i=1:size(v,2)  
    rbf(i) = RBF(x, d, v(i)*qN, f);
end
 save('ResultadoIrisRBF_L.mat','rbf');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% clc
% rede = 'Iris';
% qN = 5; %incremento de neuronios
% Nm = 50; %qtdd maxima de neuronios
% v = 1:(Nm/qN);
% Dados = load('Iris.txt');
% x = Dados(:,1:4);
% d = Dados(:,5:end);
% f = 't';
% parfor i=1:size(v,2)  
%     rbf(i) = RBF(x, d, v(i)*qN, f);
% end
%  save('ResultadoIrisRBF_T.mat','rbf');

