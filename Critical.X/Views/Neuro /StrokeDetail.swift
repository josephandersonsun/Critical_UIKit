//
//  StrokeDetail.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel



class StrokeDetail: UIViewController {

    @IBOutlet weak var ctImage: UIImageView!
    @IBOutlet weak var strokeTitle: AKLabel!
    @IBOutlet weak var strokeDescription: UILabel!
    @IBOutlet weak var strokelytics: UILabel!
    @IBOutlet weak var strokeScrollView: UIScrollView!
    
    
    
    var ctPicture =  UIImageView()
    var ctImageName: String =  ""
    var strokeDescrip = String()
    var strokeHeading = String()
    var strokefibrinylitics = String()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strokeDescription.text = strokeDescrip
        // We animate the title of the stroke on pass the string. 
        strokeTitle.animate(text: strokeHeading, duration: 1, completion: nil)
        strokelytics.text = strokefibrinylitics
        ctImage.image = UIImage(named: ctImageName)!
        // Do any additional setup after loading the view.
        strokeScrollView.recalculateVerticalContentSize_synchronous()
        // Change the textColor of the Label only when it says consider ....
        switch strokefibrinylitics {
        case "Consider Fibrinolytics":
            strokelytics.textColor = #colorLiteral(red: 0.2040559649, green: 0.7372421622, blue: 0.6007294059, alpha: 1)
        default:
            break
        }

    }
    
    @IBAction func dismissStrokeDetailVC(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
        
    }

    // Call the function in the viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        setScrollViewContentSize()
    }
    
    
    // Heres the dynamic scrollFunction
    func setScrollViewContentSize() {
        
        var height: CGFloat
        let lastView = self.strokeScrollView.subviews[0].subviews.last!
        
        print(lastView.debugDescription) // should be what you expect
        
        // The label thats being dynamic
        let lastViewYPos = strokeDescription.convert(lastView.frame.origin, to: nil).y  // this is absolute positioning, not relative
        
        // Add all the labels here.
        let lastViewHeight = strokeDescription.frame.size.height
        
        // sanity check on these
        print(lastViewYPos)
        print(lastViewHeight)
        
        // Final height of the scrollView
        
        height = lastViewYPos + lastViewHeight
        
        print("setting scroll height: \(height)")
        
        // Setting the scollview to the final height.
        strokeScrollView.contentSize.height = height
    }
 
    
    enum CVADescription: String {
        
        case subduralHematomaDescription = "Subdural Hematoma\n\nA subdural hematoma is an accumulation of blood between the dura mater and brain. It results from tearing of bridging veins which connect the surface of the brain and the dural sinuses. Subdural hematoma may have both acute and chronic presentations. Acute subdural hematoma develops immediately after head trauma and can be life- threatening. Classic findings on the CT exhibit a crescent-shaped area of high attenuation.\n\nHeadache is the most common symptom, with contralateral hemiparesis, seizures, and a wide variety of cortical dysfunction also common. If sufficiently large, a subdural hematoma can produce increased intracranial pressure with a resulting alteration in the LOC.\n\nExam Findings:\n\n• Decreased LOC\n• Drowsiness N/V\n• Headache\n• Confusion\n• Unequal Pupils\n• Dilated Pupils"
        
        
        case sah = "Subarachnoid hemorrhage\n\nA subarachnoid hemorrhage is characterized as bleeding in the subarachnoid space between the pia mater and the arachnoid membrane. Out of 20% of all the hemorrhagic strokes that occur, subarachnoid hemorrhages account for up to 10%. Most subarachnoid hemorrhages are caused by ruptured aneurysms and trauma. Blood collections are seen in the sylvian fissures, the basal cisterns and occasionally over the tentorium. The classic complaint is being \"the worst headache of my life.\" Mortality is approximately 50%.\n\nExam Findings:\n\n• Severe Headache\n• Meningism\n• N/V\n• Decreased LOC\n• Stiff neck\n• Confusion\n• Photophobia\n• Thunderclap onset"
        
        case ischemicStroke_Description = "Ischemic Stroke\n\nAcute ischemic strokes are described as a sudden loss of blood to an area of the brain which results in neurological deficits. There can be three main subtypes of ischemia. Thrombosis, embolisms, or ischemia second to hypoperfusion.\n\nPatients can also have transient ischemic attacks in which neurological symptoms last less than generally 24 hours, then resolve. Large hypodense (dark) regions can be appreciated suggesting pathology from one of the major 3 arteries that supply the brain - anterior, middle, and posterior cerebral arteries (ACA, MCA, and PCA). Events from the middle cerebral artery are most common.\n\nExam Findings:\n\n• Headaches\n• Focal deficits\n• Slurred speech\n• Decreased LOC"
        
        case IntracerebralHemorrhage_Description = "Intracerebral Hemorrhage\n\nIntracerebral hemorrhages (ICH), followed by ischemic strokes, are considered the second most common types of stroke. This occurs primairly from bleeding within the brain parenchyma itself - commonly caused by Hypertension and therapeutic anticoagulation therapy. Mortality and morbidity is considered extremely high. ICH are commonly associated with large mass effect- midline shifts, effacement of the ventricles and sulci. Management of intracerebral hemorrhages can either be managed medically or surgically.\n\nExam Findings:\n\n• Decreased LOC\n• Major neurological deficits\n• Altered LOC\n• Headache\n• Seizures\n• Vision loss"
        
        case epidural_Description = "An epidural hematoma is an uncommon, but serious head injury is characterized as a collection of blood between the skull and the dura mater. This is usually a result from an arterial injury. Most commonly, the Middle Meningeal Artery. 85% of all epidural hematomas are arterial related. CT findings include a lens – shaped or bi-convex pattern.\n\nExam Findings:\n\n• LOC followed by a lucid interval usually from trauma\n• Headaches\n• Focal deficits\n• Confusion\n• Decreased LOC"
        
        
    }
}
