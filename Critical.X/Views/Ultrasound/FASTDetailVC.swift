//
//  FASTDetailVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/12/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit


class FASTDetailVC: UIViewController {

    
    
    @IBOutlet weak var title_Label: UILabel!
    @IBOutlet weak var ultrasoundImageView: UIImageView!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var abnormalFindings: UILabel!
    @IBOutlet weak var probeHertz: UILabel!
    @IBOutlet weak var initialUSImage: UIImageView!
    
    
    // Title of the scan being done
    var fast_Title = String ()
    
    // Image string for the initial image
    var initialImageString = String ()
    
    // Type of probe used
    var probeTitle = String ()
    
    // Name of the string to pass for the image
    var ultraSoundName: String = ""
    
    // Describes abnorma findings
    var abnormalFindingsonScan = NSAttributedString()
    
    // Description of the scan
    var descriptionString = String()

   
   
    
  
    
    @IBAction func dismissmyView(_ sender: Any) {
            
            dismiss(animated: true, completion: nil)
            print("Fast detail View Controller was dismissed")
            
        }
    
    override func viewDidAppear(_ animated: Bool) {
        
        switch setID {
        case 0:
            setRUQ()
            print("setRUQ attribute switch statement func was set. setID received was \(setID)")
        case 1:
            setLUQ()
            print("setLUQ attribute switch statement func was set. setID received was \(setID)")
        case 2:
            setCardiac()
            print("setCardiac attribute switch statement func was set. setID received was \(setID)")
            
        case 3:
            setThoracic()
            print("setThoracic attribute switch statement func was set. setID received was \(setID)")
            
        case 4:
            setPelvic()
            print("setPelvic attribute switch statement func was set. setID received was \(setID)")
            
            
        default:
            detailDescription.text = descriptionString
        }
        
    }
    
    override func viewDidLoad() {

        title_Label.text = fast_Title
        
        initialUSImage.loadGif(name: ultraSoundName)
        
        abnormalFindings.attributedText = abnormalFindingsonScan
        
        detailDescription.text = descriptionString
        
        ultrasoundImageView.image = UIImage(named: initialImageString)
        
        probeHertz.text = probeTitle
        
        // Im setting the description with the corresponding setID here because if they dont load right away in the ViewDidload then there will be a delay in loading the description.
        switch setID {
        case 0:
            descriptionString = UltraSound_AcousticViewDescription.RUQ_morrisonsTextDescription.rawValue
        case 1:
            descriptionString = UltraSound_AcousticViewDescription.leftUpperQuadrant.rawValue
        case 2:
            descriptionString = UltraSound_AcousticViewDescription.CardaicView.rawValue
        case 3:
            descriptionString = UltraSound_AcousticViewDescription.Thoracic.rawValue
        case 4:
            descriptionString = UltraSound_AcousticViewDescription.Pelvic.rawValue
            
        
        default:
            break
        }
    }
    
  
    
// Helper function for the passed data
    func updatePassedData() {
    
        // Set the outlets to the passed strings.
        
        
        
        
    }
    

 
    // IMAGES THAT WILL BE PASSED THROUGHT TO THE CONTAINER VIEW
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    
        //MARK: - PASS DATA  TO CONTAINER VIEWS Images and Labels, The conditionals are containerview, segue.identifier and SETID. We only change this.
        
        
        
        
        //RUQ View
        if let container = segue.destination as? containerFastVC, segue.identifier == "TestContainer", setID == 0 {
            
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            container.imgOneString = UltraSoundImages.RUQAnatomy.rawValue
            container.descriptionStringOne = "RUQ Anatomy"
            
            // Second Picture GIF
            container.imgTwoString = "Pathology-RUQ"
            container.descriptionStringTwo = "Free fluid Morison's Pouch"
            
            // Second Picture Image
            container.imgThreeString = UltraSoundImages.PathologyRUQ_Image.rawValue
            container.descriptionStringThree = "Free fluid Morison's Pouch"
            
            // Third Image
            container.imgFourString = "Pathology_RUQ_ParaglottcFreeFluid"
            container.descriptionStringFour = "Free fluid paracolic gutter"
        }
        
        
        
        
        
