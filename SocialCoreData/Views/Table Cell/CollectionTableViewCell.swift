//
//  CollectionTableViewCell.swift
//  CollectionCell
//
//  Created by Natanael Diego on 30/05/21.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    static let identifier = "CollectionTableViewCell"
    private let imageDownloader = ImageDownloader.shared
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("DEBUG 123")
        // Configure the view for the selected state
    }
    
    // Collectionview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
