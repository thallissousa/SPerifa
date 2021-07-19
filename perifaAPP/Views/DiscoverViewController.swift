//
//  DiscoverViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

    let images = ["adega", "boteco", "tabacaria"]
    let titles = ["Adega Altas Horas", "Boteco do Zé", "Tabacaria 2 Irmãos"]

    class DiscoverViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
        @IBOutlet weak var collectionView: UICollectionView!
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
            cell.index = indexPath.row
            cell.image.image = UIImage(named: images[indexPath.row])
            cell.pTitle.text = titles[indexPath.row]
            cell.pAuthor.text = "Saiba mais"
            return cell
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? DetailViewController, let index = collectionView.indexPathsForSelectedItems?.first{
                destination.nomeDetail = titles[index.row]
            }
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        }
        

    }


    class PostCell: UICollectionViewCell {
        @IBOutlet weak var background: UIView!
        @IBOutlet weak var image: UIImageView!
        @IBOutlet weak var pTitle: UILabel!
        @IBOutlet weak var pAuthor: UILabel!
        
        var index: Int!
        
        
        override func awakeFromNib() {
            background.layer.cornerRadius = 8
            image.layer.cornerRadius = 8 //altera o corner radius da imagem dentro da View
        }
        
    }
