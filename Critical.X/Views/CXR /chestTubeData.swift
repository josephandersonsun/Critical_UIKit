//
//  ChestXrayData.swift
//  ChestXray
//
//  Created by Jadie Barringer III on 1/21/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class ChestXrayData: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var cxrDataView : UIView! {
        didSet {
            cxrDataView.clipsToBounds = true
            cxrDataView.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    @IBOutlet weak var chestTubeData: UILabel!
    @IBOutlet weak var centralLineData: UILabel!
    @IBOutlet weak var ettData: UILabel!
    @IBOutlet weak var ventilationData: UILabel!
    @IBOutlet weak var ngOgData: UILabel!
    @IBOutlet weak var trachData: UILabel!

    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Chest tubes
        chestTubeData.text = "Pleural Effusions\n\n• Should be inferior-posterior at the level of the 8th intercostal space - directly posterior. The tip of the tube should be aimed towards the lower part of the pleural cavity\n\nPneumothorax\n\n• Should be located anteriorly mid-clavicular at the level of the 3rd intercostal space or anterior axillary directed toward the apex of the 4th or 5th intercostal space. The tip of the chest tube should be aimed towards the upper pleural cavity."
        
        centralLineData.text = "Catheter Tip\n\n• The catheter tip of the central line should end approx. at the level of the right tracheobronchial angle. The tip of the tube should be aimed towards the lower part of the pleural cavity.\n\n• Rule out any pneumothorax.\n\n• If you notice any mediastinal widening, this may be a direct result of great vessel damage."
        
        ettData.text = "• The tip of the endotracheal tube should be approximately 3 cm below the vocal cords and 2-4 cm above the carina - which is approximately at the level of the aortic arch."
        
        ventilationData.text = "• 1st, rule out any pneumothorax, sub-q air pneumomediastinum or subpleural air cysts.\n\nNote:\n• Lung infiltrates may be diminished on the view due to increased aeration and pressures."
        
        ngOgData.text = "• Verify that the tube is in the stomach and not coiled up into the esophagus or trachea."
        
        trachData.text = "• Should be located halfway between the stoma and the carina.\n\n• Should be approx. 2/3 width of the trachea.\n\n•The trach cuff should not cause bulging of the tracheal walls.\n \n• Check for sub-q air in the neck.\n\n• Finally, check for a widening mediastinum due to possible air leakages."
        
        // Do any additional setup after loading the view.
    }

  
    
//MARK: - Dismiss the View
    
    @IBAction func cxrView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }

}
