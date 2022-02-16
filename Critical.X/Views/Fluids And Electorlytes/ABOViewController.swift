//
//  ABOViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 4/17/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import McPicker

class ABOViewController: UIViewController {

    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            // Takes the button and makes it into a circle
            closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        }
    }
    
    @IBOutlet weak var bloodButton: UIButton!
    
    @IBOutlet weak var bloodTypeLabel: UILabel!
    
    @IBOutlet weak var bloodTypeBGView: UIView! {
        didSet {
            // Takes the button and makes it into a circle
            bloodTypeBGView.layer.cornerRadius = bloodTypeBGView.frame.size.width / 2
        }
    }
    
   
    @IBOutlet weak var donateLabel: UILabel!
   
    @IBOutlet weak var receiveLabel: UILabel!
   
    @IBOutlet weak var resultView: UIView!
   
    @IBOutlet weak var posNegText: UILabel!
    
    @IBAction func bloodDismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.isHidden = true
        
        
    }
    
    //MARK: - Picker Variable titles.
    let data: [[String]] = [
        ["A Pos", "A Neg", "B Pos", "B Neg", "AB Pos", "AB Neg", "O Pos","O Neg"]
    ]
   
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Bicarb Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func showAnimate()
    {
        // Animation for the Results UIView
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.resultView.alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
    }
    
    @IBAction func popOverPicker(_ sender: UIButton) {
        //Properties
        
        
        
        // What happends when we select a picker segment,
        //        McPicker.showAsPopover(data: data, fromViewController: self, sourceView: sender, cancelHandler: { () -> Void in
        //
        //        print("Canceled Popover") }, doneHandler: { (selections: [Int : String]) -> Void in print("Done with Popover")
        //
        McPicker.show(data: data, doneHandler: { (selections: [Int : String]) -> Void in print("Done with Popover")
            
            
            if let name = selections[0] {
                //self.label.text = name
                
                
                
                //MARK: - A pos
                if name == "A Pos" {
                    
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                    
                    self.bloodTypeLabel.text = "A"
                    
                    self.posNegText.text = "POS"
                    
                    self.bloodButton.titleLabel?.textAlignment = .center

                    self.bloodButton.titleLabel?.text = "A Positive"
                    
                    // Set the Labels
                    self.donateLabel.text = "A Pos & AB Pos"
                    
                    self.receiveLabel.text = "A Pos & A Neg | O Pos & O Neg"
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    self.view.endEditing(true)

                    print("A Pos selected")
                    
                }
                    
                    // MARK: - A neg
                else if name == "A Neg" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                    
                    self.bloodTypeLabel.text = "A"
                    
                    self.posNegText.text = "NEG"
                    
                    self.bloodButton.titleLabel?.textAlignment = .center
                    
                    self.bloodButton.titleLabel?.text = "A Negative"

                    // Set the Labels
                    self.donateLabel.text = "A Pos & A Neg | AB Pos & AB Neg"
                    
                    self.receiveLabel.text = "A Neg | O Neg"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    self.view.endEditing(true)
                    
                    print("A Neg selected")

                    self.view.endEditing(true)
                    
                }
                    
                    
                    
                    // MARK: - B pos
                else if name == "B Pos" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
                    
                    self.bloodTypeLabel.text = "B"
                    
                    self.posNegText.text = "POS"
                   
                    self.bloodButton.titleLabel?.textAlignment = .center

                    self.bloodButton.titleLabel?.text = "B Positive"
                    
                    
                    // Set the Labels
                    self.donateLabel.text = "B Pos & AB Pos"
                    
                    self.receiveLabel.text = "B Pos & B Neg | O Pos & O Neg"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    self.view.endEditing(true)
                    
                    print("B Pos selected")
                    
                    
                }
                
                    // MARK: - B neg
                else if name == "B Neg" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    
                    self.bloodTypeLabel.text = "B"
                    
                    self.posNegText.text = "NEG"
                    
                    self.bloodButton.titleLabel?.textAlignment = .center
                    
                    self.bloodButton.titleLabel?.text = "B Negative"
                    
                    
                    // Set the Labels
                    self.donateLabel.text = "B Pos & B Neg | AB Pos & AB Neg"
                    
                    self.receiveLabel.text = "B Neg | O Neg"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    print("B Neg selected")

                    self.view.endEditing(true)
                    
                }
                
                    // MARK: - AB pos
                else if name == "AB Pos" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
                    
                    self.bloodTypeLabel.text = "AB"
                    
                    self.posNegText.text = "POS"
                    
                    self.bloodButton.titleLabel?.textAlignment = .center
                    
                    self.bloodButton.titleLabel?.text = "AB Positive"
                    
                    
                    // Set the Labels
                    self.donateLabel.text = "Only AB Pos"
                    
                    self.receiveLabel.text = "Everyone - Universal Recipient"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    print("AB Positive selected")
                    
                    self.view.endEditing(true)
                    
                }
                
                    // MARK: - AB neg
                else if name == "AB Neg" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                    
                    self.bloodTypeLabel.text = "AB"
                    
                    self.posNegText.text = "NEG"
                    
                    self.bloodButton.titleLabel?.textAlignment = .center
                    
                    self.bloodButton.titleLabel?.text = "AB Negative"
                    
                    
                    // Set the Labels
                    self.donateLabel.text = "AB Pos | AB Neg"
                    
                    self.receiveLabel.text = "AB Neg | A Neg | B Neg | O Neg"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    print("AB Positive selected")
                    
                    self.view.endEditing(true)
                    
                }
                
                    // MARK: - O pos
                else if name == "O Pos" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.6549019608, blue: 0.4509803922, alpha: 1)
                    
                    self.bloodTypeLabel.text = "O"
                    
                    self.posNegText.text = "POS"
                    
                   
                    
                    // Set the Labels
                    self.donateLabel.text = "O Pos | A Pos | B Pos | AB Pos"
                    
                    self.receiveLabel.text = "O Pos & O Neg"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    print("O Positive selected")
                    
                    
                    self.view.endEditing(true)
                    
                    self.bloodButton.titleLabel?.textAlignment = .center
                    
                    self.bloodButton.titleLabel?.text = "O Positive"
                    
                }
                
                    // MARK: -  O neg
                else if name == "O Neg" {
                    
                    self.bloodTypeLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    
                    self.bloodTypeBGView.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.6549019608, blue: 0.4509803922, alpha: 1)
                    
                    self.bloodTypeLabel.text = "O"
                    
                    self.posNegText.text = "Neg"
                    
                   
                    
                    // Set the Labels
                    self.donateLabel.text = "Everyone - Universal Donor"
                    
                    self.receiveLabel.text = "Only O Neg"
                    
                    
                    self.resultView.isHidden = false
                    
                    self.showAnimate()
                    
                    print("O Negative selected")
                    
                    self.view.endEditing(true)
                    
                    self.bloodButton.titleLabel?.textAlignment = .center
                    
                    self.bloodButton.titleLabel?.text = "O Negative"
                    
                }
            
            }
            
            
        }) // completes the closure
    
    }
    
    
    
    
    
}
