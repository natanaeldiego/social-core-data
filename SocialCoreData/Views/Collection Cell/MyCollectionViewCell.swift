//
//  MyCollectionViewCell.swift
//  CollectionCell
//
//  Created by Natanael Diego on 30/05/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let kReuseIdentifier = "MyCollectionViewCell"
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Followers, imageView: UIImage) {
        self.myLabel.text = model.text
        self.myImageView.image = imageView
        self.myImageView.contentMode = .scaleAspectFill
    }

}
