//
//  ViewController.swift
//  Critical_X_VentilatorModes
//
//  Created by Jadie Barringer III on 11/1/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var closeButton: UIButton!
    
    

    
    
    let data = ["AC", "APRV", "BiLevel NIPPV", "CMV", "CPAP/PS", "IRV","PCV", "PRVC", "PSV", "SIMV"]
   
    let subData = ["Assist Control", "Airway Pressure Release Ventilation", "BiLevel NIPPV", "Controlled Mandatory Ventilation ","Continous Positive Airway Pressure ", "Inverse Ratio Ventilation","Pressure Control Ventilation", "Pressure Regulated Volume Control", "Pressure Support Ventilation", "Synchronized Intermittent Mandatory Ventilation"]
    
    var dataDetail = [
        //AC
        "Assist control or (A/C) is a term used to describe a mode of ventilation similar to Control Mode Ventilation (CMV), in which the patient can trigger breaths above and over the ventilatory rate set by the ventilator.\n\nThe ventilator delivers a preset number of breaths per min, regardless of patient effort, thus the control in the name assist control. If the patient wishes to take more than the preset number of breaths, they can- This is the (assist)  part.\n\nWhen the patient triggers a breath it will deliver a breath that contains the full set volume or pressure. If the patient is over breathing the set rate consistently, air trapping can occur in this mode as a patient may trigger additional breast before the full exhalation has occurred.\n\nBottom Line: When the ventilator is set at a rate of 14, the ventilator will deliver 14 guaranteed breaths (controlled breaths) per minute - even if the patient does not make any effort. When the ventilator senses and effort from the patient, it will deliver additional breaths (assisted breaths) above and over the set rate. These additional breaths will be the full volume or pressure that it was initially set to.",
        
        //APRV
        "Airway Pressure Release Ventilation (APRV) is a proprietary name adopted from Drager. It's also referred to as Bi-level or Bi-Vent. Instead of being a variation of PCV in which the I: E ratio is reversed, APRV is a variation of CPAP that releases pressure temporarily on exhalation.\n\nMean airway pressures and Fi02 drive this mode because there are no distending tidal volumes. This unique mode of ventilation results in higher than average airway pressures. This allows higher mean airway pressures without necessarily increasing peak airway pressures.\n\nThere are four basic settings that need to be set initially:\n\nP-High, T-High, P-Low, and T-Low.\n\n1. P-High: This is the pressure used to maintain the alveoli. It's the CPAP. The higher the P-High, the higher the pressure. This is typically set to the current plateau pressure which is usually around 28-30 cmH20. Once compliance is improved, the P-high will have to be adjusted to a lower setting. \n\n2. T-High: This is the inspiratory time. Since conventional respiratory rates are typically 8-12 breaths per min, the T-high is set to approx: 4.5-6 seconds to compliment the normal rate. A longer T-High will improve oxygenation but will also prolong breaths causing hypercapnia. \n\n3. P-Low: This is the pressure that the ventilator will drop to when the pressure is released. This is set to zero. Since end-expiratory pressures rarely reach zero, setting the P-low to zero produces the highest pressure for the patient, thus helps with better gas release. There are times when the provider may need to increase the mean airway pressure. This is where the pLow is adjusted. However, this will restrict ventilation.\n\n4. T-Low: This is the time spent at pLow. Usually, this is set to 0.5-0.8 seconds. This brief period is just enough time to allow for the gas to escape while preventing derecruitment and long enough to obtain a suitable tidal volume at the same time. If the tidal volume is inadequate, the expiratory time is lengthened; this will offload more C02 and lead to derecruitment. If the tidal volume is too high, the expiratory time is shortened. \n\n\nClinical Reference 1. Owens, W. (2012). The ventilator book. Lexington, KY: First Draught Press.",
        
        //BIPAP
        "Non-invasive ventilation is a method of breathing support that does not require the insertion of an ETT tube. BiPAP stands for Bilevel Positive Airway Pressure. Other names for BiPAP include bilevel ventilation, non-invasive ventilation, non-invasive positive pressure ventilation or NIPPV. BiPAP is provided through a tightly fitted mask. The mass will cover the nose and the mouth.\n\nA the softly inflated rim around the edge of the mask creates a tight seal to maintain the level of positive pressure.\n\nWhen the patient attempts to breathe, a flow of air is introduced towards the patient's mouth or nose (creating the upper-pressure level). As the patient breathes in, the flow of air assists the patient's breathing by making it easier to take a significant breath.\n\nWhen the patient exhales, a minimum level of air pressure is trapped within the mask creating the lower pressure level.\n\nThis minimum pressure helps to keep disease airways and alveoli from collapsing. BiPAP can be useful for some patients by giving them enough support to avoid the need for mechanical ventilation. And very sick patients, noninvasive ventilation does not provide enough support. Thus, mechanical ventilation is required.",
        
        //CMV
        "Control mode ventilation (CMV) is a time – cycling process. The timing mechanism generates the inspiratory tidal volume breath - independent of the patient's respiratory effort. During CMV, the ventilator does not allow the patient to self-generate a tidal volume breath.\n\nPatients awakening from sedation or pharmacologic paralysis may experience agitation and air hunger since they cannot interface with the ventilator.\n\nControl Mode ventilation is used primarily with patients unable or not required to generate a voluntary respiratory effort.\n\nControl modes in AC modes are technical variations of each other – differentiated only by the preset triggering threshold for AC ventilation. Clinicians traditionally choose A/C mode as the initial mode due to the simplicity, comfort level and patient ability to trigger a breath.",
        
        //CPAP/PS
        "Continuous Positive Airway Pressure, CPAP, allows for a constant pressure to be maintained above atmospheric pressure throughout the respiratory cycle. The patient must be able to generate a  breath to use this mode.\n\nTo start, the ventilator respiratory rate is adjusted to zero so that no control breaths are delivered during the cycle.\n\nA CPAP of 5 cm of water is traditionally started to maintain pressure above atmospheric pressure. CPAP can be provided alone or in combination with pressure support ventilation. During spontaneous ventilations, the patient receives a constant CPAP above atmospheric pressure augmented with a preset pressure support ventilation during each spontaneous breath.\n\nFor example, a CPAP 5 cmH20 plus pressure support ventilation of 10 cmH20. CPAP by itself or in combination with pressure support is the primary mode used to promote spontaneous ventilation to wean patients from mechanical ventilation.",
        //IRV
        "Inverse Ratio Ventilation is a subset of pressure control ventilation in which the inspiratory time is prolonged. IRV's primary indication is in patients with ARDS with refractory hypoxemia or hypercapnia. A normal I:E ratio is 1:3. However, in IRV, the ratios: 1:1, 2:1, or 3:1 may be used. This lowers peak airway pressures, but increases mean airway pressures.\n\nThe result may improve oxygenation but at the expense of compromising venous return and cardiac output - thus is not clear that this mode of ventilation leads to improved survival. ",
        //PCV
        "Pressure Control Ventilation is a pressure – limiting, time – cycled mode in which a constant pressure is maintained throughout the preset inspiratory time (I – time).\n\nSimply put, the pressure is the endpoint rather than volume. Therefore, the expiratory phase of a breath ends once a preset pressure is reached, regardless of the volume that's delivered.\n\nAs gas flows through the ventilator circuit and into the patient's lungs, the airway pressure rises, resulting in increased alveolar volume. The result is that delivered airway pressure = intrapulmonary pressure; ending the inspiratory phase.\n\nClinicians often change the ventilation mode from volume controlled (CMV, A/C, or SIMV) to pressure control ventilation if adequate ventilation or oxygenation goals are not achieved. Or, if excessive peak airway pressures are required to optimize gas exchange. Patients with Acute Lung Injury (ALI) or Acute Respiratory Distress Syndrome (ARDS) often require pressure control ventilation. This is primarily due to the difficulties in optimizing ventilation/perfusion goals with conventional volume control modes.\n\n\nReferences: \n\n1. Hess, D. R., & Kacmerek, R. M. (2002). Essentials of mechanical ventilation (2nd ed.). New York: McGraw-Hill.",
        //PRVC
        "Pressure Regulated Volume Control",
        //PSV
        "Pressure Support Ventilation",
        //SIMV
        "Synchronized Intermittent Mandatory Ventilation",
        ]
    
    var views = [UIView]()
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var snap:UISnapBehavior!
    var previousTouchPoint:CGPoint!
    var viewDragging = false
    var viewPinned = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        
        animator.addBehavior(gravity)
        gravity.magnitude = 4
        
    
        // Takes the button and makes it into a circle
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        
        
        /// This shows how many tabs are displayed by setting the off set. Closer to 0, less tabs
        var offset:CGFloat = 500
        
        
        /// Loop calls the data and detail view count and populates it by the addViewController Function.
        for i in 0 ... data.count - 1
        {
            if let view = addViewController(atOffset: offset, dataForVC: data[i] as AnyObject, dataDetailForVC: dataDetail[i] as AnyObject, dataForSubtitle: subData[i] as AnyObject)
            {
                views.append(view)
                offset -= 50
            }
        }
    }
    
    
    /// Creates the view from the 2nd ViewController. All the arguments added and referenced in the loop above
    func addViewController (atOffset offset:CGFloat, dataForVC data:AnyObject?, dataDetailForVC dataDetail:AnyObject?, dataForSubtitle subData: AnyObject) -> UIView? {
        
        let frameForView = self.view.bounds.offsetBy(dx: 0, dy: self.view.bounds.size.height - offset)
        
        let sb = UIStoryboard(name: "VentModes", bundle: nil)
        let stackElementVC = sb.instantiateViewController(withIdentifier: "StackElement") as! StackElementViewController
        
        if let view = stackElementVC.view {
            view.frame = frameForView
            view.layer.cornerRadius = 5
            view.layer.shadowOffset = CGSize(width: 2, height: 2)
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 3
            view.layer.shadowOpacity = 0.5
            
            // Configures Title, Detail Text and Subtitle. Checks to see if in the array and populates it.
            if let headerStr = data as? String
            {
                stackElementVC.headerString = headerStr
            }
            
            if let detailStr = dataDetail as? String
            {
                stackElementVC.detailString = detailStr
            }
            
        
            if let subTitleString = subData as? String
            {
                stackElementVC.subHeaderString = subTitleString
            }
            
            
            
            self.addChild(stackElementVC)
            self.view.addSubview(view)
            stackElementVC.didMove(toParent: self)
            
            
            
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(gestureRecognizer:)))
            view.addGestureRecognizer(panGestureRecognizer)
            
            
            let collision = UICollisionBehavior(items: [view])
            collision.collisionDelegate = self
            animator.addBehavior(collision)
            
            let boundary = view.frame.origin.y + view.frame.size.height
            
            // lower boundary
            var boundaryStart = CGPoint(x: 0, y: boundary)
            var boundaryEnd = CGPoint(x: self.view.bounds.size.width, y: boundary)
            collision.addBoundary(withIdentifier: 1 as NSCopying, from: boundaryStart, to: boundaryEnd)
            
            
            // upper boundary
            boundaryStart = CGPoint(x: 0, y: 0)
            boundaryEnd = CGPoint(x: self.view.bounds.size.width, y: 0)
            collision.addBoundary(withIdentifier: 2 as NSCopying, from: boundaryStart, to: boundaryEnd)
            
            
            gravity.addItem(view)
            
            
            let itemBehavior = UIDynamicItemBehavior(items: [view])
            animator.addBehavior(itemBehavior)
            
            return view
        }
        
        return nil
    }
    
    @objc func handlePan (gestureRecognizer:UIPanGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.view)
        let draggedView = gestureRecognizer.view!
        
        if gestureRecognizer.state == .began {
            let dragStartPoint = gestureRecognizer.location(in: draggedView)
            
            if dragStartPoint.y < 200 {
                viewDragging = true
                previousTouchPoint = touchPoint
            }
            
        } else if gestureRecognizer.state == .changed && viewDragging {
            let yOffset = previousTouchPoint.y - touchPoint.y
            
            draggedView.center = CGPoint(x: draggedView.center.x, y: draggedView.center.y - yOffset)
            previousTouchPoint = touchPoint
        }else if gestureRecognizer.state == .ended && viewDragging {
            
            pin(view: draggedView)
            addVelocity(toView: draggedView, fromGestureRecognizer: gestureRecognizer)
            
            animator.updateItem(usingCurrentState: draggedView)
            viewDragging = false
            
        }
    }
    
    func pin (view:UIView) {
        
        let viewHasReachedPinLocation = view.frame.origin.y < 100
        
        if viewHasReachedPinLocation {
            if !viewPinned {
                var snapPosition = self.view.center
                snapPosition.y += 30
                
                snap = UISnapBehavior(item: view, snapTo: snapPosition)
                animator.addBehavior(snap)
                
                setVisibility(view: view, alpha: 0)
                
                viewPinned = true
                
                
            }
        } else {
            if viewPinned {
                animator.removeBehavior(snap)
                setVisibility(view: view, alpha: 1)
                viewPinned = false
            }
        }
        
        
    }
    
    func setVisibility (view:UIView, alpha:CGFloat) {
        for aView in views {
            if aView != view {
                aView.alpha = alpha
            }
        }
    }
    
    
    
    func addVelocity (toView view:UIView, fromGestureRecognizer panGesture:UIPanGestureRecognizer) {
        var velocity = panGesture.velocity(in: self.view)
        velocity.x = 0
        
        if let behavior = itemBehavior(forView: view) {
            behavior.addLinearVelocity(velocity, for: view)
        }
    }
    
    func itemBehavior (forView view:UIView) -> UIDynamicItemBehavior? {
        for behavior in animator.behaviors {
            if let itemBehavior = behavior as? UIDynamicItemBehavior {
                if let possibleView = itemBehavior.items.first as? UIView, possibleView == view {
                    return itemBehavior
                }
            }
        }
        
        return nil
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        if NSNumber(integerLiteral: 2).isEqual(identifier) {
            let view = item as! UIView
            pin(view: view)
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissVentilatorModeVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}


