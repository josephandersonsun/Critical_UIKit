//
//  ClinReferencesViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 5/13/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit


// MARK: - UICollectionViewDelegate


class ClinReferencesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
  
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    // Main Title
    var referenceTitles = [String]()
    
    // Subtitles
    var referenceLinks = [String]()
    
    override func viewDidLoad() {
        
        //method to resize the tableView Cell.
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
//        }
        super.viewDidLoad()

// SEt the titles
        referenceTitles = [
        
            "SAH",
        
            "ICH",
        
            "Increased ICP",
        
            "Fetal Heart Monitoring",
        
            "Cincinatti Stroke",
        
            "Neuro Assessment",
        
            "IABP",
        
            "V-Tach",
        
            "Ultrasound Guided CVC",
        
            "ACLS 2015 Update",
        
            "EKG's / Brugada's",
        
            "Pharm / IV Infusions",
        
            "Pharm - Benzos",//
        
            "Pharm - Benadryl",//
        
            "Pharm - Diltiazem",//
        
            "Pharm - Etomidate",//
        
            "Pharm - Etomidate",//
        
            "Pharm - Giapreza",//
        
            "Pharm - Cleviprex",//
        
            "Pharmacology",//
        
            
        
            "Lab Values",
        
            "Lab - Chemistry",
        
            "Lab - CMP",
        
            "Airway",
        
            "Airway",
        
            "Mechanical Ventilation",
        
            "Ventilation Modes",
        
            "Mechanical Ventilation",
        
            "Central Lines",
        
            "Hemodynamics",
        
            "Hemodynamics",
        
            "Ultrasound",
        
            "VAD- Impella",
        
            "VAD",
        
            "Total Artificial Heart",
        
            "LVAD",
        
            "LVAD",
        
            "LVAD",
        
            "Pediatrics",
        
            "Pediatrics",
        
            
        
            "Pediatrics",
        
            "Peds Age ",
        
            "Peds Fluid",
        
          
        
        
        ]
        
        referenceLinks = [
            //SAH
            """
            "Subarachnoid Hemorrhage, Spontaneous.\" Quick Medical Diagnosis & Treatment 2017 Eds. Maxine A. Papadakis, and Stephen J. McPhee. New York, NY: McGraw-Hill"
            """,
            
            //ICH
            "Ropper, Alexander E., and Allan H. Ropper.\"Intracranial Hemorrhage and Related Conditions.\" Principles and Practice of Hospital Medicine, 2e Eds. Sylvia C. McKean, et al. New York, NY: McGraw-Hill",
            
            //Increased ICP
            "Mariano, Geraldine Siena L., et al. \"Intracranial Pressure: Monitoring and Management.\" Principles of Critical Care, 4e Eds. Jesse B. Hall, et al. New York, NY: McGraw-Hill, 2014",
            
            // FHM
            "\"Intrapartum Assessment.\" Williams Obstetrics, Twenty-Fourth Edition Eds. F. Gary Cunningham, et al. New York, NY: McGraw-Hill, 2013",
            
            // Cincinatti Stroke
            "Kothari, R., Hall, K., Brott, T., & Broderick, J. (1997). Early stroke recognition: Developing an out-of-hospital NIH Stroke Scale. Academic Emergency Medicine., 4(10), 986-990.",
            //Neurological Assessment
            "McClintic, Michelle M., and Shawn D. Horrall.. \"Coma.\" CURRENT Diagnosis & Treatment: Emergency Medicine, 8e Eds. C. Keith Stone, and Roger L. Humphries. New York, NY: McGraw-Hill",
            // IABP
            "Casey, Glass, and Manthey David.. \"Cardiogenic Shock.\" Tintinalli’s Emergency Medicine: A Comprehensive Study Guide, 8e Eds. Judith E. Tintinalli, et al. New York, NY: McGraw-Hill, 2016",
            // V-Tach
            "Bradfield, Jason S., et al.. \"VENTRICULAR ARRHYTHMIAS.\" Hurst's The Heart, 14e Eds. Valentin Fuster, et al. New York, NY: McGraw-Hill",
            
            // US Guided CVC
            "Pandit, Amit, et al. \"Central Venous Access.\" Critical Care Eds. John M. Oropello, et al. New York, NY: McGraw-Hill",
            
            // ACLS
            "Richard O. Cummins; major contributors, John M. Field, Mary Fran Hazinski; special contributors, Charles F. Babbs ... [and others]. ACLS Provider Manual. Dallas, Tex.: American Heart Association, 2002. Print.",
            
            // EKG Interpretation
            "Surawicz B, et al. AHA/ACCF/HRS Recommendations for the Standardization and Interpretation of the Electrocardiogram. Circulation. 2009; doi:10.1161/CIRCULATIONAHA.108.191095.",
            
            // Pharm / IV Infusions
            "Vallerand, April H, Cynthia A. Sanoski, and Judith H. Deglin. Davis's Drug Guide for Nurses., 2017. Internet resource. Nurse's Drug Handbook. Sudbury, MA: Jones and Bartlett Publishers, 2000. Print.",
            
            // Benzodiazepines
            "Haefely W: Synaptic pharmacology of barbiturates and benzodiazepines. Agents Actions 1977; 7:353-359",
            
            //
            "Product Information: BENADRYL(R) injection solution, diphenhydramine hydrochloride injection solution. Parkdale Pharmaceuticals, Inc, Rochester , MI, 2001",
            
            //
            "Product Information: diltiazem hydrochloride intravenous solution. Bedford Laboratories, Bedford, OH, 2005.",
            
            //
            "Gooding JM, Weng JT, Smith RA, et al: Cardiovascular and pulmonary responses following etomidate induction of anesthesia in patients with demonstrated cardiac disease.. Anesth Analg 1979; 58:40-1.",
            
            //
            "Product Information: Amidate. Abbott, US, 97.",
            
            //
            "Giapreza (angiotensin II) [prescribing information]. San Diego, CA; La Jolla Pharmaceutical Company: December 2017.",
            
            //
            "Cleviprex (clevidipine) [prescribing information]. Cary, NC: Chiesi USA Inc; August 2017.",
            
            //
            "Funder JW, Carey RM, Mantero F, et al. The management of primary aldosteronism: case detection, diagnosis, and treatment: an Endocrine Society Clinical Practice Guideline. J Clin Endocrinol Metab. 2016;101(5):1889-1916. doi: 10.1210/jc.2015-4061. [PubMed 26934393]",
            
            
            // Lab Values
            "Pagana, Kathleen Deska, and Timothy James Pagana. Mosby's Diagnostic and Laboratory Test Reference. 13th ed. St. Louis, Mo.; London: Mosby, 2015.",
            
            //
            "Chapter 4. Laboratory Diagnosis: Chemistry, Immunology, Serology.\"Clinician's Pocket Reference: The Scut Monkey, 11e Eds. Leonard G. Gomella and Steven A. Haist. New York, NY: McGraw-Hill, 2007\"",
            
            //
            "Malarkey, L, and McMorrow, M: Nurses’s Manual of Laboratory Tests and Diagnostic Procedures, ed 2. WB Saunders, Philadelphia, 2000. ",
            
            //
            "Walls  R, Murphy M. Chapter 7: Identification of the Difficult Airway. Manual of Emergency Airway Management. Third Edition. Lippincott Williams & Wilkins.",
            
            //
            "Courtesy of Richard M. Levitan, M.D. Airway Cam, Technogolgies, Inc. Available from www.airwaycam.com",
            
            //
            "Papadakos PJ, et al. Pressure-controlled ventilation: Review and new horizons. Clin Pulm Med 1998;5: 120-123.",
            
            //
            "Brochard, Laurent J., and Francois Lellouche.. \"Chapter 8. Pressure-Support Ventilation.\" Principles and Practice of Mechanical Ventilation, 3e Ed. Martin J. Tobin. New York, NY: McGraw-Hill, 2013.",
            
            //
            "Hess, D. R., & Kacmerek, R. M. (2002). Essentials of mechanical ventilation (2nd ed.). New York: McGraw-Hill.\n\nOwens, W. (2012). The ventilator book. Lexington, KY: First Draught Press.",
            
            //
            "Bpwdoe. A. (2014). Vascular complications of central venous catheter placement: Evidence-based methods for prevention and treatment. Journal of Cardiothoracic and Vascular Anaesthesia. 28(2), 358-368.",
            
            //
            "Dvorak G.O., Hemodynamic Monitoring: Invasive and Non Invasive Clinical Application. 2008 ed 4. Saunders.\n\nKlabunde R.E., Cardiovascular Physiology Concepts. 2005. Lippincott Williams & Wilkins.",
            
            //
            "De Backer, Daniel and Jean-Louis Vincent. “Should we measure the central venous pressure to guide fluid management? Ten answers to 10 questions” Critical care (London, England) vol. 22,1 43. 23 Feb. 2018, doi:10.1186/s13054-018-1959-3",
            
            //
            "Notice.\" Pocket Guide to POCUS: Point-of-Care Tips for Point-of-Care Ultrasound Eds. Cameron M. Baston, et al. New York, NY: McGraw-Hill, , http://accessmedicine.mhmedical.com/content.aspx?bookid=2544&sectionid=210277485.",
            
            //
            "Griffith, Kevin & Jenkins, Eric. (2010). Abiomed Impella® 2.5 patient transport: Lessons learned. Perfusion. 25. 381-6. 10.1177/0267659110381450.",
            
            //
            "McGee, Jr., Edwin C., and Nader Moazami.. \"Temporary Mechanical Circulatory Support.\" Cardiac Surgery in the Adult, 5e Eds. Lawrence H. Cohn, and David H. Adams. New York, NY: McGraw-Hill,",
            
            //
            "Baldwin, Andrew C. W., et al.. \"Long-term Mechanical Circulatory Support and the Total Artificial Heart.\" Cardiac Surgery in the Adult, 5e Eds. Lawrence H. Cohn, and David H. Adams. New York, NY: McGraw-Hill.",
            
            //
            "Scott Weingart. Left Ventricular Assist Devices (LVADS). EMCrit Blog. Published on July 8, 2012. Accessed on March 4th 2019. Available at [https://emcrit.org/emcrit/left-ventricular-assist-devices-lvads-2/].",
            
            //
            "Slaughter MS, Pagani FD, Rogers JG, et al. Clinical management of continuous-flow left ventricular assist devices in advanced heart failure. J Heart Lung Transplant. 2010;29(4 Suppl):S1-39.",
            
            //
            "ASTNA patient transport; principles and practice, 4th ed.\" SciTech Book News, Dec. 2009. Academic OneFile, http://link.galegroup.com/apps/doc/A213545160/AONE?u=miami_richter&sid=AONE&xid=8b626a93. Accessed 6 Mar. 2019.",
            
            //
            "Hoyle JD, Davis AT, Putman KK, et al. Medication dosing errors in pediatric patients treated by emergency medical services. Prehosp Emerg Care. 2012;16(1):59–66.",
            
            //
            "Doherty C, McDonnell C. Tenfold medication errors: 5 years’ experience at a university-affiliated pediatric hospital. Pediatrics. 2012; 129(5)916–924.",
            
            
            
            //
            "Lammers R, Byrwa M, Fales W. Root causes of errors in a simulated prehospital pediatric emergency. Acad Emerg Med. 2012;19(1):37–47.",
            
            //
            "Sandell JM, Charman SC. Can age-based estimates of weight be safely used when resuscitating children? Emerg Med J. 2009;26(1):43–47.",
            
            //
            "Holliday MA, Segar WE. The maintenance need for water in parenteral fluid therapy. Pediatrics. Vol. 19, 1957 823-832.",
            
            
        
        
        ]
        
    }
    
    @IBAction func dismissClinicalView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ClinReferencesViewController {

    
   
        // MARK: UICollectionViewDataSource
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of items
            return referenceTitles.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            //Delcare the place where we are getting the cell info
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ReferencesCollectionViewCell
            
            // Configure the cell from the oulets in the cell Class.
            cell.titleLabel.text = referenceTitles [indexPath.item]
            cell.detailLabel.text = referenceLinks [indexPath.item]
            
            // We are changing the color of the Detail Subtitle only here.
            return cell
        }
    
        // Pass the data from the cells and data to the detailView Controller.
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        
                
                switch indexPath.item {
                    
                    //  Segue to the reference page from each cell. //  Opens the webView outside the app no VC

                case 0: //SAH
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=2033&sectionid=152418156.") {
                        UIApplication.shared.open(url, options: [:])
                    }
                    
                case 1 ://ICH
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=1872&sectionid=146986569") {
                        UIApplication.shared.open(url, options: [:])
                    }
                
                case 2 : // Increased ICP
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=1340&sectionid=80036194") {
                        UIApplication.shared.open(url, options: [:])
                    }
                case 5 : // Neuro Asssessment
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=2172&sectionid=165059921.") {
                        UIApplication.shared.open(url, options: [:])
                    }
                case 6 : // IABP
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=1658&sectionid=109449831") {
                        UIApplication.shared.open(url, options: [:])
                    }
                    
                case 7 : // V-Tach
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=2046&sectionid=176563954") {
                        UIApplication.shared.open(url, options: [:])
                    }
                case 6 : // US Guided CVC
                    if let url = URL(string: "http://accessmedicine.mhmedical.com.access.library.miami.edu/content.aspx?bookid=1944&sectionid=143522381") {
                        UIApplication.shared.open(url, options: [:])
                    }
                    
                    
                    
                    
                    
                default:
                    break
            }

    }
}
