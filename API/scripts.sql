create database sperifa
default character set utf8mb4;


-- Selecionando
use sperifa;

-- Cria tabela principal
create table locais (                             
    id int not null auto_increment PRIMARY KEY,
    data_post datetime default CURRENT_TIMESTAMP,
    titulo varchar(100), 
    descricao varchar(1500),
    horario_funcionamento varchar(170),
    valor varchar(20),
    localizacao varchar(150),
    contato varchar(50),
    latitude float,
    longitude float
) default character set utf8mb4 ;


-- Insere os dados inciais
insert into locais (titulo, descricao, horario_funcionamento, valor, localizacao, contato, latitude, longitude) values 
	(
        "Cooperifa", 
        "Uma das principais iniciativas do movimento cultural e literário das periferias nos últimos anos, com a participação de diversos artistas e escritores do extremo sul de São Paulo.", 
        "Sem informações", 
        "Gratuito", 
        "Bar do Zé Batidão - Rua Bartolomeu do Santos, 797 - Jardim Guaruja",
        "fecebook.com/cooperifaoficial",
        "-23.66892901965522",
        "-46.74508805219689"
    ),
    (
        "Danca Narrativa", 
        "Com participação do grupo de Londres Esprit Concrete, a Coletiva Oyasis - Mulheres bufálo está ministrando oficinas e workshops online e gratuitos sobre movimentação corporal enquanto ferramenta de liberdade de expressão e autoconhecimento.", 
        "Sem informações",
        "Gratuito",
        "Rua Henriqueta Noguez Brieba, 281 - Conj. Hab. Fazenda do Carmo - Cidade Tiradentes",
        "Comunicacao@bienal.org.br",
        "-23.56858460710392",
        "-46.418339775502844"
    )
;

-- Mostra os dados
select * from locais;

-- Deleta o banco de dados
use sperifa;
drop database sperifa;
