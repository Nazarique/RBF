function [rbf] = RBF(x, d, qNeuro, f)
     p = 10.^-8; %precisao
     t = 0.01; %taxa
     epocaMax = 500; %limita qtdd de epocas 
     testeMax = 10; %qtdd max de testes
     x = Normalizar(x);
    [rbf] = Camada2(x, d, qNeuro, p, t, epocaMax, testeMax, f);
end