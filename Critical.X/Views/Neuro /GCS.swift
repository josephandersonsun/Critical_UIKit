//
//  GCS.swift
//  Neuro
//
//  Created by Jadie Barringer III on 1/28/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class GCS: UIViewController, UIScrollViewDelegate {

    
    // Declare an outlets
    @IBOutlet weak var floatingScoreLabel: UILabel!
    
    // Set the view to be a circle . Make syre the frame is even like 50x50
    @IBOutlet weak var scoreView: UIView! {
        didSet {
            // Takes the view and makes it into a circle
            scoreView.layer.cornerRadius = scoreView.frame.size.width / 2
        }
    }
    
    
    @IBOutlet weak var gcsResultLabel: UILabel!
    
    //Eye outlets
    @IBOutlet var eyeButtons: [UIButton]!
    
    @IBOutlet weak var noResponseEye: UIButton!
    @IBOutlet weak var painButton: UIButton!
    @IBOutlet weak var commandButton: UIButton!
    @IBOutlet weak var spontaneousButton: UIButton!
    
    // Verbal Outlets
    @IBOutlet weak var oriented_Verbal: UIButton!
    @IBOutlet weak var confusedButton: UIButton!
    @IBOutlet weak var inappropriateWordsButton: UIButton!
    @IBOutlet weak var incomprehensibleButton: UIButton!
    @IBOutlet weak var noResponseVerbalButton: UIButton!

    //Motor Outlets
    @IBOutlet weak var obeysCommands_Button: UIButton!
    @IBOutlet weak var localized_Button: UIButton!
    @IBOutlet weak var withdrawsPain_Button: UIButton!
    @IBOutlet weak var flexion_Button: UIButton!
    @IBOutlet weak var extension_Button: UIButton!
    @IBOutlet weak var noResponse_Motor_Button: UIButton!
    @IBOutlet weak var gcsScrollView: UIScrollView!
    
    @IBOutlet weak var eyeOpeningView: CardView!
    
    //Updates the score to the label when the button is selected.
    var count: Int = 0 {
        didSet {
            gcsResultLabel.text = " \(count)"
            
            floatingScoreLabel.text = "\(count)"

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the scrollView to the delegate
        gcsScrollView.delegate = self
        
        // Hide the view onstart
        self.scoreView.isHidden = true
        

        //Count starts at zero and builds when buttons pressed
        count = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // ScrolView Delegate to hide and unihide the floating view
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    // Set a variable to the contentOffset position Y
    let scrollPosition = self.gcsScrollView.contentOffset.y
    
    //Conditional when the scrollView starts to scroll past a certain Y value
    if (scrollPosition >= 25) {
    
    // animate the view In
    UIView.animate(withDuration: 1, animations: {
    
    //write a code to unhide
    self.scoreView.isHidden = false
    
    print("Position:  \(self.gcsScrollView.contentOffset.x) , \(self.gcsScrollView.contentOffset.y) ")
    
    print("Floating view is visible")
    
    }, completion: nil) // End animation block
    
    } // End if statement
    
    else {
    
    //Slide it up incrementally, etc.
    UIView.animate(withDuration: 1, animations: {
    //
    self.scoreView.isHidden = true
    
    print("Floating view is HIDDEN")
    
    }, completion: nil) // End animation block
    } // End else  statement
    }
    
    
    
    
    @IBAction func spontaneous_Eye(_ sender: Any) {
        if spontaneousButton.isSelected == true {
            spontaneousButton.isSelected = false
        }
        else {
            spontaneousButton.isSelected = true
            commandButton.isSelected = false
            painButton.isSelected = false
            noResponseEye.isSelected = false
        }
        self.Calculate()
    }
    
    @IBAction func toCommands(_ sender: Any) {
        if commandButton.isSelected == true {
            commandButton.isSelected = false
        }else {
            commandButton.isSelected = true
            spontaneousButton.isSelected = false
            painButton.isSelected = false
            noResponseEye.isSelected = false
        }
        self.Calculate()
    }
    @IBAction func toPain(_ sender: Any) {
        if painButton.isSelected == true {
            painButton.isSelected = false
        }else {
            painButton.isSelected = true
            spontaneousButton.isSelected = false
            commandButton.isSelected = false
            noResponseEye.isSelected = false
        }
        self.Calculate()
    }
    @IBAction func noResponse(_ sender: Any) {
        
        if noResponseEye.isSelected == true {
            noResponseEye.isSelected = false
       }else {
            noResponseEye.isSelected = true
            spontaneousButton.isSelected = false
            commandButton.isSelected = false
            painButton.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Verbal Oriented
    @IBAction func Oriented_Verbal(_ sender: Any) {
        if oriented_Verbal.isSelected == true {
            oriented_Verbal.isSelected = false
        }else {
            oriented_Verbal.isSelected = true
            confusedButton.isSelected = false
            inappropriateWordsButton.isSelected = false
            incomprehensibleButton.isSelected = false
            noResponseVerbalButton.isSelected = false
        }
        self.Calculate()
}
    //MARK: - Verbal Confused
    
    @IBAction func confused_Verbal(_ sender: Any) {
        
        if confusedButton.isSelected == true {
            confusedButton.isSelected = false
        }
        else {
            confusedButton.isSelected = true
            oriented_Verbal.isSelected = false
            inappropriateWordsButton.isSelected = false
            incomprehensibleButton.isSelected = false
            noResponseVerbalButton.isSelected = false
        }
        self.Calculate()
    }
    
    
    //MARK: - Verbal Inappropriate Words
    @IBAction func Verbal_InappropriateWords(_ sender: Any) {
        
        if inappropriateWordsButton.isSelected == true {
            inappropriateWordsButton.isSelected = false
        }else {
            inappropriateWordsButton.isSelected = true
            oriented_Verbal.isSelected = false
            confusedButton.isSelected = false
            incomprehensibleButton.isSelected = false
            noResponseVerbalButton.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Verbal Incomprehensible
    @IBAction func Verbal_IncomprehensibeWords(_ sender: Any) {
        
        if incomprehensibleButton.isSelected == true {
            incomprehensibleButton.isSelected = false
        }else {
            incomprehensibleButton.isSelected = true
            oriented_Verbal.isSelected = false
            confusedButton.isSelected = false
            inappropriateWordsButton.isSelected = false
            noResponseVerbalButton.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Verbal No Response

    @IBAction func Verbal_noResponse(_ sender: Any) {
        
        if noResponseVerbalButton.isSelected == true {
            noResponseVerbalButton.isSelected = false
        }else {
            noResponseVerbalButton.isSelected = true
            oriented_Verbal.isSelected = false
            confusedButton.isSelected = false
            inappropriateWordsButton.isSelected = false
            incomprehensibleButton.isSelected = false
        }
        self.Calculate()
    }
    
    
    
    
    //MARK: - Motor Obeys Commands
    @IBAction func Motor_obeysCommands(_ sender: Any) {
        
        if obeysCommands_Button.isSelected == true {
            obeysCommands_Button.isSelected = false
        }else {
            obeysCommands_Button.isSelected = true
            localized_Button.isSelected = false
            withdrawsPain_Button.isSelected = false
            flexion_Button.isSelected = false
            extension_Button.isSelected = false
            noResponse_Motor_Button.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Motor localizes pain
    @IBAction func Motor_localizes(_ sender: Any) {
        
        if localized_Button.isSelected == true {
            localized_Button.isSelected = false
        }else {
            localized_Button.isSelected = true
            obeysCommands_Button.isSelected = false
            withdrawsPain_Button.isSelected = false
            flexion_Button.isSelected = false
            extension_Button.isSelected = false
            noResponse_Motor_Button.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Motor Wdls pain
    @IBAction func Motor_withdraws(_ sender: Any) {
        
        if withdrawsPain_Button.isSelected == true {
            withdrawsPain_Button.isSelected = false
        }else {
            withdrawsPain_Button.isSelected = true
            obeysCommands_Button.isSelected = false
            localized_Button.isSelected = false
            flexion_Button.isSelected = false
            extension_Button.isSelected = false
            noResponse_Motor_Button.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Motor Decorticates
    @IBAction func Motor_Decorticates(_ sender: Any) {
        
        if flexion_Button.isSelected == true {
            flexion_Button.isSelected = false
        }else {
            flexion_Button.isSelected = true
            obeysCommands_Button.isSelected = false
            localized_Button.isSelected = false
            withdrawsPain_Button.isSelected = false
            extension_Button.isSelected = false
            noResponse_Motor_Button.isSelected = false
        }
        self.Calculate()
    }
    
    //MARK: - Motor Decerebrates
    @IBAction func Motor_decerebrates(_ sender: Any) {
        
        if extension_Button.isSelected == true {
            extension_Button.isSelected = false
        }else {
            extension_Button.isSelected = true
            obeysCommands_Button.isSelected = false
            localized_Button.isSelected = false
            withdrawsPain_Button.isSelected = false
            flexion_Button.isSelected = false
            noResponse_Motor_Button.isSelected = false
        }
        self.Calculate()
    }
    
    
    //MARK: - Motor No Response
    @IBAction func Motor_noResponse(_ sender: Any) {
        
        if noResponse_Motor_Button.isSelected == true {
            noResponse_Motor_Button.isSelected = false
        }else {
            noResponse_Motor_Button.isSelected = true
            obeysCommands_Button.isSelected = false
            localized_Button.isSelected = false
            withdrawsPain_Button.isSelected = false
            flexion_Button.isSelected = false
            extension_Button.isSelected = false
        }
        self.Calculate()
    }
    

    func Calculate() -> Void {
        count = 0
        
        if spontaneousButton.isSelected { count += 4 }
        if commandButton.isSelected { count += 3 }
        if painButton.isSelected { count += 2 }
        if noResponseEye.isSelected { count += 1 }
        
        if oriented_Verbal.isSelected { count += 5 }
        if confusedButton.isSelected { count += 4 }
        if inappropriateWordsButton.isSelected { count += 3 }
        if incomprehensibleButton.isSelected { count += 2 }
        if noResponseVerbalButton.isSelected { count += 1 }
        
        if obeysCommands_Button.isSelected { count += 6 }
        if localized_Button.isSelected { count += 5 }
        if withdrawsPain_Button.isSelected { count += 4 }
        if flexion_Button.isSelected { count += 3 }
        if extension_Button.isSelected { count += 2 }
        if noResponse_Motor_Button.isSelected { count += 1 }
    }
}
