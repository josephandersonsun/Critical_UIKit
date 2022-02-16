//
//  ViewController.swift
//  Capnography
//
//  Created by Jadie Barringer III on 1/21/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class Capnogrpahy: UITableViewController {
    
    
    @IBOutlet weak var capnographySubtitleAnimation: AKLabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let subtititleText = "Capnogram Waveform Analysis"
        capnographySubtitleAnimation.animate(text: subtititleText, duration: 1, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        capnographySubtitleAnimation.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //Create an array to populate the tableView
    let capnographyMenu = ["Normal Waveform", "Apnea", "Hypoventilation", "Elevated Baseline", "Hyperventilation", "Loss of Alveloar Pressure"]
    // let images = ["normal","LAP","apnea","hypo","elevated","hyper"]
    
    //MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capnographyMenu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        configureCell(cell: cell, forRowAt: indexPath)
        
        
        // Fills each textLabel from the array made.
        cell.textLabel?.text = capnographyMenu[indexPath.row]
        // Shows the array of images on the tableViewController menu
        
        //cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        //Changes the color of the tableView menu Items
        switch indexPath.row {
        //Rows 1,3,5 title color is green
        case 0, 2, 4:
            cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
            
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
                let controller = segue.destination as! CapnographyDetail
                
                //Uncomment to change the title of the tableViewController
                //controller.title = capnographyMenu[indexPath.row]
                
                // Changes the set title of the Heading label
                controller.captitle = capnographyMenu[indexPath.row]
                
                // Switching on each row.
                switch indexPath.row {
                    
                // Grabs the reference from the enum in the information View file.
                case 0:
                    // Subtitle
                    controller.subtitle = CapnographyData.Normal.waveFormSubtitleData()
                    //Image
                    controller.image = CapnographyData.Normal.capnographyImages()
                    //Causes
                    controller.causes = CapnographyData.Normal.possibleCauses()
                    
                    controller.causesTitle = "Waveform Physiology"
                    
                    
                    print("case 0")
                case 1:
                    // Subtitle
                    controller.subtitle = CapnographyData.Apnea.waveFormSubtitleData()
                    //Image
                    controller.image = CapnographyData.Apnea.capnographyImages()
                    //Causes
                    controller.causes = CapnographyData.Apnea.possibleCauses()
                    
                    //Possible Causes Title Header
                    controller.causesTitle = "Possible Causes"
                    
                    print("case 1")
                case 2:
                    // Subtitle
                    controller.subtitle = CapnographyData.Hypoventilation.waveFormSubtitleData()
                    //Image
                    controller.image = CapnographyData.Hypoventilation.capnographyImages()
                    //Causes
                    controller.causes = CapnographyData.Hypoventilation.possibleCauses()
                    //Possible Causes Title Header
                    controller.causesTitle = "Possible Causes"
                    
                    
                    print("case 2")
                case 3:
                    // Subtitle
                    controller.subtitle = CapnographyData.ElevatedBaseline.waveFormSubtitleData()
                    //Image
                    controller.image = CapnographyData.ElevatedBaseline.capnographyImages()
                    //Causes
                    controller.causes = CapnographyData.ElevatedBaseline.possibleCauses()
                    //Possible Causes Title Header
                    controller.causesTitle = "Possible Causes"
                    
                    
                    print("case 3")
                case 4:
                    // Subtitle
                    controller.subtitle = CapnographyData.Hyperventilation.waveFormSubtitleData()
                    //Image
                    controller.image = CapnographyData.Hyperventilation.capnographyImages()
                    //Causes
                    controller.causes = CapnographyData.Hyperventilation.possibleCauses()
                    //Possible Causes Title Header
                    controller.causesTitle = "Possible Causes"
                    
                    
                    print("case 4")
                case 5:
                    // Subtitle
                    controller.subtitle = CapnographyData.LossOfAveolarPressure.waveFormSubtitleData()
                    //Causes
                    controller.causes = CapnographyData.LossOfAveolarPressure.possibleCauses()
                    // Image
                    controller.image = CapnographyData.LossOfAveolarPressure.capnographyImages()
                    //Possible Causes Title Header
                    controller.causesTitle = "Possible Causes"
                    
                    
                    print("case 5")
                default:
                    break
                }
            }
        }
    }
    
    
    
}

