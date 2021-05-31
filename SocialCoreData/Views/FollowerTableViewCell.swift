//
//  FollowerTableViewCell.swift
//  Network Social App
//
//  Created by Natanael Diego on 24/05/21.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surname: UILabel!
    
     var user: User? {
         didSet {
             if let user = user {
                 nameLabel.text = user.name
                surname.text = user.username
             }
         }
     }
    
    var follower: FollowerDB? {
        didSet {
            if let follower = follower {
                nameLabel.text = follower.name
               surname.text = follower.username
            }
        }
    }

}
