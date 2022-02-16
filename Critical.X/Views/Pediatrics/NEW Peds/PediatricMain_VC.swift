//
//  PediatricMain_VC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/4/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

// Making random color array for title label
extension UIColor {
    static func random(from colors: [UIColor]) -> UIColor? {
        return colors.randomElement()
    }
}

class PediatricMain_VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var pediatricWeightButton: UIButton!
    @IBOutlet weak var pediatrictextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    
    // Declare some random colors to use
    let randomColors = [#colorLiteral(red: 0.9100000262, green: 0.5500000119, blue: 0.5699999928, alpha: 1) ,#colorLiteral(red: 0.3300000131, green: 0.5500000119, blue: 0.8700000048, alpha: 1) ,#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) ,#colorLiteral(red: 0.2039999962, green: 0.2860000134, blue: 0.3689999878, alpha: 1) , #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1),  #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) , #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) ]
    
    let randomNavBarColors = [#colorLiteral(red: 0.9100000262, green: 0.5500000119, blue: 0.5699999928, alpha: 1) ,#colorLiteral(red: 0.3300000131, green: 0.5500000119, blue: 0.8700000048, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) , #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1),  #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) , #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) ]
    
    // variable arrays for the collectionView 
    var pediatricWeight = [String]()
    
    var pediatricAge = [String]()

    
    
    override func viewDidAppear(_ animated: Bool) {
        // Set title label to random colors.
        
        // Animate the title label
        titleAnimate()
        
        // Randomly change the color of the lable referencing the extension
    let pickAColor = UIColor.random(from: randomColors)
        
        // Set the title label to the changed color
        titleLabel.textColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
        pediatricWeightButton.backgroundColor = pickAColor
        
        // Print the color
        print("\(pickAColor.hashValue) color was picked")
    }
    
    
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Bicarb Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func titleAnimate()
    {
        // Animation for the Results UIView
        self.titleLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.titleLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.titleLabel.alpha = 1.0
            self.titleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    
        
    }
    
    func animateNavBar()  {
        
        let fadeTextAnimation = CATransition()
        
        fadeTextAnimation.duration = 0.3
        
        fadeTextAnimation.type = CATransitionType.moveIn
        
        //        kCATransitionFade
        //        kCATransitionMoveIn
        //        kCATransitionPush
        //        kCATransitionReveal
        //
        
        /*
         The different date formats
         Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
         09/12/2018                        --> MM/dd/yyyy
         09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
         Sep 12, 2:11 PM                   --> MMM d, h:mm a
         September 2018                    --> MMMM yyyy
         Sep 12, 2018                      --> MMM d, yyyy
         Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
         2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
         12.09.18                          --> dd.MM.yy
         10:41:02.112                      --> HH:mm:ss.SSS
         */
        
        let date : Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d  |  h:mm a"
        let todaysDate = dateFormatter.string(from: date)
        
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
        
        // Set the navigation title to the current date configuration.
        navigationController?.navigationBar.topItem?.title = todaysDate
        
        // navigationItem.title = "The Barringer Group ©"
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        // Runs the animation code for the label and button to show when the VC appears
        showAnimate()
        
        // Animate the navBar
        animateNavBar()
        
        //change the color of the navigationbar with random color
        self.navigationController?.navigationBar.barTintColor = UIColor.random(from: randomNavBarColors)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        pediatricWeight = ["2",
                           "4",
                           "6",
                           "8",
                           "10",
                           "12",
                           "15",
                           "17",
                           "20",
                           "22",
                           "25",
                           "27",
                           "30",
                           "35",
                           "40",
                           "50",
                           "60",
                           "75",
                           "100"]
        
         pediatricAge = ["Premature",
                         "Newborn",
                         "4 - 6 Months",
                         "6 - 8 Months",
                         "1 YR",
                         "18 MO - 2 YRS",
                         "3 YRS",
                         "4 YRS",
                         "5 YRS",
                         "6 YRS",
                         "7 YRS",
                         "7 - 8 YRS",
                         "8 - 9 YRS",
                         "9 - 10 YRS",
                         "11 YRS",
                         "12 - 13 YRS",
                         "13 - 16 YRS",
                         "Adult",
                         "Adult"]
        
        
        /// Rounds the corners 4 pixels of the button name. 4 px for a button
        pediatricWeightButton.clipsToBounds = true
       
        pediatricWeightButton.layer.cornerRadius = 4
        
        
        // Takes the button and makes it into a circle
        //dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }
    
    

    
   
    
  
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Exiting Methods
    
   
    
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    
    
    
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    // Dismisses the view controller.
    @IBAction func dismissPedsViewControll(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        print("Pediatric Main ViewController was closed")
    }
    //MARK: Connected to the new View Controller
    @IBAction func calculateDataButton(_ sender: UIButton) {
        
        
        /// if the textField is empty. the text will be set to zero and the UI Alert will come up.
        guard let theText = pediatrictextField.text, theText.isEmpty else {
            // theText is empty
            print("the weight textField is empty")
            return // or throw
        }
        
        // Sets the textField to empty after its not filled out. That way if theres an Int there, the segue will perform. So set to ""
        pediatrictextField.text = ""
        
        // Displays UI Alert, alerting the user to set a value to proceed.
        let alert = UIAlertController(title: "Whoops!", message:  "Enter a weight greater than 0, and less than 80 kg's., then calcualte.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
        
        
    }
    
 
    
    //MARK: Prepare for the SEGUE
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        ///// Checks the segue destination, grabs the number value from the textfield and passes the data.
        if let destination = segue.destination as? Pediatric_DetailVC {
            
        
            
            //Takes the Double (weightEntered) variable from the detail page, and parses it as the textFireld (Double) becuase the textField is oridescriptionsted as a string.
            destination.weightEntered = Double (pediatrictextField.text!)
            
            
            print("Transitioned to the detailed View screen")
        }
        
        
        
    }
    
    


    
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
        self.pediatrictextField.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.pediatrictextField.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.pediatrictextField.alpha = 1.0
            self.pediatrictextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Animation for the label to come in a little later
        self.pediatricWeightButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.pediatricWeightButton.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.pediatricWeightButton.alpha = 1.0
            self.pediatricWeightButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }

}

//MARK: - If the text is empty, show alert and cancel the segue,
extension PediatricMain_VC {
/// Also works covering both conditions in one line of code.

/// Cancels the segue transition if the textBox is empty
override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if identifier == "A" {
        if (self.pediatrictextField.text?.isEmpty)! || (pediatrictextField.text == "0.0") {
            print("segue cancelled")
            
            _ = SCLAlertView().showError("Hold On...", subTitle:"Please enter a weight", closeButtonTitle:"OK")

            // Also can add an alert here.
            return false
        }
    }
    
    // by default, transition
    return true
}

}



