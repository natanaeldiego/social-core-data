//
//  FeedPostTableViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 24/05/21.
//

import UIKit

class FeedPostTableViewController: UITableViewController {
    
    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    private var detailUsers = [DetailUser]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var user: User?
    var idUser = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let url = URL(string: "\(kBaseURL)/users/\(idUser)/posts") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            
            let task = session.dataTask(with: request) { (data, resp, error) in
                if let response = resp as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                    if let detailUsers = try? JSONDecoder().decode([DetailUser].self, from: data!) {
                        DispatchQueue.main.async {
                            self.detailUsers = detailUsers
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let detailUser = detailUsers[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath) as! FeedPostTableViewCell
        
        cell.detailUser = detailUser
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