        //MARK: - WE ONLY CHANGE THE SET IT - LUQ View
        if let container = segue.destination as? containerFastVC, segue.identifier == "TestContainer", setID == 1 {
            
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            container.imgOneString = UltraSoundImages.LUQProbeAnatomy.rawValue
            container.descriptionStringOne = "LUQ Anatomy"
            
            // Second Picture GIF Pathology
            container.imgTwoString = UltraSoundImages.Pathology_LUQ_PosFast1.rawValue
            container.descriptionStringTwo = "LUQ Hemoperitoneum"
            
            // Second Picture Image Pathology with color
            container.imgThreeString = UltraSoundImages.Pathology_LUQ_Img.rawValue
            container.descriptionStringThree = "Perisplenic free fluid"
            
            // Third Image Pathology GIF
            container.imgFourString = UltraSoundImages.Pathology_LUQ_PosFAST2.rawValue
            container.descriptionStringFour = "Free fluid paracolic gutter"
        } // End segue
        
        
        
        
        //MARK: - Cardiac View
        if let container = segue.destination as? containerFastVC, segue.identifier == "TestContainer", setID == 2 {
            
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            container.imgOneString = UltraSoundImages.SubxyphoidImg.rawValue
            container.descriptionStringOne = "Cardiac Anatomy"
            
            // Second Picture GIF Pathology
            container.imgTwoString = UltraSoundImages.PericardialEffusion_GIF.rawValue
            container.descriptionStringTwo = "Cardiac Tamponade"
            
            // Second Picture Image Pathology with color
            container.imgThreeString = UltraSoundImages.SubXiphoidEffusionImage.rawValue
            container.descriptionStringThree = "Cardiac Tamponade w/ RV collapse"
            
            // Third Image Pathology GIF
            container.imgFourString = UltraSoundImages.PLAX_EffusionGIF.rawValue
            container.descriptionStringFour = "PLAX-Pericardial effusion"
        } // End segue
        
        
        
        
        //MARK: - Thoracic container viewa
        if let container = segue.destination as? containerFastVC, segue.identifier == "TestContainer", setID == 3 {
            
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            container.imgOneString = UltraSoundImages.ThoracicAnatomy.rawValue
            container.descriptionStringOne = "Thoracic Anatomy"
            
            // Second Picture GIF Pathology
            container.imgTwoString = UltraSoundImages.NormalLungVPTX.rawValue
            container.descriptionStringTwo = "Normal vs. PTX"
            
            // Second Picture Image Pathology with color
            container.imgThreeString = UltraSoundImages.MMode.rawValue
            container.descriptionStringThree = "Seashore sign, M-Mode"
            
            // Third Image Pathology GIF
            container.imgFourString = UltraSoundImages.LungPointSignGif.rawValue
            container.descriptionStringFour = "Lung Point Sign"
        } // End segue
        
        
        
        
        //MARK: - Pelvic container viewa
        if let container = segue.destination as? containerFastVC, segue.identifier == "TestContainer", setID == 4 {
            
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            container.imgOneString = UltraSoundImages.NormalFemalePelvic_ShortAX_GIF.rawValue
            container.descriptionStringOne = "Normal female scan"
            
            // Second Picture GIF Pathology
            container.imgTwoString = UltraSoundImages.NormalMALEPelvic_ShortAX_GIF.rawValue
            container.descriptionStringTwo = "Normal male scan"
            
            // Second Picture Image Pathology with color
            container.imgThreeString = UltraSoundImages.Pelvic_Pelvic_PosFast1.rawValue
            container.descriptionStringThree = "Intraperitoneal Free Fluid - Male"
            
            // Third Image Pathology GIF
            container.imgFourString = UltraSoundImages.PosFast_Female_Pelvis.rawValue
            container.descriptionStringFour = "Free Fluid Pelivs - Female"
        } // End segue
        
        
        
        
        
