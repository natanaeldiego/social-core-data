//
//  FeedPostTableViewCell.swift
//  Network Social App
//
//  Created by Natanael Diego on 24/05/21.
//

import UIKit

class FeedPostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
     
     var detailUser: DetailUser? {
         didSet {
             if let detailUser = detailUser {
                 tituloLabel.text = detailUser.title
                 descricaoLabel.text = detailUser.body
             }
         }
     }

}
