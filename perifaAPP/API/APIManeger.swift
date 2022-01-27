//
//  APIManeger.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 20/01/22.
//

import Foundation

class ApiManeger {
    let mainLink: String = "https://sperifa-api.herokuapp.com/locais"


    /**
        Faz a chamda da API para o método GET .

        - CompletionHandler:
            - Result: lista com os encontros recebidos
            - Error: erro caso tenha algum
    */
    public func getLocais(_ completionHandler: @escaping (Result<[Local], APIError>) -> Void) -> Void {

        // Erro na URL
        guard let url = URL(string: self.mainLink) else {
            completionHandler(.failure(APIError.badURL))
            return
        }


        let request = URLRequest(url: url)

//
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Erro da sessão
            if let error = error {
                completionHandler(.failure(APIError.url(error as? URLError)))
                return
            }

            // Não fez conexão com a API: servidor ou internet off
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completionHandler(.failure(APIError.badResponse(statusCode: response.statusCode)))
                return
            }

            // Erro na hora de pagar os dados
            guard let data = data else {
                completionHandler(.failure(APIError.badData))
                return
            }

//
            // Erro na hora de decodificar
            guard let local = try? JSONDecoder().decode(Items.self, from: data) else {
                completionHandler(.failure(APIError.badDecode))
                return
            }


            completionHandler(.success(self.compactInfo(itens: local)))
        }
        task.resume()
    }

    /**
        Pega os dados recebidos e coloca na struct padrão: EncontroMarcado
     
        - Parâmetros:
            - items: Struct com as informações recebidas da API
    */
    private func compactInfo(itens:Items) -> [Local] {
        var locais:[Local] = []

        if let items = itens.itens {
            for info in items {
                locais.append(
                    Local(
                        contato: info.contato,
                        descricao: info.descricao,
                        imagem: info.imagem,
                        horario_funcionamento: info.horario_funcionamento,
                        id: info.id,
                        latitude: info.latitude,
                        localizacao: info.localizacao,
                        longitude: info.longitude,
                        titulo: info.titulo,
                        valor: info.valor
                    )
                )
            }
        }
        return locais
    }
}
