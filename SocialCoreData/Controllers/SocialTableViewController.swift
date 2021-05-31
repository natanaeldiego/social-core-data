//
//  SocialTableViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 16/05/21.
//

import UIKit

class SocialTableViewController: UITableViewController {
    
    private let imageDownloader = ImageDownloader.shared

    override func viewDidLoad() {
        PostTableViewCell.register(inside: self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageDownloader.beginCachingImages()
    }
    
    
    @IBAction func onRefresh(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.kReuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.setup(with: "Lorem Ipsum", imagePost: imageDownloader.randomImage(), profilePicture: imageDownloader.randomImage())
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 630
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
