//
//  CranialNerveVC.swift
//  Neuro
//
//  Created by Jadie Barringer III on 1/27/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class CranialNerveVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var cranialImage: UIImageView!
    @IBOutlet weak var cranialSwitch: UISwitch!
    @IBOutlet weak var cnScroller: UIScrollView!

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cnScroller.minimumZoomScale = 1.0;
        self.cnScroller.maximumZoomScale = 5.0;
        self.cnScroller.delegate = self;
        
        //Rotates the label
        //CN1Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        cranialImage.image = #imageLiteral(resourceName: "CranialNerveCartoon.png")

        ///Creates the first rotated label.
//        let cranialNerveLabel1: UILabel = UILabel(frame: CGRect(x:15, y:66, width:28, height:159))
//        cranialNerveLabel1.textAlignment = .center
//        cranialNerveLabel1.text = "Cranial Nerves"
//        cranialNerveLabel1.font = UIFont.boldSystemFont(ofSize: 15)
//        self.view.addSubview(cranialNerveLabel1)
//        cranialNerveLabel1.transform = CGAffineTransform(rotationAngle: CGFloat(-(Double.pi / 2.0)))
//        cranialNerveLabel1.frame = CGRect(x:6, y:450, width:30, height:222)
//        
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.cranialImage
    }

    @IBAction func changeSwitch(_ sender: Any) {
        
        if cranialSwitch.isOn {
            cranialImage.image = #imageLiteral(resourceName: "CranialNerveCartoon.png")
        } else {
            cranialImage.image = #imageLiteral(resourceName: "CranialNerves1.png")

        }
        
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
