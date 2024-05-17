//Inserir novo colaborador

INSERT INTO BRH.PAPEL (ID, NOME) 
VALUES (8, 'Especialista de Negocios');

INSERT INTO BRH.ENDERECO (cep, uf, cidade, bairro)
VALUES ('00000-008', 'SP', 'São Paulo', 'Bela Vista');

INSERT INTO BRH.COLABORADOR (matricula, nome, cpf, salario, departamento, cep, logradouro, complemento_endereco) 
VALUES ('A112', 'Fulano de Tal', '000.000.008-88', 5000, 'DIR', '00000-008', 'Rua Genebra', 'Ap 411A');

INSERT INTO BRH.TELEFONE_COLABORADOR (colaborador, numero, tipo)
VALUES ('A112', '(61) 9 9999-9999', 'M');

INSERT INTO BRH.TELEFONE_COLABORADOR (colaborador, numero, tipo)
VALUES ('A112', '(61) 3030-4040', 'R');

INSERT INTO BRH.EMAIL_COLABORADOR (colaborador, email,tipo) 
VALUES ('A112', 'fulano@email.com', 'P');

INSERT INTO BRH.EMAIL_COLABORADOR (colaborador, email,tipo) 
VALUES ('A112', 'fulano.tal@brh.com', 'T');

INSERT INTO BRH.DEPENDENTE (cpf, colaborador, nome, parentesco, data_nascimento) 
VALUES ('000.000.088-88', 'A112', 'Beltrana de Tal', 'Cônjuge', TO_DATE('1976-04-16', 'yyyy-mm-dd'));

INSERT INTO BRH.DEPENDENTE (cpf, colaborador, nome, parentesco, data_nascimento) 
VALUES ('000.000.888-88', 'A112', 'Beltraninha de Tal', 'Filho(a)', TO_DATE('2012-04-23', 'yyyy-mm-dd'));

INSERT INTO BRH.PROJETO (nome, responsavel, inicio, fim) 
VALUES ('Business Inteligent', 'U123', TO_DATE('2024-05-01', 'yyyy-mm-dd'), NULL);

INSERT INTO BRH.ATRIBUICAO (projeto, colaborador, papel) 
VALUES (5, 'A112', 8);

COMMIT;


//Relatorio de Conjugues
SELECT BRH.COLABORADOR.MATRICULA, BRH.DEPENDENTE.NOME, BRH.DEPENDENTE.DATA_NASCIMENTO, BRH.DEPENDENTE.PARENTESCO FROM  BRH.COLABORADOR
INNER JOIN BRH.DEPENDENTE ON BRH.COLABORADOR.MATRICULA = BRH.DEPENDENTE.COLABORADOR WHERE BRH.DEPENDENTE.PARENTESCO = 'Cônjuge';


//Relatório de contatos telefônicos
SELECT BRH.TELEFONE_COLABORADOR.COLABORADOR, BRH.TELEFONE_COLABORADOR.NUMERO, BRH.TELEFONE_COLABORADOR.TIPO FROM BRH.TELEFONE_COLABORADOR;

//Listar colaborador com maior salário
SELECT BRH.COLABORADOR.MATRICULA, BRH.COLABORADOR.NOME, BRH.COLABORADOR.SALARIO 
FROM BRH.COLABORADOR WHERE SALARIO = (SELECT MAX(salario) FROM brh.colaborador);
