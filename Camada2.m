function [RBF] = Camada2(x, d, qNeuro, p, t, epocaMax, testeMax) %construtor, e inicializador 
     
     for k=1:testeMax
      clc
      qNeuro
      k
     [w1, var] = Camada1(x, d, qNeuro);
     w2 = rand(qNeuro+1,size(d,2)); %qNeuro + 1 por adição do bias
     w0 = w2;
     a = 0.5; %taxa mometum
     ExisteErro = 1; %variavel que impede loop infinito 
     Erro = 1;
     ErroAnterior = 0;
     ErroValMenor = 1;
     epoca = 0;% qtdd de vezes que a rede treinou 
        while (ExisteErro > 0)
            [xTreino, xTeste, xVal, dTreino, dTeste, dVal] = amostraRand(x, d); %mistura as amostras
            epoca = epoca + 1; % atribuindo valor a epoca
            ExisteErro = 0; % impedido loop infinito 
            if(abs(Erro - ErroAnterior) > p)% compara se a diferença de erro é maior que a precisao
                ErroAnterior = Erro;
                ExisteErro = ExisteErro+1;
        %foward
                gTreino = saida(xTreino, qNeuro, w1, var);
                gTreino = [-ones(size(gTreino,1),1) gTreino];
                y = gTreino*w2/(qNeuro+1); %saida da rede rbf
                Erro = ErroQuadMed(dTreino, y); %calcula erro quadrado medio
                pesoAnt = w2;
                w2 = w2 +a*(w2-w0)+ (gTreino'*t*(dTreino - y)); %corrige os valores dos pesos da segunda camada
                w0 = pesoAnt;
            %validação 
                gVal = saida(xVal, qNeuro, w1, var); %foward da RBF
                gVal = [-ones(size(gVal,1),1) gVal];
                yVal = gVal*w2/(qNeuro+1); %somatorio das entradas
                ErroVal = ErroQuadMed(dVal, yVal); %erro da validação
                
                if(ErroVal < ErroValMenor)
                    ErroValMenor = ErroVal; %armazenas os dados da validação
                    epocaIdeal = epoca;
                    wIdeal = w2;
                end
                if(epoca == 1)
                    ErroValMenor = ErroVal; %armazenas os dados da validação
                    epocaIdeal = epoca;
                    wIdeal = w2;
                end
                if (epoca > epocaMax) %impede que passe da epoca desejada
                    ExisteErro = 0;
                end
            end
        end
        %erros
            ErrosTreino(k) = Erro;
            ErrosValidacao(k) = ErroValMenor;
        %acertos Teste
           gTeste = saida(xTeste, qNeuro, w1, var); %foward
           gTeste = [-ones(size(gTeste,1),1) gTeste];
           yTeste = Sinal(gTeste*w2/(qNeuro+1)); %transforma a saida em 0 ou 1
           yTeste = Definicao(yTeste); % classica de acordo com a quantidade respostas
           dTeste = Definicao(dTeste);
           acertosT = find(~(dTeste-yTeste)); %encontra todos ou termos diferentes de 0
           acertosTeste(k) = sum(size(acertosT, 1))/size(dTeste,1); %acha a porcentagem de acertos da amostra
           
        %acertos Val
           acertosV = find(~(Definicao(dVal)-Definicao(Sinal(yVal))));
           acertosVal(k) = sum(size(acertosV, 1))/size(dVal,1);  %acha a porcentagem de acertos da amostra
     end 
            RBF.epocaMax = epoca;
            RBF.epocaIdeal = epocaIdeal;
            RBF.qNeuro = qNeuro;
            RBF.w1 = w1;
            RBF.w2 = wIdeal;
            RBF.TaxaAcertosTeste = acertosTeste;
            RBF.TaxaAcertosVal = acertosVal;
            RBF.ErrosVal = sum(ErrosValidacao)/testeMax;
            RBF.ErrosTreino = sum(ErrosTreino)/testeMax;
end
