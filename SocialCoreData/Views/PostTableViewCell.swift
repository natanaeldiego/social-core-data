//
//  PostTableViewCell.swift
//  Network Social App
//
//  Created by Natanael Diego on 16/05/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let kReuseIdentifier = "PostTableViewCell"
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var postTimestamp: UILabel!
    @IBOutlet weak var postBody: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postLink: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var likeStatus: UILabel!
    @IBOutlet weak var commentStatus: UILabel!
    
    
    @IBAction func onLike(_ sender: UIButton) {
    }
    
    @IBAction func onComment(_ sender: UIButton) {
    }
    
    @IBAction func onShare(_ sender: UIButton) {
    }
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: "PostTableViewCell", bundle: Bundle(for: PostTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with data: String, imagePost: UIImage, profilePicture: UIImage) {
//        postBody.text = data
        
        profilePictureImageView.image = profilePicture
        
        postImage.image = imagePost
        
    }
    
}
