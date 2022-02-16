//
//  MainMenuTableViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/5/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import LTMorphingLabel
import EasyPeasy
import SCLAlertView



extension Date {
   
    func dayOfWeek() -> String? {
   
        let dateFormatter = DateFormatter()
   
        dateFormatter.dateFormat = "EEEE"
   
        return dateFormatter.string(from: self).capitalized
   
        // or use capitalized(with: locale) if you want
   
    }
}

extension String {
    
    // Random Emoji's to be displayed during the afternoon
    
    static func randomAfternoon_CalStar(length: Int = 1) -> String {
        
        let afternoonEmoji = ["🌞","🌤","😎","🌎"]
        
        var randomString: String = ""
        
        
        
        for _ in 0..<length {
        
            let randomValue = arc4random_uniform(UInt32(afternoonEmoji.count))
        
            randomString += "\(afternoonEmoji[afternoonEmoji.index(afternoonEmoji.startIndex, offsetBy: Int(randomValue))])"
        
        }
        
        return randomString
    }
    
    
 

    
    // Random Emoji's to be displayed during the Morning
    
    static func randomMorning_CalStar(length: Int = 1) -> String {
       
        let morningEmoji = ["☀️","🌞","🌤", "😀", "😌"]
       
        var randomString: String = ""
       
        
       
        for _ in 0..<length {
       
            let randomValue = arc4random_uniform(UInt32(morningEmoji.count))
       
            randomString += "\(morningEmoji[morningEmoji.index(morningEmoji.startIndex, offsetBy: Int(randomValue))])"
        }
       
        return randomString
    }
    
    // Random Emoji's to be displayed during the evening
    static func randomEvening_CalStar(length: Int = 1) -> String {
        
        let eveningEmoji = ["🌒","🌖","🌙", "🌛", "🌝"]
        
        var randomString: String = ""
        
        
        for _ in 0..<length {
        
            let randomValue = arc4random_uniform(UInt32(eveningEmoji.count))
        
            randomString += "\(eveningEmoji[eveningEmoji.index(eveningEmoji.startIndex, offsetBy: Int(randomValue))])"
        
        }
        
        return randomString
    }
}


//MARK: - Begin Class
class CalStar_MainMenu_Collection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LTMorphingLabelDelegate  {
    
    
    //MARK: - Outlets
    @IBOutlet var menuCollectionView: UICollectionView!
    
    @IBOutlet var label: LTMorphingLabel!
    
    @IBOutlet weak var criticalLogo: UIImageView!
    
    //MARK: Variable declaration
    var mainMenu = [String]()
    
    var mainMenuDetail = [String]()
    
    var cellImages = [String]()
    
    var storyBoardID = [String]()
    
