# -*- coding: utf-8 -*-

__author__ = "SPerifa"
__copyright__ = "COPYRIGHT © 2021 SPerifa"
__version__ = "1.1"
__status__ = "local communication"
__license__ = "https://github.com/thallissousa/SPerifa/blob/main/LICENSE"


## Bibliotecas necessárias:
from flask import Flask, request, Response
from flask.json import jsonify
from flask_mysqldb import MySQL

from os import getenv, environ


## Criando a aplicação:
app = Flask(__name__)

app.secret_key = str(environ.get("SECRET_KEY", 'nada'))


# Configuração do JSON
app.config['JSON_AS_ASCII'] = False

# Conexão com o banco de dados
app.config['MYSQL_HOST'] = str(environ.get("MYSQL_HOST", 'localhost'))
app.config['MYSQL_USER'] = str(environ.get("MYSQL_USER", 'root'))
app.config['MYSQL_PASSWORD'] = str(environ.get("MYSQL_PASSWORD", getenv("SENHA_BD")))
app.config['MYSQL_DB'] = str(environ.get("MYSQL_DB", 'sperifa'))


# MySql -> Banco de dados
mysql = MySQL(app)


# Tabela sendo usada
TABELA = "locais"

COLUNAS: tuple = ("titulo", "descricao", "horario_funcionamento", "valor", "localizacao", "contato", "imagem", "latitude", "longitude")

# Cria a rota principal (locais) com os métodos GET e POST.
@app.route(f'/{TABELA}', methods=['GET', 'POST'])
def home():
    r"""Função principal que é executada assim que faz uma requisição."""
    
    if request.method == "GET":
        # Se comunica com o banco de dados
        data = database_maneger("GET", ())

        # Ajeita os dados
        new_data = convert_data(data)

        # Cria o JSON
        to_json = jsonify({"itens": new_data})

        return to_json

        
    elif request.method == "POST":
        return Response(status=404)
    return Response(status=404)


#### MANIPULAÇÃO DOS DADOS ####

def convert_data(data: tuple) -> str:
    r"""Função responsável por criar os itens da lista do JSON."""
    itens: list = []
    for line in data:
        data_filtred = create_encontro_item(line)
        itens.append(data_filtred)

    return itens


def create_encontro_item(data: tuple) -> dict:
    r"""Cria o dicionário para cada linha recebida do banco de dados."""

    column_names = ["id","", "titulo", "descricao", "horario_funcionamento", "valor", "localizacao", "contato", "imagem", "latitude", "longitude"]
    
    dict_data = {}

    for x in range(len(data)):
        if x != 1:
            dict_data[column_names[x]] = data[x]
    return dict_data


#### COMUNICAÇÃO COM O BANCO DE DADOS ####

def database_maneger(type: str, data: tuple) -> tuple:
    r"""Toda comunicação com o banco de dados é feita nessa função"""

    # Cria a conecção
    cur = mysql.connection.cursor()
    
    if type == "GET":
        # Executa o comando
        cur.execute(f"SELECT * FROM {TABELA}")

        # Salva em uma variável
        data = cur.fetchall()


    elif type == "POST":
        pass
        # # Configurações para o comando:
        # column_str = str(COLUNAS).replace("\'", "")
        # infos: str = "(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

        # # Executa o comando
        # cur.execute(f"INSERT INTO {TABELA} {column_str} VALUES {infos}", data_tuple)

    
    cur.close()                     # Fecha a comunicação
    mysql.connection.commit()       # Da um commit no MySQL
    return data
    


def main() -> None:
    r"""Função main, o que precisa pra rodar"""

    port = int(environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port, debug=True)


# Execução da função main.
if __name__ == '__main__':    
    main()