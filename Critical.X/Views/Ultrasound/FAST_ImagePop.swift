//
//  FAST_ImagePop.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/20/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class FAST_ImagePop: UIViewController {
    var imgOneString_pop = String ()
    var imgTwoString_pop: String = ""
    var imgThreeString_pop = String ()
    var imgFourString_pop = String()
    
    var receivedFromSetID_pop = Int()
    
    
    var imgTitle = String()
    
    
    @IBOutlet weak var imagePopTitle_Label: UILabel!
    @IBOutlet weak var imagePopImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receivedFromSetID_pop = setID
        
        switch receivedFromSetID_pop {
        case 11:
            
            imagePopImageView.image = UIImage(named: imgOneString_pop)
            imagePopTitle_Label.text = imgTitle
            print(" \(receivedFromSetID_pop) Rec ID")

        case 12:
            imagePopImageView.loadGif(name: imgTwoString_pop)
            imagePopTitle_Label.text = imgTitle

        case 13:
            imagePopImageView.image = UIImage(named: imgThreeString_pop)
            imagePopTitle_Label.text = imgTitle

        case 14:
            imagePopImageView.loadGif(name: imgFourString_pop)
            imagePopTitle_Label.text = imgTitle

            // Coming fromm the Main Views picrure on the detail screen
        case 15:
            imagePopImageView.loadGif(name: imgOneString_pop)
            imagePopTitle_Label.text = imgTitle
        default:
            break
        }

        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeImagePopVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