    var noName = ""
    
    
    
    
    //MARK: Get the current time.
    func getTimefromDate()  {
        
        let hours = (Calendar.current.component(.hour, from: Date()))
        
        let minutes = (Calendar.current.component(.minute, from: Date()))
        
        let seconds = (Calendar.current.component(.second, from: Date()))
        
        let day = (Calendar.current.component(.weekday, from: Date()))
        
        // This is how we get the day of the week.
        _ = DateFormatter()
        //let dateFormatter = DateFormatter()

        // Create new variable to store the day of the week
        // Gets the day of the week from the extension above
        let dayOfTheWeek_CalStar = Date().dayOfWeek()!
        
       
        // Print the day of the week
        print ("Today is \(dayOfTheWeek_CalStar)")
        
        // Setting a new variable to the function in the extension above.
        
        let randomMorning = String.randomMorning_CalStar()
        
        let randomAfternoon = String.randomAfternoon_CalStar()
        
        let randomEvening = String.randomEvening_CalStar()
        
    
        
        //MARK: Switch on the hours that when its when its a certain time frame, we will display the greeting.
        switch hours {
        case 05..<12:
            //label.text = "Good Afternoon \(randomMorning), Jadie."
            
            //Create an array of different greetings.
            let greetings: Array = ["Hi", "Hey", "Ciao","Buenos Dias","Cheers", "Good Morning ", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)!"]
            
            let greetingFormal: Array = ["Hi", "Hey", "Ciao","Buenos Dias", "Cheers", "Good Morning", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)"]
            
            //Get the index at each array at RANDOM
            let index = Int(arc4random_uniform(UInt32(greetings.count)))
            
            // Convert the index at random into the string
            //let displayRandomGreeting = greetings[index]
            let formalDisplayRandomGreeting = greetingFormal [index]
            
            //gets the name from the initial login and stores it.""
            var username = UserDefaults.standard.value(forKey: "name")
            
            
            // Conditional
            if username == nil {
                
                username = noName
                
                //label.text = "Good Morning! \(randomAfternoon)"
                
                let displayRandomGreeting = greetings.randomElement()
                
                label.text = "\(displayRandomGreeting!) \(randomMorning)"
                
                print("There was no username Entered section 5-12")
                
            } else if username != nil {
                
                label.text = "\(formalDisplayRandomGreeting), \(username!)! \(randomMorning) "
                
                print("Name was entered section 5-12")
            }
            
            print("Today is \(day)")
            
        
        // If the time is between Noon and 6pm
        case 12..<18:
            //label.text = "Good Afternoon \(randomAfternoon), Jadie."
            
            
            //Create an array of different greetings.
            let greetings: Array = ["Hi", "Hey", "It's a good day", "Ciao","Hola", "What's up", "Cheers", "Good Afternoon", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)!"]
            
            let greetingFormal: Array = ["Hi", "Hey","It's a good day", "Ciao!","Hola", "What's up", "Cheers", "Good Afternoon", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)"]
            
            //Get the index at each array at RANDOM
            let index = Int(arc4random_uniform(UInt32(greetings.count)))
            
            // Convert the index at random into the string
            //let displayRandomGreeting = greetings[index]
            let formalDisplayRandomGreeting = greetingFormal [index]
            
            //gets the name from the initial login and stores it.""
            var username = UserDefaults.standard.value(forKey: "name")
            
            if username == nil {
                username = noName
                //label.text = "Good Morning! \(randomAfternoon)"
                
                let displayRandomGreeting = greetings.randomElement()
                
                label.text = "\(displayRandomGreeting!) \(randomMorning) "
                
                print("There was no username Entered 12-18 hr section")
            }
            else if username != nil {
                //label.text = "Good Morning \(randomAfternoon), \(username!)!"
               
                label.text = "\(formalDisplayRandomGreeting), \(username!)! \(randomAfternoon) "
               
                print("A Name was entered 12-18 hrs section")

            }
            
        
        
        
        // If the time is between 6pm and midnight
        case 18..<24:
            //label.text = "Good Evening \(randomEvening), Jadie."
            
           
            //Create an array of different greetings.
            
            let greetings: Array = ["Hi", "It's a good evening", "Cheers", "Good Evening", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)!"]
            
            let greetingFormal: Array = ["Hi", "It's a good evening", "Cheers", "Good Evening", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)"]
            
            //Get the index at each array at RANDOM
            
            let index = Int(arc4random_uniform(UInt32(greetings.count)))
            
            // Convert the index at random into the string
            //let displayRandomGreeting = greetings[index]
            let formalDisplayRandomGreeting = greetingFormal [index]
            
            //gets the name from the initial login and stores it.""
            var username = UserDefaults.standard.value(forKey: "name")
            
            if username == nil {
                username = noName
                //label.text = "Good Morning! \(randomAfternoon)"
                if let displayRandomGreeting = greetings.randomElement() {
                label.text = "\(randomMorning) \(displayRandomGreeting)"
                print("There was no username Entered 18-24 hr section")
                }
            }
            if username != nil {
                //label.text = "Good Morning \(randomAfternoon), \(username!)!"
                //let displayRandomGreeting = greetings.randomElement()
                    label.text = "\(formalDisplayRandomGreeting), \(username!)! \(randomEvening) "
                    
                
                print("A Name was entered 18-24 hrs section")
                print(username!)
            }

            
        //If the time is between midnight and 5am
        default:
            //label.text = "Good Evening \(randomEvening), Jadie."
            
            //Create an array of different greetings.
            let greetings: Array = ["Hi", "It's a good evening", "Hey", "Ciao","Hola","Cheers", "Good Evening", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)!"]
            
            let greetingFormal: Array = ["Hi", "It's a good evening", "Hey", "Ciao","Hola", "Cheers", "Good Evening", "Welcome Back", "Happy \(dayOfTheWeek_CalStar)"]
           
            
            //Get the index at each array at RANDOM
            let index = Int(arc4random_uniform(UInt32(greetings.count)))
            
            
            // Convert the index at random into the string
            //let displayRandomGreeting = greetings[index]
            let formalDisplayRandomGreeting = greetingFormal [index]
            
            
            //gets the name from the initial login and stores it.""
            var username = UserDefaults.standard.value(forKey: "name")
            
            if username == nil {
                username = noName
                //label.text = "Good Morning! \(randomAfternoon)"
                if let displayRandomGreeting = greetings.randomElement() {
                    label.text = "\(displayRandomGreeting) \(randomEvening) "

                }
            }
            
            else if username != nil {
                //label.text = "Good Morning \(randomAfternoon), \(username!)!"
                label.text = "\(formalDisplayRandomGreeting), \(username!) \(randomEvening) "
                
            }
            
        
        }
        
        print("Current time is", hours,":", minutes,":", seconds)
    }
    
    
 
    
    //MARK: - Set Animation Label
    func setAnimationLabel(){
        
        
        //gets the name from the initial login and stores it.""
        _ = UserDefaults.standard.value(forKey: "name")
        //let username = UserDefaults.standard.value(forKey: "name")

        
        //label = LTMorphingLabel(frame: CGRect(x: 50, y: 80, width: 100, height: 50))
//        label = LTMorphingLabel(frame: CGRect(x: 8, y: 175, width: 359, height: 29))
        
        // We position the label here with the y value  = the sun of the navigation bar plus the image with the spaces in beteween.
        let topBar = self.navigationController?.navigationBar.frame.height
        
        let criticalLogoHeight = self.criticalLogo.frame.height
        
        let distancfromTop = topBar ?? 44 + 25 + criticalLogoHeight
        
        label = LTMorphingLabel(frame: CGRect(x: 8, y:self.view.frame.minY + 142, width: self.view.frame.width, height: 29))
        
        label.textAlignment = .center
        
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
        
        label.textColor = UIColor.darkGray
        
        label.text = "Hello, Welcome to Critical"
        
        label.morphingEffect = .anvil
        
      
        view.addSubview(label)
        
        /** Create the UILabel */
        
   }
    
