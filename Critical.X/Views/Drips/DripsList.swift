//
//  DripsList.swift
//  Critical Drips
//
//  Created by Admin on 10/02/2018.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class DripsList: UITableViewController {
    
    
    //Outlet labels for the animation which has the AKLabel subclass.
    @IBOutlet weak var dripSubTitle: AKLabel!

    @IBOutlet weak var dripTitle: UILabel!
    

    // Variable to pass data
    private var Dripslist = [Any]()
    
    
    //MARK: ViewWillAppear to animate Labels
    override func viewDidAppear(_ animated: Bool) {
        
  
        super.viewWillAppear(true)
      
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // Clears the text when the view dissappears so it doesnt look bad when reloading
        dripSubTitle.text = ""
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Drips"
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func animateNavBar()  {
        
        let fadeTextAnimation = CATransition()
        
        fadeTextAnimation.duration = 0.3
        
        fadeTextAnimation.type = CATransitionType.moveIn
        
        //        kCATransitionFade
        //        kCATransitionMoveIn
        //        kCATransitionPush
        //        kCATransitionReveal
        //
        
        /*
         The different date formats
         Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
         09/12/2018                        --> MM/dd/yyyy
         09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
         Sep 12, 2:11 PM                   --> MMM d, h:mm a
         September 2018                    --> MMMM yyyy
         Sep 12, 2018                      --> MMM d, yyyy
         Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
         2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
         12.09.18                          --> dd.MM.yy
         10:41:02.112                      --> HH:mm:ss.SSS
         */
        
        let date : Date = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E MMM d  |  h:mm a"
        
        let todaysDate = dateFormatter.string(from: date)
        
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
        
        // Set the navigation title to the current date configuration.
        navigationController?.navigationBar.topItem?.title = todaysDate
        
        // navigationItem.title = "The Barringer Group ©"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2039999962, green: 0.2860000134, blue: 0.3689999878, alpha: 1)
        
        //Call the time and date animation
        animateNavBar()
        
        // Animates the title when the screen loads.
        dripSubTitle.animate(text: "INFUSION RATES AND CALCULATIONS", duration: 1, completion: nil)

        
        if ((UserDefaults.standard.object(forKey:"drip_list")) != nil) {
            Dripslist = (UserDefaults.standard.object(forKey:"drip_list") as! NSArray) as! [Any]
        }
        
        else {
            let path: String? = Bundle.main.path(forResource: "Calculator", ofType: "plist")
            
            Dripslist = NSArray(contentsOfFile: path!) as! [Any]
            
            
            UserDefaults.standard.set(Dripslist, forKey: "drip_list")
            
            UserDefaults.standard.synchronize()
        }
       
        self.tableView.reloadData()
       
      
    }
    
    
    
  
    
    
    @IBAction func ResetClick(_ sender: Any) {
        let path: String! = Bundle.main.path(forResource: "Calculator", ofType: "plist")
        Dripslist = NSArray(contentsOfFile: path) as! [Any]
        
        
        UserDefaults.standard.set(Dripslist, forKey: "drip_list")
        
        UserDefaults.standard.synchronize()
        
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Dripslist.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DripCell
        
        cell.lblTitle.text = (Dripslist[indexPath.row] as AnyObject).object(forKey: "maintitle") as? String
        cell.lblPropofol.text = (Dripslist[indexPath.row] as AnyObject).object(forKey: "BrandName") as? String
        
        let minValue = (Dripslist[indexPath.row] as AnyObject).object(forKey: "min") as! String
        let maxValue = (Dripslist[indexPath.row] as AnyObject).object(forKey: "max") as! String
        let Unit = (Dripslist[indexPath.row] as AnyObject).object(forKey: "unit") as! String
        
        cell.lbl_DoseAmount.text = minValue + " - " + maxValue + " " + Unit
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CriticalDrips") as! CriticalDrips
        controller.index = indexPath.row
        
        
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0;
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "EditDrip") as! EditDrip
        
        controller.index = indexPath.row
        
       
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Update\nDosages"
    }
    
    
   
    
}

