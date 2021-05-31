//
//  ByHandViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 24/05/21.
//

import UIKit

class ByHandViewController: UIViewController {
    
    private let imageDownloader = ImageDownloader.shared

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        PostTableViewCell.register(inside: tableView)
    }
    
}

extension ByHandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.kReuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.setup(with: "Lorem Ipsum", imagePost: imageDownloader.randomImage(), profilePicture: imageDownloader.randomImage())
        return cell
    }
    
}

extension ByHandViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 630
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
