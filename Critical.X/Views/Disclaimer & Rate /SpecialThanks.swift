//
//  SpecialThanks.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/13/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
import EasyPeasy

class SpecialThanks: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var thanksView: UIView!
    @IBOutlet weak var thankYouLabel: AKLabel!
    @IBOutlet weak var specialThanksScroller: UIScrollView!
    @IBOutlet weak var criticalImage: UIImageView!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    

    
    //VIEW DID APPEAR!!!!!!!!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
//        scrollHeight.constant = specialThanksScroller.frame.origin.y + specialThanksScroller.frame.size.height +  80
//        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
        //        scrollHeight2.constant = rsiProcessTitle.frame.origin.y + rsiProcessDescription.frame.size.height + 80
        
        print("\(specialThanksScroller.frame.size.height) Height constraint Value")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        specialThanksScroller.easy.layout(Size())
//
//   thanksView.easy.layout(Margins(UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)))
//
//
//        thanksView.easy.layout(Size(CGSize(width: 290, height: 550)))
        //thanksView.easy.layout(Center())
        
        //criticalImage.easy.layout(Top(20))
        //thankYouLabel.easy.layout(Bottom(5).to(criticalImage))
        
        thankYouLabel.animate(text: "The Barringer Group & Critical Team would like to extend a sincere and special thank you to all of those that gave amazing feedback, suggestions, and ideas that helped contribute to the success of this great application.\n\nSpecial Thanks\n\nLudys Barringer, Esq.\nSteve A. Teitelman, RN\nDr. Sean Johnson, M.D.\nDr. Joanelle Bailey, M.D.\nDr. Richard Levitan, M.D.\nDoug Fuller, FP-C\nAllen Wolfe, RN\nBrian King, FP-C\nOrlando Rodriguez, FP-C \nDane Taylor, FP-C", duration: 4, completion: nil)
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissSpecialThanks(_ sender: AnyObject) {
      
            
            dismiss(animated: true, completion: nil)
            print("Special Thanks View Controller was dismissed")
            
        
    }
   
   

}
