//
//  ViewController.swift
//  ChestXray
//
//  Created by Jadie Barringer III on 1/11/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class ChestXray: UIViewController, UIScrollViewDelegate {
    
    //Outlets
    @IBOutlet weak var cxrImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cxrbgView : UIView! {
        didSet {
            cxrbgView.clipsToBounds = true
            cxrbgView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            // Takes the button and makes it into a circle
            closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        }
    }
    
    @IBOutlet weak var cxrScroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cxrScroller.minimumZoomScale = 1.0;
        self.cxrScroller.maximumZoomScale = 5.0;
        self.cxrScroller.delegate = self
        
        
        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        cxrImageView.clipsToBounds = true
        cxrImageView.layer.cornerRadius = 15
        
        // Sets up the label in code.
        let buttonHeight = CGFloat(55.0)
        let theCenter:CGPoint = self.view.center

        //For the width i divide by 8 because that centers the button inside the iPhone X
        let buttonFrame = CGRect(x: view.frame.width-300, y: 500, width: 300 - buttonHeight, height: buttonHeight)
        let green = #colorLiteral(red: 0.262835294, green: 0.8022480607, blue: 0.3886030316, alpha: 1)
        
        let switchButton = JPSwitchButton(frame: buttonFrame, offColor: .white, onColor: green, image: nil, title: "Tap for detailed view", description: "", isOn: false)
        
        //Center the button in the middle of X axis
        switchButton.center = view.center
        
        // Set the Y position 
        switchButton.center.y = view.frame.midY + 75
        
        switchButton.onClick =  {
            switchButton.switchState()
            switchButton.buttonTitle = switchButton.isOn ? "Press to see normal CXR" : "Press to see detailed CXR"
            switchButton.buttonDescription = switchButton.isOn ? "" : ""
            
            // if the switch is selected on, display the chest xray, else display notmal cxr
            if switchButton.isOn {
                // Diaply detailed CXR
                self.cxrImageView.image = #imageLiteral(resourceName: "CXR_Detail.png")
                self.titleLabel.text = "Illustrated Chest-Xray"
                
            } else {
                //Switch back to the regular chest xray
                self.cxrImageView.image = #imageLiteral(resourceName: "CXR1.png")
                // Changes the title // Takes the button and makes it into a circle
                self.titleLabel.text = "Normal Chest-Xray"
                
            }
            
        }
        //Adds the button to the view
        view.addSubview(switchButton)
        
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.cxrImageView
    }
    
    @IBAction func closeChestXrayView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Chest xray Controller was dismissed")
        
    }
    
    
    
}


