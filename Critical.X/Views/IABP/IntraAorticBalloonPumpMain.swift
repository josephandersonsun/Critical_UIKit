//
//  ViewController.swift
//  Intra Aortic Balloon Pump
//
//  Created by Jadie Barringer III on 1/22/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class IntraAorticBalloonPumpMain: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // Once the view appears, the animation starts.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
 }
    
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2039999962, green: 0.2860000134, blue: 0.3689999878, alpha: 1)
        
        
    }
    
    
    let section = ["Timing", "Complications"]
    //Create an array to populate the tableView
    let iabpMenuItems = [["Normal Timing", "Early Inflation", "Late Inflation", "Early Deflation", "Late Deflation"], ["Aortic Dissection / Perforation", "Ineffective Augmentation", "Bleeding at the insertion site", "Balloon rupture / Leak","Dysrhythmias","Vascular Injury","Failure to pump","Limb ischemia","Cardiac Arrest"]]
    // let images = ["normal","LAP","apnea","hypo","elevated","hyper"]
    
    
    
    //MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iabpMenuItems [section].count
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        configureCell(cell: cell, forRowAt: indexPath)
        
        
        // Fills each textLabel from the array made.
        cell.textLabel?.text = iabpMenuItems[indexPath.section][indexPath.row]
        //cell.textLabel?.font = UIFont(font: .avenirMedium, size: 15.0)
        // Shows the array of images on the tableViewController menu
        
        //cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        //Changes the color of the tableView menu Items
        switch (indexPath.section, indexPath.row) {
        
        //Rows 1,3,5 title color is changed
        case (0,0):
            cell.textLabel?.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            
        case (0,1),(0,4), (1,8):
            cell.textLabel?.textColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        
        case (0,2):
            cell.textLabel?.textColor = #colorLiteral(red: 0.3058823529, green: 0.3058823529, blue: 0.3058823529, alpha: 1)
        
        default:
            cell.textLabel?.textColor = #colorLiteral(red: 0.3058823529, green: 0.3058823529, blue: 0.3058823529, alpha: 1)
        }
        
        switch (indexPath.section, indexPath.row) {
      
        default:
            break
        }
        
        //Returns the cell.
        return cell
    }
    
    
    func configureCell(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    //What happens when the cell is clicked ?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "showDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
               
                let controller = segue.destination as! IABPDetail
                
                //Overall hides the button when the segues is loaded. Since hide it globally here, I only have to code where i want the button visible.
                
                controller.buttonHidden = true
                
                controller.viewHidden = true
                
                controller.subTitle = "Critical Points 🥇"
                
                controller.subTitleComplications = ""
                //Uncomment to change the title of the tableViewController
                //controller.title = capnographyMenu[indexPath.row]
                
                // Switching on each row.
                switch (indexPath.section, indexPath.row) {
                    
                    
                // Grabs the reference from the enum in the information View file.
                //MARK: - Normal Timing
                case (0,0):
                    // Subtitle
                    controller.mainTitle = BalloonPump.NormalTiming.iabpTitle()
                    // Timing description
                    controller.iabpDescription = BalloonPump.NormalTiming.iabpDescription()
                    
                    //Sets the IABP Image
                    controller.iabpImage = BalloonPump.NormalTiming.iabpImages()
                    
                    //Unhides the button
                    controller.buttonHidden = false
                    
                    //Unhides the ImageView to display the image.
                    controller.viewHidden = false
                    
                    controller.subTitle = "Critical Points 🥇"
                    
                    controller.subTitleComplications = ""
                    
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                    
                    
                    
                //MARK: - Early Inflation
                case (0,1):
                    controller.mainTitle = BalloonPump.EarlyInflation.iabpTitle()
                    
                    //description overview
                    controller.iabpDescription = BalloonPump.EarlyInflation.iabpDescription()
                    
                    //Sets the warning label
                    controller.warning = "This is very harmful to the patient."
                    
                    //Sets the IABP Image
                    controller.iabpImage = BalloonPump.EarlyInflation.iabpImages()
                    
                    //Unhides the ImageView to display the image.
                    controller.viewHidden = false
                    
                    controller.subTitle = "Critical Points 🥇"
                    controller.subTitleComplications = ""
                    
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                //MARK: - Late Inflation
                case (0,2):
                    // Sets the title
                    controller.mainTitle = BalloonPump.LateInflation.iabpTitle()
                    
                    //Description overview
                    controller.iabpDescription = BalloonPump.LateInflation.iabpDescription()
                    
                    //Sets the IABP Image
                    controller.iabpImage = BalloonPump.LateInflation.iabpImages()
                    
                    //Unhides the ImageView to display the image.
                    controller.viewHidden = false
                    
                    controller.subTitle = "Critical Points 🥇"
                    controller.subTitleComplications = ""
                    
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                    
                    
                //MARK: - Early Deflation
                case (0,3):
                    //Sets the title
                    controller.mainTitle = BalloonPump.EarlyDeflation.iabpTitle()
                    
                    //Description
                    controller.iabpDescription = BalloonPump.EarlyDeflation.iabpDescription()
                    
                    //Sets the IABP Image
                    controller.iabpImage = BalloonPump.EarlyDeflation.iabpImages()
                    
                    //Unhides the ImageView to display the image.
                    controller.viewHidden = false
                    
                    controller.subTitle = "Critical Points 🥇"
                    controller.subTitleComplications = ""
                    
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                    
                    
                //MARK: - Late Deflation
                case (0,4):
                    //Sets the title
                    controller.mainTitle = BalloonPump.LateDeflation.iabpTitle()
                    
                    //Description
                    controller.iabpDescription = BalloonPump.LateDeflation.iabpDescription()
                    
                    //Sets the IABP Image
                    controller.iabpImage = BalloonPump.LateDeflation.iabpImages()
                    
                    //Unhides the ImageView to display the image.
                    controller.viewHidden = false
                    
                    
                    //Warning
                    controller.warning = "This is very harmful to the patient."
                    
                    //Hiding one subTitle and active the other
                    controller.subTitle = "Critical Points 🥇"
                    controller.subTitleComplications = ""
                    
                    
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                //MARK: - Aortic Dissection
                case (1,0):
                    // Title
                    controller.mainTitle = BalloonPump.AorticDissection.iabpTitle()
                    
                    //Sets description
                    controller.iabpDescription = BalloonPump.AorticDissection.iabpDescription()
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.AorticDissection.complicationInfo()
                    
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                case (1,1):
                    // Subtitle
                    controller.mainTitle = BalloonPump.Augmentation.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.Augmentation.complicationInfo()
                    
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                case (1,2):
                    // Subtitle
                    controller.mainTitle = BalloonPump.BleedingAtSite.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.BleedingAtSite.complicationInfo()
                    
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                case (1,3):
                    // Subtitle
                    controller.mainTitle = BalloonPump.BalloonRupture.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.BalloonRupture.complicationInfo()
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                case (1,4):
                    // Subtitle
                    controller.mainTitle = BalloonPump.Dysrhythmias.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.Dysrhythmias.complicationInfo()
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                case (1,5):
                    // Subtitle
                    controller.mainTitle = BalloonPump.VascularInjuries.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.VascularInjuries.complicationInfo()
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                    
                case (1,6):
                    // Subtitle
                    controller.mainTitle = BalloonPump.FailureToPump.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.FailureToPump.complicationInfo()
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                case (1,7):
                    // Subtitle
                    controller.mainTitle = BalloonPump.LimbIschemia.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.LimbIschemia.complicationInfo()
                    
                    //Print
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                    
                case (1,8):
                    // Subtitle
                    controller.mainTitle = BalloonPump.CardiacArrest.iabpTitle()
                    //                    controller.warning = BalloonPump
                    //                    controller.iabpDescription = BalloonPump
                    //                    controller.iabpImage = BalloonPump
                    
                    //Pulls data from the complication Enum
                    controller.complicationsDetail = BalloonPump.BalloonPumpComplication.CardiacArrest.complicationInfo()
                    // Hides the prev subtitle and changes the language to the new title for the complications
                    controller.subTitle = ""
                    controller.subTitleComplications = "Critical Points 🥇"
                    
                    
                    print("Section \(indexPath.section), Row \(indexPath.row)")
                    
                    
                    
                default:
                    break
                }
            }
        }
    }
    
    
    
}