extension PediatricMain_VC {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pediatricWeight.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Delcare the place where we are getting the cell info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PedsWeight_CollectionViewCell
        
        // Configure the cell from the oulets in the cell Class.
        cell.pedsWeight.text = pediatricWeight[indexPath.item]
        
        cell.pedsAge.text = pediatricAge [indexPath.item]
        

        switch cell.contentView.backgroundColor {
        case #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) :
            cell.pedsWeight.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        default:
            cell.pedsWeight.textColor = #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1)

        }
        
        // We are changing the color of the Detail Subtitle only here.
        switch indexPath.row {
            
        case 0, 1:
            // Gray 2 , 4 KG
            cell.contentView.backgroundColor  = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
            cell.pedsWeight.textColor = #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1)

        case 2:
            // Pink 6 KG

            cell.contentView.backgroundColor  = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        case 3:
            
            // Red 8 KG

            cell.contentView.backgroundColor  = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        
        case 4:
            // Purple 10 kg

            cell.contentView.backgroundColor  = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
 
        case 5:
            // Yellow 12 kg
            cell.contentView.backgroundColor  = #colorLiteral(red: 1, green: 0.7570000291, blue: 0.0270000007, alpha: 1)
        
            
        case 6,7:
            // White 15, 17 kg
            cell.contentView.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            cell.pedsWeight.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            

        case 8,9:
            // Blue 20, 22 kg
            cell.contentView.backgroundColor  = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            
            cell.pedsWeight.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
       
        case 10, 11:
            // Orange 25, 27 kg

            cell.contentView.backgroundColor  = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
           
            cell.pedsWeight.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
    
        case 12, 13,14,15,16:
            // Green 30  KG
            cell.contentView.backgroundColor  = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
       
            cell.pedsWeight.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       
  
        case 17, 18:
       // Baby Blue 75  KG
            cell.contentView.backgroundColor  = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
       
            cell.pedsWeight.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
   
        default:
       
          break

        }
        
        return cell
    }
    
    // Pass the data from the cells and data to the detailView Controller.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // print(OBstoryBoardID [indexPath.item])
        // Set the Storyboard ID to each indexPath.
        //let SBID = OBstoryBoardID [indexPath.item]
        
        
        let storyboard = UIStoryboard(name: "Critical Pediatrics New", bundle: nil) // Has to reflect the storyBoard they are on.
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "A") as? Pediatric_DetailVC {
            
            
            switch indexPath.item {
                
            case 0:
               
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 2
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                print("2 kg was pressed")
                
            case 1:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 4
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("4 kg was pressed ")
                
            case 2:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 6
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("6 kg was pressed ")
                
            case 3:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 8
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("8 kg was pressed ")
                
            case 4:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 10
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("10 kg was pressed ")
                
            case 5:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 12
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("12 kg was pressed ")
                
            case 6:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 15
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("15 kg was pressed ")
                
            case 7:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 17
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("17 kg was pressed ")
                
            case 8:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 20
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("20 kg was pressed ")
                
            case 9:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 22
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("22 kg was pressed ")
                
                
            case 10:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 25
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("25 kg was pressed ")
                
                
            case 11:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 27
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("27 kg was pressed ")
                
            case 12:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 30
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("30 kg was pressed ")
                
            case 13:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 35
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("35 kg was pressed ")
                
            case 14:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 40
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("40 kg was pressed ")
                
            case 15:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 50
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("50 kg was pressed ")
                
            case 16:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 60
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("60 kg was pressed ")
                
            case 17:
                
                
                // What text to send to the global string to set to the label
                vc.weightEntered = 75
                
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("75 kg was pressed ")
                
            case 18:
                
                // Here we set the weight value
                vc.weightEntered = 100
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("100 kg was pressed ")
                
        
                
            default:
                break
                
            }
        }
        
    }
    
    
}
