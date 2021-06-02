//
//  CollectionTableViewCell.swift
//  CollectionCell
//
//  Created by Natanael Diego on 30/05/21.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    static let identifier = "CollectionTableViewCell"
    
    private var requestImage = UIImage() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    func configure(with models: [Followers]) {
        self.models = models
        collectionView.reloadData()
        
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var models = [Followers]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func loadImage() {
         let imageUrlString = "http://lorempixel.com.br/120/120"
         let imageUrl: URL = URL(string: imageUrlString)!
         // Start background thread so that image loading does not make app unresponsive
          DispatchQueue.global(qos: .userInitiated).async {
            
            if NSData(contentsOf: imageUrl) != nil {
                let imageData:NSData = NSData(contentsOf: imageUrl)!
                 // When from background thread, UI needs to be updated on main_queue
                DispatchQueue.main.async {
                     let image = UIImage(data: imageData as Data)
                    self.requestImage = image!
                 }
            }
         }
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        loadImage()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: models[indexPath.row], imageView: requestImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