    //MARK: - Animate Nav Bar
    func animateNavBar()  {
       
        let fadeTextAnimation = CATransition()
       
        fadeTextAnimation.duration = 0.3
       
        fadeTextAnimation.type = kCATransitionMoveIn
        
        //        kCATransitionFade
        //        kCATransitionMoveIn
        //        kCATransitionPush
        //        kCATransitionReveal
        //
        
        /*
         The different date formats
         Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
         09/12/2018                        --> MM/dd/yyyy
         09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
         Sep 12, 2:11 PM                   --> MMM d, h:mm a
         September 2018                    --> MMMM yyyy
         Sep 12, 2018                      --> MMM d, yyyy
         Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
         2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
         12.09.18                          --> dd.MM.yy
         10:41:02.112                      --> HH:mm:ss.SSS
         */
        
        let date : Date = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E MMM d  |  h:mm a"
        // dateFormatter.dateFormat = "EEEE, MMM d, h:mm a"

        let todaysDate = dateFormatter.string(from: date)
        
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
       
       // Set the navigation title to the current date configuration.
        navigationController?.navigationBar.topItem?.title = todaysDate

        // navigationItem.title = "The Barringer Group ©"
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        animateNavBar()
        
        //Establish random colors to call for the navbar to change.
        let randomNavBarColors = [ #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1) , #colorLiteral(red: 0.05098039216, green: 0.1019607843, blue: 0.1411764706, alpha: 1) ,  #colorLiteral(red: 0.08235294118, green: 0.5607843137, blue: 0.6117647059, alpha: 1) , #colorLiteral(red: 0.9358316064, green: 0.3514818549, blue: 0.1909768581, alpha: 1) ]

        //change the color of the navigationbar with random color
        self.navigationController?.navigationBar.barTintColor = UIColor.random(from: randomNavBarColors)
    }
    
 
 
    // Loads the animation once the view appears
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        setAnimationLabel()
        
        getTimefromDate()
        
       
        
    }
        
        
        
//MARK: - ViewDidDissappear
    override func viewDidDisappear(_ animated: Bool) {
        
        // Clear the animation label once the view dissappears.
        label.text = ""
    
    }
    

    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Declare the build to pass in the collection menu so the version can be visible.
        let build : Any! = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
       
        
        //MARK: - Menu Screen Items
        mainMenu =
            ["About Critical-CalStar  v.\(String(describing: build!))", // 0
            
            "Airway", // 1
            
            "Cardiac",// 2
            
            "CalStar Calculators",// 2
            
            "CalStar Pharmacology", // 3
            
            "CalStar Drips", // 5
            
            "Fluids / Blood products", // 6
            
            "Lab Values", // 7
            
            "Balloon Pump", // 8
            
            "Neuro", // 9
            
            "Pediatrics", // 10
            
            "Obstetrics", // 11
            
            "Hemodynamics", // 12
            
            "RSII", //13
            
            "Procedures & Imaging", // 14
            
            "Ventilator Management", // 15
         
            "Clinical Evidence", //16
        
            "CalStar Protocols"] // 17
        
        
        mainMenuDetail =
            ["Rate Us ⭐️, Email 📩, Dream Forum",// 0
            
            "Intubation, Difficult Airway Algorithms",// 1
            
            "VADs, ECG & 12 Leads, ACLS",// 2
            
            "Clinical Calculators & Medical Spanish",// 3
            
            "Clinical Drug Pharmacodynamics",// 4
            
            "Common Drips in Critical Care",// 5
            
            "PRBC, 0.9%, Albumin ",// 6
            
            "Common Lab Value Interpretations",// 7
            
            "Timing, Modes & Troubleshooting",// 8
            
            "Assessments & Stroke Scales",// 9
            
            "Resuscitation, Calcs & Equipment",// 10
            
            "Fetal Heart Monitoring Strips",//  11
            
            "Hemodynamic Parameters / Monitoring",// 12
            
            "Rapid Sequence Induction & Intubation",// 13
            
            "CXR, Ultrasound & CVC Insertion",// 14
            
            "ABG Calc, Modes, Capnography",// 15
        
            "Review The Clinical Evidence",
        
            "Company Policies & Procedures"]
        
