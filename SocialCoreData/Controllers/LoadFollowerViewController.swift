//
//  LoadFollowerViewController.swift
//  SocialCoreData
//
//  Created by Natanael Diego on 01/06/21.
//

import UIKit

class LoadFollowerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var imageTop: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadImage", for: indexPath) as! LoadFollowerCollectionViewCell
        
        imageTop.image = UIImage(data: try! Data(contentsOf: URL(string: "http://lorempixel.com.br/120/120")!))
                
        cell.imageLoad.image = UIImage(data: try! Data(contentsOf: URL(string: "http://lorempixel.com.br/120/120")!))
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
