
clear all
clc
rede = 'vinho'
qN = 5; %incremento de neuronios
Nm = 5; %qtdd maxima de neuronios
v = 1:(Nm/qN);
Dados = load('DadosVinho.mat');
Dados = Dados.x;
x = Dados(:,1:13);
d = Dados(:,14:end);

for i=1:size(v,2)  
    rbf(i) = RBF(x, d, v(i)*qN);
end
save('ResultadoVinhoRBF.mat','rbf');

% 
% clear all
% clc
% rede = 'banco'
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% v = 1:(Nm/qN);
% Dados = load('bank_dados.txt');
% x = Dados(:,1:(end-1));
% d = Dados(:,end);
% 
% for i=1:size(v,2)  
%     rbf(i) = RBF(x, d, v(i)*qN);
% end
% save('ResultadoBankRBF.mat','rbf');
% 
% clear all
% clc
% rede = 'Iris'
% qN = 5; %incremento de neuronios
% Nm = 100; %qtdd maxima de neuronios
% v = 1:(Nm/qN);
% Dados = load('Iris.txt');
% x = Dados(:,1:4);
% d = Dados(:,5:end);
% for i=1:size(v,2)  
%     rbf(i) = RBF(x, d, v(i)*qN);
% end
%  save('ResultadoIrisRBF.mat','rbf');
% 
