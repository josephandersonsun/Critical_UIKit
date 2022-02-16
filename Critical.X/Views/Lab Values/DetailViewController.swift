//
//  DetailViewController.swift
//  LabValues
//
//  Created by Admin on 31/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var LabSkeletonImage: UIImageView!
    @IBOutlet var DetailImage: UIImageView!
    @IBOutlet var DetailTitleLabel: UILabel!
    @IBOutlet var DetailDescriptionLabel: UILabel!
    @IBOutlet var DetailSummaryLabel: UILabel!
    @IBOutlet weak var labScoller: UIScrollView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    

    public var data = [AnyHashable: Any]()
    private var datalist = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lab Values"
        //sets the data and delegate sources
        let path: String? = Bundle.main.path(forResource: "LabValueX", ofType: "plist")
        
        datalist = NSArray(contentsOfFile: path ?? "") as! [Any]? ?? [Any]()
        
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
        
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: DetailSummaryLabel.frame.origin.y + DetailSummaryLabel.frame.size.height + 10, width: tableView.frame.size.width, height: self.view.frame.size.height - (DetailSummaryLabel.frame.origin.y + DetailSummaryLabel.frame.size.height + 100))
        
        datalist = data["values"] as! [Any]
        DetailImage.layer.cornerRadius = 30.0
        
        
        // half the radius of the image
        DetailImage.layer.masksToBounds = true
        DetailImage.layer.borderColor = UIColor.white.cgColor
        DetailImage.layer.borderWidth = 0.2
        
        // Do any additional setup after loading the view.
    }
    // Call the function in the viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        //setScrollViewContentSize()
        setScrollContentSize()
    }
    
    
    func setScrollContentSize()  {
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
        scrollHeight.constant = DetailSummaryLabel.frame.origin.y + DetailSummaryLabel.frame.size.height +  480
        
        
        print("\(DetailSummaryLabel.frame.size.height) Height constraint Value")
    }
    
    
    
    // Heres the dynamic scrollFunction
    func setScrollViewContentSize() {
        
        var height: CGFloat
        let lastView = self.labScoller.subviews[0].subviews.last!
        
        print(lastView.debugDescription) // should be what you expect
        
        // The label thats being dynamic
        let lastViewYPos = DetailSummaryLabel.convert(lastView.frame.origin, to: nil).y  // this is absolute positioning, not relative
        
        // Add all the labels here.
        let lastViewHeight = DetailSummaryLabel.frame.size.height
        
        // sanity check on these
        print(lastViewYPos)
        print(lastViewHeight)
        
        // Final height of the scrollView with a buffer
        var buffer: CGFloat

        buffer = 428

        height = lastViewYPos + lastViewHeight + buffer
        
        print("lab setting scroll height: \(height)")
        
        // Setting the scollview to the final height.
        labScoller.contentSize.height = height
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        //this is set in the storyboard for cell identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableCell
        
        let data = datalist[indexPath.row] as! NSDictionary
        
        cell.CellTitleLabel.text = data.object(forKey: "title") as? String
        cell.CellDescriptLabel.text = data.object(forKey: "description") as? String
        cell.CellUnitsLabel.text = data.object(forKey: "unit") as? String
        cell.CellValueLabel.text = data.object(forKey: "value") as? String
        cell.CellTitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16.0)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let object = segue.destination
        if (object is MoreDetailViewController) {
            let view = object as? MoreDetailViewController
            let row: Int? = tableView.indexPathForSelectedRow?.row
            view?.info = datalist[row!] as! [AnyHashable : Any]
        }
    }
    
}
