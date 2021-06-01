//
//  followersViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 31/05/21.
//

import UIKit

class FollowersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var models = [Followers]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Followers(text: "First", imageName: ""))
        
        models.append(Followers(text: "Second", imageName: ""))
        
        models.append(Followers(text: "Third", imageName: ""))
        
        models.append(Followers(text: "Demo", imageName: ""))
        
        models.append(Followers(text: "First", imageName: ""))
        
        models.append(Followers(text: "Second", imageName: ""))
        
        models.append(Followers(text: "Third", imageName: ""))
        
        models.append(Followers(text: "Demo", imageName: ""))
        
        models.append(Followers(text: "First", imageName: ""))
        
        models.append(Followers(text: "Second", imageName: ""))
        
        models.append(Followers(text: "Third", imageName: ""))
        
        models.append(Followers(text: "Demo", imageName: ""))
        
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