        // Images and associated Indexpaths
        //  "formula",// 3
        // "Pharmacology",// 4
        cellImages =
            ["Critical_Logo_OutlineNavy",// 0 
            
            "CRITICAL_Airway_Logo_Circle",// 1
            
            "CRITICAL_VAD_Logo_Circle",// 2
            
            "CRITICAL_DrugCalcs_Logo_Circle",// 3
            
            "CRITICAL_Meds_1Logo_Circle",// 4
            
            "CRITICAL_BloodProducts_Logo_Circle",// 5
            
            "CRITICAL_CBC_Logo_Circle",// 6
            
            "CRITICAL_LabValues_Logo_Circle",// 7
            
            "CRITICAL_IABPLogo_Circle",// 8
            
            "CRITICAL_Neuro_Logo1_Circle",// 9
            
            "CRITICAL_PedsLogo1_Circle",// 10
            
            "OB",//  11
            
            "CRITICAL_EKG_Logo",// 12
            
            "CRITICAL_RSI_Logo_Circle",// 13
            
            "CRITICAL_SpecialProcedures_Logo_Circle",// 14
            
            "CRITICAL_VentLogo_Circle", // 15
        
            "Critical_References",
        
            "Critical-CalStarLogo"]// 16
        
        // StoryBoard ID and associated Indexpaths
        storyBoardID = ["About Critical", // 0
            
            "Airway management", // 1
            
            "EKG", // 2
            
            "Clinical Calculators", // 3
            
            "Clinical pharmacology", // 4
            
            "Infusions",// 5
            
            "Fluids blood products",// 6
            
            "Lab values", // 7
            
            "Balloon pump",// 8
            
            "Neuro", // 9
            
            "Pediatrics", // 10
            
            "Obstetrics",//  11
            
            "Hemo", // 12
            
            "RSICalStar", // 13
            
            "Procedures & imaging", // 14
            
            "Ventilator management", // 15
        
            "references", //16
        
            "Protocols"] // 17
        
