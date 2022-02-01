//
//  ImageCache.swift
//  perifaAPP
//
//  Created by Gabriel Batista Cristiano on 31/01/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: UIImageView {
    
    var imageURL: URL?
    
    func loadImageWithURL(_ url: URL){
        
        imageURL = url
        image = nil
//    Recupera a imagem existente em Cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            
            self.image = imageFromCache
            return
        }
//    Faz uma nova solicitação ao banco de dados com a url da imagem
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//    Trata casos de erro
            if error != nil {
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async(execute: {
//    Cria uma variável do tipo UIImage que utiliza a url como parametro, e irá guardar o valor da imagem ue buscamos no banco de dados
                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                    if self.imageURL == url {
                        self.image = imageToCache
                    }
//    Salva a imagem que recuperamos no banco de dados, em cache.
                    print(url)
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            })
        }).resume()
    }
}
