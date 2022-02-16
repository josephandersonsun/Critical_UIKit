//
//  _12Lead_DetailViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/9/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit



class _12Lead_DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageScroller: UIScrollView!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var twelveLeadImage: UIImageView!
    
    @IBOutlet weak var titleLabelDetail: UILabel!
    
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel2: UILabel!
    
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    
    //MARK: - Gloabl Variables to be passed
    // To pass the title
    var titleString = String()
    
    var DescriptionString_1: NSAttributedString? = nil
    
    var DescriptionString_2: NSAttributedString? = nil
    // Do we display the 12 lead image ?
    var display12LeadImage = Bool()
    
    // String of the main image
    var imageString: String = ""
    
    // String of the detail image
    var imageString_12Lead: String = ""
    
    var identifier = Int()
    
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScroller.delegate = self
        
        update12LeadInfomation()
    }
    
    
    
    //MARK: Helper Function
    func update12LeadInfomation()  {
        // Set the descripTtion Labela
        descriptionLabel.attributedText = DescriptionString_1
        descriptionLabel2.attributedText = DescriptionString_2
        
        // set the ishidden to the global  boolean
        twelveLeadImage.isHidden = display12LeadImage
        
        //SEt the image to the string variable being passed
        imageView1.image = UIImage(named: imageString)
        twelveLeadImage.image = UIImage(named: imageString_12Lead)
        
        // SEt the title label to the titleString
        titleLabelDetail.text = titleString
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  300 pixels at the end to compensate for the screen thats above it because its staring below the image view.
        scrollHeight.constant = descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + descriptionLabel2.frame.size.height + 380
        
        switch identifier {
        case 1:
            scrollHeight.constant = descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + 380
            
            print("Identifier \(identifier) was selected for scrolling. Only first description label. Scroll height is \(String(describing: scrollHeight))")
        case 2:
            // We add 180 to 380 to accound for the image View height.
            scrollHeight.constant = descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + descriptionLabel2.frame.size.height + 560
            
            print("Identifier \(identifier) was selected for scrolling. Only first description label. Scroll height is \(String(describing: scrollHeight))")
        default:
            break
        }
        
        
        print("\(descriptionLabel.frame.size.height) Description 1 Height constraint Value")
        print("\(descriptionLabel2.frame.size.height) Description 2 for EKG  Height constraint Value")
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView1
    }
    
    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("12Lead DetailVC was dismissed")
        
    }
    
}
