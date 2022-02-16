//
//  containerFastVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/13/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit




class containerFastVC: UIViewController, UIScrollViewDelegate {
   
    var imgOneString = String ()
    var imgTwoString: String = ""
    var imgThreeString = String ()
    var imgFourString = String()
    var receivedFromSetID = Int()

    var descriptionStringOne = String()
    var descriptionStringTwo = String()
    var descriptionStringThree = String()
    var descriptionStringFour = String()
   
    
    //ScrollView
    @IBOutlet weak var containerScrollView: UIScrollView!
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo_GIF: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    
    @IBOutlet weak var imageOneLabel: UILabel!
    @IBOutlet weak var imageTwoLabel: UILabel!
    @IBOutlet weak var imageThreeLabel: UILabel!
    @IBOutlet weak var imageFourLabel: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

       print("Container Loaded")
       
        //MARK: Pass the string variable to load the image.
        
        // Load the first image on the container view
        imageOne.image = UIImage(named: imgOneString)
        
        //  Gif is set to the string
        imageTwo_GIF.loadGif(name: imgTwoString)
        
        //  Image is set to the string
        imageThree.image = UIImage(named: imgThreeString)
        
        // Load image 4's gif
        imageFour.loadGif(name: imgFourString)
        
        // Here we populate the labbels for the container view
        imageOneLabel.text = descriptionStringOne
        
        imageTwoLabel.text = descriptionStringTwo
        
        imageThreeLabel.text = descriptionStringThree
        
        imageFourLabel.text = descriptionStringFour
        
        receivedFromSetID = setID

        /// Rounds the corners 15 pixels of the image name. 4 px for a button
        imageOne.clipsToBounds = true
        imageOne.layer.cornerRadius = 4
        
        imageTwo_GIF.clipsToBounds = true
        imageTwo_GIF.layer.cornerRadius = 4
        
        // For the pelvic view, I want to have all 4 images to be GIF.
        switch setID {
        case 4:
            imageOne.loadGif(name: imgOneString)
            imageTwo_GIF.loadGif(name: imgTwoString)
            imageThree.loadGif(name: imgThreeString)
            imageFour.loadGif(name: imgFourString)

        default:
            break
        }
        
        // Do any additional setup after loading the view.
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        //MARK: - PASS DATA  TO CONTAINER VIEWS Images and Labels, The conditionals are containerview, segue.identifier and SETID. We only change this.
        
        if let imgPop = segue.destination as? FAST_ImagePop, segue.identifier == "1" {
            // WE set the id to 
            setID = 11
            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            imgPop.imgOneString_pop = imgOneString
            imgPop.imgTitle = descriptionStringOne
            
          
        }
        // View
        if let imgPop = segue.destination as? FAST_ImagePop, segue.identifier == "2" {
            setID = 12

            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            imgPop.imgTwoString_pop = imgTwoString
            imgPop.imgTitle = descriptionStringTwo
            
            
        }
        
        // View
        if let imgPop = segue.destination as? FAST_ImagePop, segue.identifier == "3" {
            
            setID = 13

            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            imgPop.imgThreeString_pop = imgThreeString
            imgPop.imgTitle = descriptionStringThree
            
            
        }
        
        //RUQ View
        if let imgPop = segue.destination as? FAST_ImagePop, segue.identifier == "4" {
            setID = 14

            print("Set id is \(setID)")
            // Fist pitcure Reguar Image
            imgPop.imgFourString_pop = imgFourString
            imgPop.imgTitle = descriptionStringFour
            
            
        }
}

}
