//
//  VAD_ViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/1/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel





class VAD_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var VADTitle: AKLabel!
    @IBOutlet weak var vadCollectionView: UICollectionView!
    
    @IBOutlet weak var closeButton: UIButton!
    // Variable declaration.
    var vad_MainMenu = [String]()
    
    var vad_MenuDetail = [String]()
    
    
    
    
    @IBAction func dismissUSVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        VADTitle.animate(text: "Ventricular Assist Devices", duration: 1, completion: nil)
        
        vad_MainMenu = ["Basic Overview", "TAH","Heart Mate II","HVAD", "Impella"]
        
        vad_MenuDetail = ["MECHANICAL OVERVIEW","SYNCARDIA: BIVAD-TOTAL ARTIFICIAL HEART","2ND GENERATION AXIAL-FLOW PUMP","MEDTRONIC 3RD GENERATION CENTRIFUGAL FLOW", "ABIOMED - MICRO-AXIAL FLOW PUMP"]
        
        // Takes the button and makes it into a circle
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return vad_MainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Delcare the place where we are getting the cell info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! VAD_CollectionViewCell
        
        // Configure the cell
        cell.vad_CellLabel.text = vad_MainMenu[indexPath.item]
        cell.vad_Detail_CellLabel.text = vad_MenuDetail [indexPath.item]
        
        
        return cell
    }
    
    // Enum for the segue identifier
    enum SegueIdentifier: String {
        case showVad = "vadSEgue"
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Cell \(indexPath.row) tapped")
        
        self.performSegue(withIdentifier: SegueIdentifier.showVad.rawValue, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.showVad.rawValue
        {
            // Identitfy the cell to pass in indexPath
            let cell = sender as! UICollectionViewCell
            
            //Get the indexPAth and pass the cell
            var indexPath = vadCollectionView.indexPath(for: cell)
            
            //SEt variable for all of the titles in the array to pass
            let selectedTitleData = vad_MainMenu[(indexPath?.row)!]
            
            //MARK: - OVerview
            if indexPath?.row == 0 {
                // Set Varibles detailView as the destination to access the variables
                let detailView = segue.destination as! vad_DetailVC
                
                
                //SEt variable for all of the titles in the array to pass
                let selectedTitleData = vad_MainMenu[(indexPath?.row)!]
                
                //The string title in the detail View
                detailView.vadChildTitle = selectedTitleData
                
                // Unhide the View
                detailView.overViewHidden = false
                
                // We hide the button here
                detailView.hideButton = true
                
                //Set attributed text
                detailView.vadChildDescription = changeAttribute_OverView(text: VAD_Explanaton.Overview.display())
                
                
            }
            
            //MARK: - Total Artifical Heart
            
            if indexPath?.row == 1 {
                
                // Set Varibles detailView as the destination to access the variables
                let detailView = segue.destination as! vad_DetailVC
                
                
                // Hide the view
                detailView.overViewHidden = true
                
                // We unhide the button here
                detailView.hideButton = false
                
                //The string title in the detail View
                detailView.vadChildTitle = selectedTitleData
                
                //Name the buttob
                detailView.troubleshootingString = "TAH Troubleshooting"

                detailView.imageString = "TotalArtificialHeart"
                
                // Creat the tag to reference for the button to go to webiste.
               buttonTag = 1
                
                //Set attributed text
                detailView.vadChildDescription = changeAttribute_totalArtifical(text: VAD_Explanaton.TotalArtificialHeart.display())
                
            }
            
            //MARK: - Heart Mate II
            
            if indexPath?.row == 2 {
                // Set Varibles detailView as the destination to access the variables
                let detailView = segue.destination as! vad_DetailVC
                
                //SEt variable for all of the titles in the array to pass
                let selectedTitleData = vad_MainMenu[(indexPath?.row)!]
                
                //The string title in the detail View
                detailView.vadChildTitle = selectedTitleData
                
                // We unhide the button here
                detailView.hideButton = false
                
                //Name of the button
                detailView.troubleshootingString = "HM II Troubleshooting"

                // Hide the view
                detailView.overViewHidden = true
                
                // Creat the tag to reference for the button to go to webiste.
                buttonTag = 2
                
                detailView.imageString = "HeartMateII"
                
                let artificalText =  VAD_Explanaton.HeartMateII.display()
                
                 //Set attributed text
                detailView.vadChildDescription = changeAttribute_totalArtifical(text: artificalText)
                
            }
            
            //MARK: - HVAD
            
            if indexPath?.row == 3 {
                // Set Varibles detailView as the destination to access the variables
                let detailView = segue.destination as! vad_DetailVC
                
                //SEt variable for all of the titles in the array to pass
                let selectedTitleData = vad_MainMenu[(indexPath?.row)!]
                
                //The string title in the detail View
                detailView.vadChildTitle = selectedTitleData
                
                // We unhide the button here
                detailView.hideButton = false
                
                detailView.troubleshootingString = "HVAD Troubleshooting"
                
                // Creat the tag to reference for the button to go to webiste.
                buttonTag = 3
                
                // Hide the view
                detailView.overViewHidden = true
                
                detailView.imageString = "HVAD"
                
                // Set the text from the Enum
                let text = VAD_Explanaton.HVAD.display()
                
                 //Set attributed text
                detailView.vadChildDescription = changeAttribute_totalArtifical(text: text)
                
            }
            
            if indexPath?.row == 4 {
                // Set Varibles detailView as the destination to access the variables
                let detailView = segue.destination as! vad_DetailVC
                
                //SEt variable for all of the titles in the array to pass
                let selectedTitleData = vad_MainMenu[(indexPath?.row)!]
                
                //The string title in the detail View
                detailView.vadChildTitle = selectedTitleData
                
                // We unhide the button here
                detailView.hideButton = false
                
                detailView.troubleshootingString = "Troubleshooting"
                
                // Creat the tag to reference for the button to go to webiste.
                buttonTag = 4
                
                // Hide the view
                detailView.overViewHidden = true
                
                detailView.imageString = "Impella"
                
                // Set the text from the Enum
                let text = VAD_Explanaton.Impella.display()
                
                //Set attributed text
                detailView.vadChildDescription = changeAttribute_totalArtifical(text: text)
                
            }
            
        }
    }
    
    
    func changeAttribute_totalArtifical (text: String) -> NSAttributedString {
        
        // 1 set the changed text to the function
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        
        //4 Delcare the differenct strings we want to single out to be highlighted
        
        //4A
        
        let thisIs = "Overview:"
        let a = "HELLLLLLOOOOO"
        let what = "What to know:"
        
        
        if text.contains(thisIs){
            changedString = thisIs
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(what){
            changedString = what
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(a){
            changedString = a
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
    
    
    func changeAttribute_OverView (text: String) -> NSAttributedString {
        
        // Where do we want to get the text info from ( source )
        let text = VAD_Explanaton.Overview.display()
        
        var changedString = String()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        
        // Delcare the font to be used and set it to the text
        var customFont  = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        // Change the colors of the individual words within the text
        
        let A = " A Ventricular Assist Device (VAD)"
        let B = "Things to Know:"
        let C = "What to know:"
        let D = "VAD Components:"
        let E = "Batteries:"
        let F = "Controller (Think as the computer):"
        let G = "Driveline:"
        let H = "Since blood pressures are challenging to obtain, treat the mean arterial pressure."
        let I = "Use a doppler to obtain the MAP. The first sound heart while taking a BP with the doppler will be the MAP."
        let J = "EKG's are typically not affected by the VAD."
        let K = "02 saturations may be difficult to obtain due to flow."
        let L = "AED's do not affect VAD performance."
        let driveline = "Driveline"
        let N = "Inflow cannula:"
        let O = "Outflow graft:"
        let P = "The pump:"
        let Q = "Critical Pearls for VAD's:"
        let parameters = "Pump Parameters: Flow, Power, and PI (Pulsatility Index)."
        let flow = "Flow:"
        let power = "Power:"
        let PI = "Pulsatility Index (PI):"
        let call = " Call your nearest VAD or Cardiac Transplant center ASAP to assist with troubleshooting."
        let centufugal = "Centrifugal flow:"
        let axial = "Axial flow:"
        
        
        
        if text.contains(centufugal){
            changedString = centufugal
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        
        if text.contains(axial){
            changedString = axial
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        
        
        if text.contains(call){
            changedString = call
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
       
      
        
        if text.contains(PI){
            changedString = PI
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(power){
            changedString = power
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        
        
        if text.contains(flow){
            changedString = flow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        
        if text.contains(parameters){
            changedString = parameters
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(A){
            changedString = A
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(B){
            changedString = B
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(C){
            changedString = C
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(D){
            changedString = D
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(E){
            changedString = E
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(F){
            changedString = F
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(G){
            changedString = G
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(H){
            changedString = H
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(I){
            changedString = I
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(J){
            changedString = J
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(K){
            changedString = K
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(L){
            changedString = L
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(N){
            changedString = N
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(O){
            changedString = O
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(P){
            changedString = P
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(Q){
            changedString = Q
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(driveline){
            changedString = driveline
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
    
    
    
}
