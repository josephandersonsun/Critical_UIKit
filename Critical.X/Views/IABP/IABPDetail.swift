//
//  IABPDetail.swift
//  Intra Aortic Balloon Pump
//
//  Created by Jadie Barringer III on 1/22/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit




class IABPDetail: UIViewController, UIScrollViewDelegate {
    
    
    var mainTitle = String()
    
    var warning = String()
    
    var iabpDescription = String()
    
    var subTitle = String()
    
    var subTitleComplications = String()
    
    var complicationsDetail = String ()
    
    var iabpImage: UIImage?
    
    var iabpSwitch = UISwitch ()
    
    var buttonHidden = false
    
    var viewHidden = false
    
   // Outlets 
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var imagePlaceholder: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var criticalSubTitle: UILabel!
    
    @IBOutlet weak var criticalSubtitleComplications: UILabel!
    
    @IBOutlet weak var complicationsDetailLabel: UILabel!
    
    @IBOutlet weak var scrolViewIABP: UIScrollView!
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2039999962, green: 0.2860000134, blue: 0.3689999878, alpha: 1)
        
        headingLabel.text = mainTitle
        
        warningLabel.text = warning
        
        descriptionLabel.text = iabpDescription
        
        imagePlaceholder.image = iabpImage
        
        criticalSubTitle.text = subTitle
        
        criticalSubtitleComplications.text = subTitleComplications
        
        complicationsDetailLabel.text = complicationsDetail
        
        self.scrolViewIABP.minimumZoomScale = 1.0
        
        self.scrolViewIABP.maximumZoomScale = 6.0

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imagePlaceholder
    }

    // Here we say that the boolean that we created is equal to the IBOutlet. When the viewAppears the image and button is false to be hidden. 
    override func viewWillAppear(_ animated: Bool) {
        playButton.isHidden = buttonHidden
        imagePlaceholder.isHidden = viewHidden
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
