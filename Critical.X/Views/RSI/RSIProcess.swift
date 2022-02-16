//
//  RSIProcess.swift
//  Critical_X_RSI
//
//  Created by Jadie Barringer III on 12/28/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow , range: range)
        self.attributedText = attribute
    }
}

class RSIProcess: UIViewController {
    
    @IBOutlet weak var rsiProcessTitle: UILabel!
    @IBOutlet weak var rsiProcessDescription: UILabel!
    @IBOutlet weak var closeProcessButton: UIButton!
    @IBOutlet weak var rsiprocessView: UIView!
    
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollHeight2: NSLayoutConstraint!
    
    
    public var processDescription:String?
    public var processDescription1:String?
    public var processTitle: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Takes the button and makes it into a circle
        closeProcessButton.layer.cornerRadius = closeProcessButton.frame.size.width / 2
       
        
        rsiprocessView.clipsToBounds = true
        rsiprocessView.layer.cornerRadius = 15
        
        // Sets the description and header labels
        rsiProcessDescription.text = processDescription

        rsiProcessTitle.text = processTitle
        
        rsiProcessDescription.sizeToFit()
        
        //MARK: - takes the string and changes the color from the UILabel extension.
        rsiProcessDescription.halfTextColorChange(fullText: processDescription!, changeText: "SOAP ME")
       
        if processDescription!.contains("Nitrogen Washout") {
            print("Pretreat was prob selected")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
        scrollHeight.constant = rsiProcessTitle.frame.origin.y + rsiProcessDescription.frame.size.height +  80
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
//        scrollHeight2.constant = rsiProcessTitle.frame.origin.y + rsiProcessDescription.frame.size.height + 80
    }
    
    //MARK: - dismiss the viewController 
    @IBAction func dismissProcessRSI(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

