//
//  StackElementViewController.swift
//  StackedMenu
//
//  
//

import UIKit

class StackElementViewController: UIViewController {
    
    @IBOutlet var ventCardView: UIView!
    
   
    @IBOutlet weak var textDetailLabel: UILabel!
    
    
    @IBOutlet weak var ventilatorScrollHeight: NSLayoutConstraint!
    
    @IBOutlet weak var headerLabel: UILabel!
   // @IBOutlet weak var textDetailLabel: UITextView!
    
    @IBOutlet weak var subTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ventCardView.clipsToBounds = true
        ventCardView.layer.cornerRadius = 60
        ventCardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        headerLabel.sizeToFit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
ventilatorScrollHeight.constant =  textDetailLabel.frame.size.height + 40
    }
    var headerString:String? {
        didSet {
            configureView()
        }
    }
    
    var subHeaderString:String? {
        didSet {
            configureViewThree()
        }
    }
    
    var detailString:String? {
        didSet {
            configureViewTwo()
        }
    }
  
    func configureViewTwo() {
        textDetailLabel.text = detailString
        
    }
    
    func configureView() {
        headerLabel.text = headerString
        
    }
    
    func configureViewThree() {
        subTitle.text = subHeaderString
        
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
