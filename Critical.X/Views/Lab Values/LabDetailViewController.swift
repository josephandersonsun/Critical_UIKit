//
//  LabDetailViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/27/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class LabDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var LabSkeletonImage: UIImageView!
    @IBOutlet var DetailImage: UIImageView!
    @IBOutlet var DetailTitleLabel: UILabel!
    @IBOutlet var DetailDescriptionLabel: UILabel!
    @IBOutlet var DetailSummaryLabel: UILabel!
    @IBOutlet weak var labScoller: UIScrollView!
    @IBOutlet var collectionVIew: UICollectionView!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    
    var selectedIndexPath: NSIndexPath?

    public var data = [AnyHashable: Any]()
    private var datalist = [Any]()
    
    func setScrollContentSize()  {
        
        var height: CGFloat
        let lastView = self.labScoller.subviews[0].subviews.last!
        
        print(lastView.debugDescription) // should be what you expect
        
        // The label thats being dynamic
        let lastViewYPos = DetailSummaryLabel.convert(lastView.frame.origin, to: nil).y  // this is absolute positioning, not relative
        
        // Add all the labels here.
        let lastViewHeight = DetailSummaryLabel.frame.size.height
        
        let collectionHeight = collectionVIew.frame.size.height
        
        // sanity check on these
        print(lastViewYPos)
        print(lastViewHeight)
        
        // Final height of the scrollView
        
        height = lastViewYPos + lastViewHeight + collectionHeight
        
        
        print("lab scroller setting scroll height total: \(height)")
        
        // Setting the scollview to the final height.
        labScoller.contentSize.height = height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setScrollContentSize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(data)
        
        navigationItem.title = data["title"] as? String
        DetailTitleLabel.text = (data["title"] as! String)
        DetailImage.image = UIImage(named: data["image"] as! String)
        
        if let skeleton = data["skeletonImage"] as? String {
            LabSkeletonImage.image = UIImage(named: skeleton)
        }
        
        DetailDescriptionLabel.text = data["fulltitle"] as? String
        DetailDescriptionLabel.textColor = UIColor.red
        
        DetailSummaryLabel.text = data["summary"] as? String
        DetailSummaryLabel.numberOfLines = 0
        DetailSummaryLabel.sizeToFit()
        
    
        
        datalist = data["values"] as! [Any]
        DetailImage.layer.cornerRadius = 30.0
        
        
        // half the radius of the image
        DetailImage.layer.masksToBounds = true
        DetailImage.layer.borderColor = UIColor.white.cgColor
        DetailImage.layer.borderWidth = 0.2
    }
    


    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       // let destinationVC = segue.destination
//
//        if (destinationVC is MoreDetailViewController) {
//
//            let view = destinationVC as? MoreDetailViewController
//
//            let myrow = self.collectionVIew.indexPathsForSelectedItems?.map({ $0.item })
//
//            let row: Int? = myrow
//            //let row: Int? =  self.collectionVIew!.indexPathsForSelectedItems()
//
//            view?.info = datalist[row!] as! [AnyHashable : Any]
//        }
   
        if segue.identifier == "show" {
            let destViewController = segue.destination as! MoreDetailViewController

            let cell = sender as! UICollectionViewCell

            //Get the indexPAth and pass the cell
            var indexPath = collectionVIew.indexPath(for: cell)

            //SEt variable for all of the titles in the array to pass
            let selectedTitleData = datalist[(indexPath?.row)!]
            //let row: Int? = self.collectionVIew?.indexPathsForSelectedItems


            destViewController.info = selectedTitleData as! [AnyHashable : Any]
        }
    }
    
    
    }
    
    



extension LabDetailViewController {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
 return datalist.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "Cell"
        //this is set in the storyboard for cell identifier
    
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! LabCollectionCell
        
        let data = datalist[indexPath.row] as! NSDictionary
        
        cell.CellTitleLabel.text = data.object(forKey: "title") as? String
        cell.CellDescriptLabel.text = data.object(forKey: "description") as? String
        cell.CellUnitsLabel.text = data.object(forKey: "unit") as? String
        cell.CellValueLabel.text = data.object(forKey: "value") as? String
        //cell.CellTitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16.0)
        
        return cell
    }
    
    // Enum for the segue identifier
    enum SegueIdentifier: String {
        case labs = "show"
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       // self.performSegue(withIdentifier: SegueIdentifier.labs.rawValue, sender: self)

    }
    
    // Pass the data from the cells and data to the detailView Controller.
   
    
}