        //MARK: - Sends main Image to the FAST Image Pop View Controller no setID
       
        
        if let sendMain = segue.destination as? FAST_ImagePop, segue.identifier == "MainImg" {
            // We set the ID as 15 so we can reference it in the FAST Imge pop VC
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            setID = 15
            sendMain.imgOneString_pop = ultraSoundName
            sendMain.imgTitle = fast_Title
            
            print("The USName is \(ultraSoundName) which was triggered")
            
        } // End segue

    }
    
    
    // Setting string attributes
    func setRUQ()
    {
        let text = UltraSound_AcousticViewDescription.RUQ_morrisonsTextDescription.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: "most sensitive region")
        
        attributedText.apply(font: UIFont(name: "HelveticaNeue-Bold", size: 15)!, subString: "most sensitive region")

        attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: "Probe Indicator")
        
        attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: "Hepatorenal Recess")
        
        attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: "Inferior hepatic edge/inferior pole of kidney")
        
        attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: "The diaphragm")
        
        attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "Technique")

        attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: "Pleural Space")
        
        attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: "Morisons Pouch")
        
        attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: "lower edge and tip of the liver")
        
        attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: "Below you can see a full sweep of the RUQ. Notice the landmarks.")
        self.detailDescription.attributedText = attributedText
    }

    func setLUQ() {
    
        let text = UltraSound_AcousticViewDescription.leftUpperQuadrant.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let probe = "Probe Indicator"
        let technique = "Technique"
        let koeller = "Koller's pouch"
        let sri = "Spenorenal Interface"
        let inferior = "Inferior tip of the spleen"
        let diaphragm = "The diaphragm, above and below"
        let itslenn = "Inferior tip of the spleen"
        let pole = "Inferior Pole of the Left Kidney"
        let sweep = "Below you can see a full sweep of the LUQ. Notice the landmarks."
        let hyperechoicline = "hyperechoic line"
        let subfrenic = "subphrenic space"
        let anechoic = "anechoic (jet black)"
        if text.contains(probe){
            changedString = probe
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }

        if text.contains(technique){
            changedString = technique
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(koeller){
            changedString = koeller
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(sri){
            changedString = sri
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(inferior){
            changedString = inferior
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(diaphragm){
            changedString = diaphragm
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(itslenn){
            changedString = itslenn
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(pole){
            changedString = pole
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(sweep){
            changedString = sweep
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(hyperechoicline){
            changedString = hyperechoicline
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(subfrenic){
            changedString = subfrenic
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(anechoic){
            changedString = anechoic
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        self.detailDescription.attributedText = attributedText

    }

    
    func setCardiac() {
    
    
        let text = UltraSound_AcousticViewDescription.CardaicView.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let probe = "Probe Indicator"
        let technique = "Technique"
        let subxy = "Subxyphoid"
        let plax = "Parasternal Long Axis (PLAX)"
        let psax = "Parasternal Short Axis (PSAX)"
       let below = "Below you can see an overview of the subxiphoid view. Notice the landmarks."
        
        
        if text.contains(probe){
            changedString = probe
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(technique){
            changedString = technique
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
    
        if text.contains(subxy){
            changedString = subxy
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(plax){
            changedString = plax
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(psax){
            changedString = psax
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(below){
            changedString = below
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        self.detailDescription.attributedText = attributedText

    }
 
    func setThoracic() {
        
        
        let text = UltraSound_AcousticViewDescription.Thoracic.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let probe = "Probe Indicator"
        let technique = "Technique"
        let anterior = "Anterior Chest"
        let lateral = "Lateral Chest Wall"
        let costrophrenic = "Costophrenic Angle"
        let alines = "A-line lines"
        let lungsliding = "lung sliding"
        let batWing = "\"bat wing\" sign"
        
        if text.contains(probe){
            changedString = probe
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
    
    
        if text.contains(technique){
            changedString = technique
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1) , subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(anterior){
            changedString = anterior
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(lateral){
            changedString = lateral
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(costrophrenic){
            changedString = costrophrenic
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(costrophrenic){
            changedString = costrophrenic
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(alines){
            changedString = alines
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(lungsliding){
            changedString = lungsliding
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(batWing){
            changedString = batWing
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        
        self.detailDescription.attributedText = attributedText

}

    func setPelvic() {
        
        let text = UltraSound_AcousticViewDescription.Pelvic.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let probe = "Probe Indicator"
        let technique = "Technique"
        let long = "Longitudinal (Cephalad)"
        let transverse = "Transverse"
        let pouch = "pouch of douglas"
        let rectovesical = "rectovesical pouch"
        let culdesac = "pelvic Cul de Sac"
        
        if text.contains(probe){
            changedString = probe
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(technique){
            changedString = technique
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(long){
            changedString = long
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9215686275, blue: 0.6745098039, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(transverse){
            changedString = transverse
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9215686275, blue: 0.6745098039, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(pouch){
            changedString = pouch
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9215686275, blue: 0.6745098039, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(rectovesical){
            changedString = rectovesical
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9215686275, blue: 0.6745098039, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(culdesac){
            changedString = culdesac
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9215686275, blue: 0.6745098039, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
      
        
        self.detailDescription.attributedText = attributedText
        
        
    }



} //end of the class
