//
//  FollowerTableViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 24/05/21.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"
var noteList = [FollowerDB]()

class FollowerTableViewController: UITableViewController {

    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    var firstLoad = true
    
    private var followerList = [FollowerDB]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FollowerDB")
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            
            if results.count > 0 {
                firstLoad = false
                for result in results {
                    let follower = result as! FollowerDB
                    self.followerList.append(follower)
                }
            }
            
        } catch {
            print("Fetch Failed")
        }
    }
    
    func checkFollower() -> [FollowerDB] {
        var checkFollowerList = [FollowerDB]()
        for note in followerList {
            checkFollowerList.append(note)
        }
        
        return checkFollowerList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if firstLoad {
            if let url = URL(string: "\(kBaseURL)/users") {
                let session = URLSession.shared

                let request = URLRequest(url: url)
                
                let task = session.dataTask(with: request) { (data, resp, error) in
                    if let response = resp as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                        if let users = try? JSONDecoder().decode([User].self, from: data!) {
                            DispatchQueue.main.async {
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                                
                                for saveData in users {
                                    let entity = NSEntityDescription.entity(forEntityName: "FollowerDB", in: context)
                                    let newFollower = FollowerDB(entity: entity!, insertInto: context)
                                    
                                    newFollower.id = Int32(saveData.id)
                                    newFollower.name = saveData.name
                                    newFollower.username = saveData.username
                                    self.followerList.append(newFollower)
                                }
                                do {
                                    try context.save()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                    }
                }
                task.resume()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let thisFollower = followerList[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! FollowerTableViewCell
        
        cell.follower = thisFollower
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
