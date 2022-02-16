//
//  _12Lead_Collection_VC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/9/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

private let reuseIdentifier = "Cell"

class _12Lead_Collection_VC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet weak var EKGTitleLabel: AKLabel!
    @IBOutlet weak var ekg12CollectionView: UICollectionView!
   
    @IBOutlet weak var closeButton: UIButton!{
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    var ekgTitles = [String]()
    var ekgSubtitles = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EKGTitleLabel.animate(text: "12 Lead EKG Morphology, Assessments & Criteria", duration: 1, completion: nil)

        ekgTitles = ["Lead Overview", //0
            "Lead Axis", // 1
            "Anterior & Septal",// 2
            "Inferior Wall",// 3
            "Lateral Wall",// 4
            "Brugada's",// 5
            "Wellen's",// 6
            "Sgarbossa's"] //7
        
        ekgSubtitles = ["LEAD ASSESSMENT AND MORPHOLOGY",
                        "LEARN THE AXIS OF THE HEART",
                        "OVERVIEW OF THE ANTERIOR AND SEPTAL WALL",
                        "OVERVIEW OF AN INFERIOR WALL  INFARCTION",
                        "OVERVIEW OF A LATERAL WALL INFARCTION",
                        "SYNDROME",
                        "SYNDROME",
                        "CRITERIA",]

    }

  

    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ekgTitles.count
    }

    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! _12Lead_Collection_Cell
    
        // Configure the cell. Set the title and subtitles to the arrays above.
        cell.titleLabel.text = ekgTitles[indexPath.item]
        cell.subTitle.text = ekgSubtitles [indexPath.item]
        
        
    
        return cell
    }

    //MARK: - Segue ID
    enum SegueID: String {
        case Lead12Segue
        
    }
    
    //MARK: - EKG Name ENUM
    enum EKGImageNames: String {
        case EkGBasics
        case AxisDeviation
        case AnteriorWall = "12Lead_AnteriorWall_Image"
        case AnteriorWallMIEKG
        case BrugadaSyndrome
        case wellensEKG
        case InferiorWallHeart
        case InferiorWallMInew
        case LateralWallEkg
        case LateralWallHeart
        case sgarbossas
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       
        print("Cell \(indexPath.row) tapped")
        
        self.performSegue(withIdentifier: SegueID.Lead12Segue.rawValue, sender: self)
        
    }
    
    
    
    //MARK: - Passing Detail from the collectionView
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueID.Lead12Segue.rawValue
            
        {
            // Identitfy the cell to pass in indexPath
            let cell = sender as! UICollectionViewCell
            
            //Get the indexPAth and pass the cell
            var indexPath = ekg12CollectionView.indexPath(for: cell)
            
            //SEt variable for all of the titles in the array to pass
            let selectedTitleData = ekgTitles[(indexPath?.row)!]
            
            
            
            
            //MARK: - OVerview
            if indexPath?.row == 0 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                // Allow the 12 lead image to be hidden by setting to true
                ekgDetailView.display12LeadImage = true
            
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribte
                ekgDetailView.DescriptionString_1 = overViewAttribute(text: EKGDescription.Overview.rawValue)
                
                // Set the string name of the image to be passed.
                ekgDetailView.imageString = EKGImageNames.EkGBasics.rawValue
               
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 1
                
                //Set attributed text
//                detailView.vadChildDescription = changeAttribute_OverView(text: VAD_Explanaton.Overview.display())
                
            }
           
        
            //MARK: - Axis
            if indexPath?.row == 1 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                // Allow the 12 lead image to be hidden by setting to true
                ekgDetailView.display12LeadImage = true

                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_1 = leadAxis_Attribute(text: EKGDescription.LeadAxis.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.AxisDeviation.rawValue
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 1
                
                print("\(indexPath) index path was selected")
                
        
            }
            
            //MARK: - Anterior Wall
            if indexPath?.row == 2 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
            
                
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_2 = anteriorWall_Attribute(text: EKGDescription.AnteriorWall.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.AnteriorWallMIEKG.rawValue
                
                
                // Set the string name of the image to be passed.
                ekgDetailView.imageString_12Lead = EKGImageNames.AnteriorWall.rawValue
                
                // Allow the 12 lead image to be visible by setting to false
                ekgDetailView.display12LeadImage = false
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 2
                
                print("\(indexPath) index path was selected")
                
            }
            
            //MARK: - Inferior Wall
            if indexPath?.row == 3 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_2 = inferiorWall_Attribute(text: EKGDescription.InferiorWall.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.InferiorWallMInew.rawValue
                
                
                // Set the string name of the image to be passed.
                ekgDetailView.imageString_12Lead = EKGImageNames.InferiorWallHeart.rawValue
                
                // Allow the 12 lead image to be visible by setting to false
                ekgDetailView.display12LeadImage = false
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 2
                
                print("\(indexPath) index path was selected")
                
            }
        
            
            //MARK: - lateral Wall
            if indexPath?.row == 4 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_2 = lateralWall_Attribute(text: EKGDescription.LateralWall.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.LateralWallEkg.rawValue
                
                
                // Set the string name of the image to be passed.
                ekgDetailView.imageString_12Lead = EKGImageNames.LateralWallHeart.rawValue
                
                // Allow the 12 lead image to be visible by setting to false
                ekgDetailView.display12LeadImage = false
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 2
                
                print("\(indexPath) index path was selected")
                
            }
            
            
            
            //MARK: - Brugadas
            if indexPath?.row == 5 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_1 = brugada_Attribute(text: EKGDescription.BrugadaSyndrome.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.BrugadaSyndrome.rawValue
                
                // Allow the 12 lead image to be visible by setting to false
                ekgDetailView.display12LeadImage = true
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 1
                
                print("\(indexPath) index path was selected")
                
            }
            
            //MARK: - Wellens
            if indexPath?.row == 6 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_1 = wellens_Attribute(text: EKGDescription.WellensCriteria.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.wellensEKG.rawValue
                
                // Allow the 12 lead image to be visible by setting to false
                ekgDetailView.display12LeadImage = true
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 1
                
                print("\(indexPath) index path was selected")
                
            }
            
            
            
            //MARK: - Sgarbossas
            if indexPath?.row == 7 {
                // Set Varibles detailView as the destination to access the variables
                let ekgDetailView = segue.destination as! _12Lead_DetailViewController
                
                
                //The string title in the detail View
                ekgDetailView.titleString = selectedTitleData
                
                // set the function and pass enum attribute
                ekgDetailView.DescriptionString_1 = sgarbossas_Attribute(text: EKGDescription.SgarbossasCriteria.rawValue)
                
                // Set the string name of the MAIN image to be passed.
                ekgDetailView.imageString = EKGImageNames.sgarbossas.rawValue
                
                // Allow the 12 lead image to be visible by setting to false
                ekgDetailView.display12LeadImage = true
                
                // Set the ID so that we can switch on it for scrolling.
                ekgDetailView.identifier = 1
                
                print("\(indexPath) index path was selected")
                
            }
            
            
            
        } // If segue.iD
    
    } // PRepare for segue
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("12 Lead Collection View Controller was dismissed")
        
    }
}
