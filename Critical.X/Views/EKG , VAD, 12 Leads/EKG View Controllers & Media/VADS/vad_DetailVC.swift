//
//  vad_DetailVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/2/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

// Global Int variable to assign to the tag so we can reference.
var buttonTag = Int()

class vad_DetailVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var whatToKnow_lbl: AKLabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var titleView: AKLabel!
    
    @IBOutlet weak var explanationLabel: UILabel!
    
    @IBOutlet weak var vadImage: UIImageView!
    
    @IBOutlet weak var vadDetailScroller: UIScrollView!
    
    @IBOutlet weak var overView: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    var mainTitleLabel = String ()
    
    var vadChildTitle = String()
    
    var vadChildDescription = NSAttributedString ()
    
    var imageString = String()
    
    // We use this boolean to show the view on the detail View controller
    var overViewHidden: Bool = false
    
    var hideButton: Bool = false
    
    var troubleshootingString = String()
    
    
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whatToKnow_lbl.animate(text: "What to know", duration: 2, completion: nil)
        // Hide the overiView View
        overView.isHidden  = overViewHidden
        
        // Hide the button
        editButton.isHidden = hideButton
        
        editButton.tag = buttonTag
        
        vadDetailScroller.sizeToFit()
        
        // Set the textFields to the passed string
        titleView.animate(text: vadChildTitle, duration: 1, completion: nil)
        
        explanationLabel.attributedText = vadChildDescription
        
        vadImage.image = UIImage(named: imageString)
        
        // The title of the button is set to the string
        editButton.setTitle(troubleshootingString, for: .normal)
        
        enum titles: String {
            
            case overview = "Overview"
            case totalHeart = "Total Artificial Heart"
            case heartMate2 = "Heart Mate II"
            case HVAD = "Heartware"
        }
        
        
    }
    
    // Zoom Image
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return vadImage
    }
    //MARK: - Controls the scrollView height dynamcially.
    override func viewDidAppear(_ animated: Bool) {
        
        heightConstraint.constant = explanationLabel.frame.origin.y + explanationLabel.frame.size.height + editButton.frame.size.height + 100
        
        print("\(explanationLabel.frame.size.height) Height constraint Value")
    }
    
    
    
    //MARK: - Dismiss the viewCOntroller
    @IBAction func dismissVadDetail(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Vad Detail View Controller was dismissed")
        
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch buttonTag {
        case 1:
            
            // Externally load the website. No webView needed
            // Total artifical heart
            if let url = URL(string: "https://www.mylvad.com/ems/field_guides/syncardia-tah-ems-field-guide") {
                UIApplication.shared.open(url, options: [:])
            }
        case 2:
            if let url2 = URL(string: "https://www.mylvad.com/sites/default/files/EMS%20Guide%20HeartMate%20II%20new%20cover.pdf") {
                UIApplication.shared.open(url2, options: [:])
            }
        case 3:
            if let url3 = URL(string: "https://www.mylvad.com/sites/default/files/EMS%20Guidelines%20HeartWare%20HVAD%20updated%20cover.pdf"){
                UIApplication.shared.open(url3, options: [:])
            }
            
        case 4:
            
            //Impella Devuce
            if let url3 = URL(string: "http://abiomed.com/assets/files/impella/1477328608d1202039c52918014996bb8bcaae064a.pdf"){
                UIApplication.shared.open(url3, options: [:])
            }

        default:
            break
        }
        
    }
    
}
