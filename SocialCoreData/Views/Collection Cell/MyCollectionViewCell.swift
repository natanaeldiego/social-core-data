//
//  MyCollectionViewCell.swift
//  CollectionCell
//
//  Created by Natanael Diego on 30/05/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
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
    
    public func configure(with model: Followers) {
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(data: try! Data(contentsOf: URL(string: "http://lorempixel.com.br/120/120")!))
        self.myImageView.contentMode = .scaleAspectFill
    }

}
