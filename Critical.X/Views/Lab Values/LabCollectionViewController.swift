//
//  LabCollectionViewController.swift
//  LabValues
//
//  Created by Admin on 31/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"



class LabCollectionViewController: UICollectionViewController {

    private var dataList = [Any]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lab Values"
        
        //sets the data and delegate sources
        let path: String? = Bundle.main.path(forResource: "LabValueX", ofType: "plist")
        
        dataList = NSArray(contentsOfFile: path ?? "") as! [Any]? ?? [Any]()
        
        // Change the color of the Navigtion Bar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2039999962, green: 0.2860000134, blue: 0.3689999878, alpha: 1)

        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
    
        let data = dataList[indexPath.row] as! NSDictionary
        
        cell.LabTitle.text = data.object(forKey: "title") as? String
        cell.LabImage.image = UIImage(named: (data.object(forKey: "image") as? String)!)
        cell.subTitle.text = data.object(forKey: "fulltitle") as? String
        cell.LabImage.layer.cornerRadius = 40.0
       
        
        // half the radius of the image
        cell.LabImage.layer.masksToBounds = true
        cell.LabImage.layer.borderColor = UIColor.white.cgColor
        cell.LabImage.layer.borderWidth = 0.2
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailViewController = segue.destination as? LabDetailViewController
            let myIndexPath: IndexPath? = collectionView?.indexPathsForSelectedItems?[0]
            detailViewController?.data = dataList[(myIndexPath?.row)!] as! [AnyHashable : Any]
        }
    }
}