        // Do any additional setup after loading the view.
        
    }
    

    //MARK: - DataSource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenMenuCollectionViewCell
        
        
        cell.mainMenu_CellLabel.text = mainMenu[indexPath.item]
        
        cell.mainMenuDetail_CellLabel.text = mainMenuDetail [indexPath.item]
        
        cell.mainMenu_CellImage.image = UIImage (named:cellImages[indexPath.item])
     
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(storyBoardID [indexPath.item])
        
        //There are multiple types of storyboards in this case, navigation/modal presentations. So we have to use conditionals to set the index path for the specific view controllers that we want to be modal, and then for the "else", everything else will be set to be pushed via navigation.
        
        // Conditionals to push these two index paths for modal view.
        
        // ABOUT PAGE --> MODAL
        if indexPath.row == 0 {
            
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil) // Name has to reflect the origionting SB
            
            let aboutVC = storyboard.instantiateViewController(withIdentifier: "About Critical") // Making sure the identifier matches the SBID
            
            self.present(aboutVC, animated: true, completion: nil)
            
        }
            
            // PEDIATRICS PAGE --> MODAL
        else if indexPath.row == 6 {
            
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil) // Name has to reflect the origionting SB
            
            let fluid = storyboard.instantiateViewController(withIdentifier: "Fluids blood products") // Making sure the identifier matches the SBID
            
            self.present(fluid, animated: true, completion: nil)
            
        }
            
            // PEDIATRICS PAGE --> MODAL
        else if indexPath.row == 10 {
            
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil) // Name has to reflect the origionting SB
            
            let rsiVC = storyboard.instantiateViewController(withIdentifier: "Critical Peds") // Making sure the identifier matches the SBID
            
            self.present(rsiVC, animated: true, completion: nil)
            
        }
           
            // RSI PAGE --> MODAL
        else if indexPath.row == 13 {
            
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil) // Name has to reflect the origionting SB
            
            let rsiVC = storyboard.instantiateViewController(withIdentifier: "Rapid sequence intubation") // Making sure the identifier matches the SBID
            
            self.present(rsiVC, animated: true, completion: nil)
            
        }
            
            
            // Hemodynamics VC PAGE --> MODAL
        else if indexPath.row == 12 {
            
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil) // Name has to reflect the origionting SB
            
            let rsiVC = storyboard.instantiateViewController(withIdentifier: "Hemo") // Making sure the identifier matches the SBID
            
            self.present(rsiVC, animated: true, completion: nil)
            
        }
            
            // Clinical References VC PAGE --> MODAL
        else if indexPath.row == 16 {
            
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil) // Name has to reflect the origionting SB
            
            let rsiVC = storyboard.instantiateViewController(withIdentifier: "references") // Making sure the identifier matches the SBID
            
            self.present(rsiVC, animated: true, completion: nil)
            
        }
            

            //  Everything else will be pushed via navigation here.
        else {
            // Set the Storyboard ID to each indexPath.
            let SBID = storyBoardID [indexPath.item]
            
            // Name has to reflect the origionting SB.
            let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: SBID)
            
            // Push the ViewController via Navigation
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}



