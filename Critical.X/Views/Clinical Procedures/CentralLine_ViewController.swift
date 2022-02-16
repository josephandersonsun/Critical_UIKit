//
//  CentralLine_ViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/25/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

//Global variable to use to ID the images being passed.
var segueName = String()

class CentralLine_ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var centralLineInfoLabel: UILabel!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageOneLbl: UILabel!
    @IBOutlet weak var techniqueLabel: UILabel!
    @IBOutlet weak var confirmationLabel: UILabel!
    @IBOutlet weak var confimationImageONE: UIImageView!
    @IBOutlet weak var confirmationImageTWO: UIImageView!
    @IBOutlet weak var cathPlacementLabel: UILabel!
    
    var centralLineInfo = String ()
    var technique = String ()
    var imageOneDescription = String()
    var confirmation = String()
    var catheterPlacementString = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Helper function
        loadInfo()
        
        // Loads text to the label
        confirmationLabel.text = confirmation
        //cathPlacementLabel.text = catheterPlacement
        
        // Call the attribute functions
        setFirstLable()
        setImgOneDescription()
        setTechnique()
        setConfirmation()
        //Image one description and Gif
        // Load the GIF images to play
        imageOne.loadGif(name: "CentralLine-Anatomy")
        //imageOneLbl.text = imageOneDescription

        imageTwo.loadGif(name: "CentralLine_ColorDoppler")

        confimationImageONE.loadGif(name: "CentralLine_LongAxisTenting")
        confirmationImageTWO.loadGif(name: "CentralLine_NeedleTenting")
        // Do any additional setup after loading the view.
    }
    

    func loadInfo() {
        
       
        // Setting the initial text to the label
        
        // Intro text
        centralLineInfo =
        """
        \rCentral venous catheterization is necessary to monitor hemodynamics, administer medications and fluids in critically ill patients. It can also be used as a conduit for Pulmonary Artery catheters, transvenous pacemakers, defibrillators, CRRT, plasmapheresis, hemodialysis catheters, and venous stenting.
        \rAnatomic sites for the catheter can vary. The central line can be placed in the jugular, subclavian vein, brachial and femoral vein(s). Venous mapping is considered the standard of care, as it can provide catheter guidance into the proper vein, limit insertion complications and catheter tunneling."
        """
        
        // Description of the first images.
        imageOneDescription = "Below is a sagittal view of the neck. The internal jugular vein is the larger compressible vessel (below to the left) and blue (on the bottom right) and the right common carotid just below (red)."
        
        
        // Central Line steps and techniques.
        technique =
        """
        \rFirst place the ultrasound in the area of the neck and map out the anatomy of the Carotid artery and Internal Jugular vein.
        The two traditional views to map out the anatomy will be the short axis and long axis views.
        \rCannulation of the right jugular vein is generally preferred as compared to the left because it provides more direct access to the right atrium, avoids the thoracic duct, reduces procedure time, and is associated with fewer complications.
        \r Preparation:
        \r • Check consent • Check vitals • Check for anti-coagulants and INR • Make sure that the QRS complex volume in up to ensure that any arrhythmias are identified while performing the procedure. • Check and prepare materials in the central line kit • Check equipment and ultrasound • Prep & drape the patient • TIMEOUT.
        
        \r1. Insert the needle at the apex of the triangle formed by the sternocleidomastoid muscle and clavicle.
        \r2. Angle the needle at approximately 30 degrees and aim towards the ipsilateral nipple. Make sure that the needle is not perpendicular to the vein. Introduce needle while aspirating.
        \rThe jugular vein is found about 2 to 3 cm above the clavicle. However, it is better to go a little bit higher in a triangle to ensure to reduce any possibility of a pneumothorax.
        \r3. Once the vein is cannulated, insert the guidewire and remove the needle.
        \r4. Confirm the guidewire is in the vein via ultrasound.
        \r5. Incise the skin at the entry point of the guidewire.
        \r6. Insert the dilator over the guidewire.
        \r7. Remove the dilator over the guidewire making sure to control the guidewire.
        \r8. Insert catheter over the guidewire to the desired length.
        \r9. Aspirate blood from each port.
        \r10. Suture the catheter in place and apply a sterile dressing.
        \r11. Confirm placement via CXR (jugular and subclavian approaches).
        """
        confirmation = """
        \rThe ultrasounds below demonstrate the point of venous cannulation. You can appreciate \" venous wall tenting\" (sagittal view on the right), and the entrance of the needle into the vein via a long axis view.
        """
        
        catheterPlacementString = """
        \rCXR Confirmation:
        \rThe catheter is oriented vertically as shown in the CXR below.
        \rThe tip is projected over the anatomical location of the SVC just proximal to the cavo-atrial junction- approximately 1.5 cm above the level of the carina.
        \rThis is an ideal position for right-sided catheters for fluid administration and venous pressure monitoring, but not for long-term chemotherapy or dialysis.
        """
        
    }

    
    
    @IBAction func dismissCentralLine(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Central Line View Controller was dismissed")
        
    }
    
    
    // Here when the button is pressed, we send the segue and pass the global variable and switch on it.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainImage" {
            segueName = "main"
        }
        
        if segue.identifier == "IJ" {
            segueName = "IJ"
        }
        
        
        if segue.identifier == "doppler" {
            
            segueName = "dopplerImage"
        }
        
        
        if segue.identifier == "threeImages" {
            
            segueName = "threeImages"
        }
        
        
        if segue.identifier == "plaxTenting" {
            
            segueName = "plaxTenting"
        }
        
        if segue.identifier == "shortAxisTenting" {
            
            segueName = "shortAxisTenting"
        }
        
        if segue.identifier == "cxrPlacement" {
            
            segueName = "cxrPlacement"
        }
    }

    
    // Chnage the attributes of the centralLine information.
    func setFirstLable() {
        // Text coming from here
        let text = centralLineInfo
        
        //set the attributes
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        attributedText.apply(color: Colorify.Alizarin, subString: "Central venous catheterization")
        
        // Set the text label attribute to the text
        self.centralLineInfoLabel.attributedText = attributedText
    }
    
    
    // Chnage the attributes of the centralLine information.
    func setConfirmation() {
        // Text coming from here
        let text = catheterPlacementString
        
        //set the attributes
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: "CXR Confirmation:")
        attributedText.apply(color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), subString: "just proximal to the cavo-atrial junction")

        // Set the text label attribute to the text
        self.cathPlacementLabel.attributedText = attributedText
    }
    
    
    // Set the description label attributes
    func setImgOneDescription() {
        // The text is coming from here
        let text = imageOneDescription
        
        //SEt the attributes
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: "sagittal view")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "compressible")
        attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "blue")
        attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: "(red)")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "internal jugular vein")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "common carotid")
        
        // Set the text label attribute to the text
        self.imageOneLbl.attributedText = attributedText
    }
    
    // Set the description label attributes
    func setTechnique() {
        // The text is coming from here
        let text = technique
        
        //Set the attributes
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: "apex of the triangle")
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: "Preparation:")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "Check consent")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "Check for anti-coagulants and INR")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "internal jugular vein")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "prepare materials")
        attributedText.apply(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), subString: "Prep & drape the patient")
        attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "TIMEOUT")
        attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "•")
        // Technique:
        attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: "2. Angle the needle at approximately 30 degrees and aim towards the ipsilateral nipple. Make sure that the needle is not perpendicular to the vein. Introduce needle while aspirating.")
        attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: "The jugular vein is typically found about 2 to 3 cm above the clavicle, However, it’s better to go a little bit higher in a triangle because you want to reduce any possibility of a pneumothorax")
        attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: "4. Confirm the guidewire is in the vein via ultrasound.")
        attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: "6. Insert the dilator over the guidewire.")
        
        attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: "8. Insert catheter over the guidewire to the desired length.")
        
        attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: "10. Suture the catheter in place and apply a sterile dressing.")
        
        // Set the text label attribute to the text
        self.techniqueLabel.attributedText = attributedText
    }
    
}


