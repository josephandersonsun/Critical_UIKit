//
//  ViewController.swift
//  KCHorizontalDial
//
//  Created by LeeSunhyoup on 2015. 9. 25..
//  Copyright © 2015년 LeeSunhyoup. All rights reserved.
//

import UIKit

class CTScanView: UIViewController, UITextFieldDelegate, HorizontalDialDelegate {
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var horizontalDial: HorizontalDial?
    @IBOutlet var degreesValueLabel: UILabel?
    @IBOutlet var tickLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        degreesValueLabel?.text = "CT Slice"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.150000006, green: 0.1899999976, blue: 0.2399999946, alpha: 1)
    }
    
    func horizontalDialDidValueChanged(_ horizontalDial: HorizontalDial) {
        
        
        _ = horizontalDial.value.rounded()
        //let radians = degreesToRadians(degrees)
        degreesValueLabel?.text = "CT Slice \(horizontalDial.value.rounded())"
        
        switch horizontalDial.value.rounded() {
        case 1:
            imageView?.image = UIImage(named: "CT1")
        case 2:
            imageView?.image = UIImage(named: "CT2")
        case 3:
            imageView?.image = UIImage(named: "CT3")
        case 4:
            imageView?.image = UIImage(named: "CT4")
        case 5:
            imageView?.image = UIImage(named: "CT5")
        case 6:
            imageView?.image = UIImage(named: "CT6")
        case 7:
            imageView?.image = UIImage(named: "CT7")
        case 8:
            imageView?.image = UIImage(named: "CT8")
        case 9:
            imageView?.image = UIImage(named: "CT9")
        case 10:
            imageView?.image = UIImage(named: "CT10")
       
        case 11:
            imageView?.image = UIImage(named: "CT11")
        case 12:
            imageView?.image = UIImage(named: "CT12")
        case 13:
            imageView?.image = UIImage(named: "CT13")
        case 14:
            imageView?.image = UIImage(named: "CT14")
        case 15:
            imageView?.image = UIImage(named: "CT15")
        
        case 16:
            imageView?.image = UIImage(named: "CT16")
        case 17:
            imageView?.image = UIImage(named: "CT17")
        case 18:
            imageView?.image = UIImage(named: "CT18")
        case 19:
            imageView?.image = UIImage(named: "CT19")
        case 20:
            imageView?.image = UIImage(named: "CT20")
        
        case 21:
            imageView?.image = UIImage(named: "CT21")
        case 22:
            imageView?.image = UIImage(named: "CT22")
        case 23:
            imageView?.image = UIImage(named: "CT23")
        case 24:
            imageView?.image = UIImage(named: "CT24")
        case 25:
            imageView?.image = UIImage(named: "CT25")
        case 26:
            imageView?.image = UIImage(named: "CT26")
        case 27:
            imageView?.image = UIImage(named: "CT27")
        case 28:
            imageView?.image = UIImage(named: "CT28")
        case 29:
            imageView?.image = UIImage(named: "CT29")
        case 30:
            imageView?.image = UIImage(named: "CT30")
        case 31:
            imageView?.image = UIImage(named: "CT31")
        case 32:
            imageView?.image = UIImage(named: "CT32")
        case 33:
            imageView?.image = UIImage(named: "CT33")
        case 34:
            imageView?.image = UIImage(named: "CT34")

        default:
            break
        }
        //degreesValueLabel?.text = "\(round(degrees*100)/100) Degrees"
        //imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(radians))
    }
    
    @IBAction func reset() {
        horizontalDial?.animateWithValueUpdate(0, duration: 2)
    }
    
    @IBAction func toMaximumValue() {
        guard let maximumValue = horizontalDial?.maximumValue else { return }
        horizontalDial?.animateWithValueUpdate(maximumValue, duration: 2)
    }
    
    @IBAction func toMinimumValue() {
        guard let minimumValue = horizontalDial?.minimumValue else { return }
        horizontalDial?.animateWithValueUpdate(minimumValue, duration: 2)
    }
    
    @IBAction func enableRangeValueChanged(_ _switch: UISwitch) {
        horizontalDial?.enableRange = _switch.isOn
    }
    
    @IBAction func tickValueChanged(_ stepper: UIStepper) {
        tickLabel?.text = "Speed \(stepper.value)"
        horizontalDial?.tick = stepper.value
    }
    
    @IBAction func verticalAlignValueChanged(_ segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            horizontalDial?.verticalAlign = "top"
        case 1:
            horizontalDial?.verticalAlign = "middle"
        case 2:
            horizontalDial?.verticalAlign = "bottom"
        default:
            return
        }
    }
    
    /// private function ///
    fileprivate func degreesToRadians(_ degrees: Double) -> Double {
        return degrees * Double.pi / 180.0
    }
}

