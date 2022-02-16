//
//  CalStarProtocol_ViewController.swift
//  Critical-CalStar
//
//  Created by Jadie Barringer III on 5/22/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import SCLAlertView
import Foundation







class CalStarProtocol_ViewController: UIViewController, UISearchBarDelegate, UITextFieldDelegate{
   


    @IBOutlet weak var collectionView: UICollectionView!
    
    var resuseID = "cellId"
    
    var protocolArray = [CalProtocols]()
    
    var searchProtocolArray = [CalProtocols]()
    
    
    // Once the view appears, the animation starts.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.150000006, green: 0.1899999976, blue: 0.2399999946, alpha: 1)
        
        // Set the title of the navigationBar
        navigationController?.navigationBar.topItem?.title = ""

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Functions
        createSarchbar()
        
        setUpProtocols()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
   
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        
        let movementDuration:TimeInterval = 0.3
        
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(movementDuration )
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        
        UIView.commitAnimations()
    }

    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func createSarchbar() {
        
        
       let searchBar = UISearchBar()

        searchBar.showsCancelButton = false
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationItem.hidesBackButton = false
        
        self.navigationItem.backBarButtonItem?.title = ""

        searchBar.placeholder = "Search Protocols"
        
        searchBar.keyboardAppearance = .dark
        
        searchBar.keyboardType = .emailAddress
        
        searchBar.delegate = self

        self.navigationItem.titleView = searchBar
        

     
    }
    
    
    private func setUpProtocols() {
        
        // Make the Protocol Categories
        // Airway Protocols
        
        protocolArray.append(CalProtocols(name: "Bougie",
                                          category: CategoryType.airway.execute(),
                                          image: CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "Cricothyrotomy",
                                          category: CategoryType.airway.execute(),
                                          image:CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "KING LTS-D Airway",
                                          category: CategoryType.airway.execute(),
                                          image:CategoryType.calstarImage.execute()))
        
    
        
        
        //Cardiac Protocols.
        
        protocolArray.append(CalProtocols(name: "Asystole",
                                          category:CategoryType.cardiac.execute() ,
                                          image:CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "Bradycardia",
                                          category:CategoryType.cardiac.execute() ,
                                          image: CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "Pulseless Arrest",
                                          category: CategoryType.cardiac.execute(),
                                          image: CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "Tachycardia",
                                          category: CategoryType.cardiac.execute(),
                                          image: CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "Heart Blocks",
                                          category: CategoryType.cardiac.execute(),
                                          image: CategoryType.calstarImage.execute()))
        
        protocolArray.append(CalProtocols(name: "12 Leads",
                                          category: CategoryType.cardiac.execute(),
                                          image: CategoryType.calstarImage.execute()))
        
        
        
        searchProtocolArray = protocolArray
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchProtocolArray = protocolArray.filter({ regulations -> Bool in
            
            switch searchBar.selectedScopeButtonIndex {
                
            case 0:
                
                if searchText.isEmpty { return true }
                
                return regulations.name.lowercased().contains(searchText.lowercased())
                
            case 1:
                
                if searchText.isEmpty { return regulations.category == CategoryType.airway.execute() }
                
                return regulations.name.lowercased().contains(searchText.lowercased()) &&
                    
                    regulations.category == CategoryType.airway.execute()
                
            case 2:
                
                if searchText.isEmpty { return regulations.category == CategoryType.cardiac.execute() }
                
                return regulations.name.lowercased().contains(searchText.lowercased()) &&
                    
                    regulations.category == CategoryType.cardiac.execute()
           
            
            default:
                return false
            }
        })
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
            
        case 0:
            searchProtocolArray = protocolArray
            
        case 1:
            searchProtocolArray = protocolArray.filter({ regulations -> Bool in
                regulations.category == CategoryType.airway.execute()


            })
        case 2:
            searchProtocolArray = protocolArray.filter({ regulations -> Bool in
                regulations.category == CategoryType.cardiac.execute()
            })
        
        default:
            break
        }
        
        collectionView.reloadData()
    }
    
}


extension CalStarProtocol_ViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchProtocolArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseID, for: indexPath) as! CalStar_Protocol_CollectionViewCell
        
        cell.protocolTitleLabel.text = searchProtocolArray[indexPath.row].name
        
        cell.protocolDetailLabel.text = searchProtocolArray[indexPath.row].category
        
        cell.imageCell.image = UIImage(named:searchProtocolArray[indexPath.row].image)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print(indexPath.item + 1)
        
        switch indexPath.item + 1 {
        
        case 1:
            if let url = URL(string: "https://calstar.org/services/safety/") {
                            UIApplication.shared.open(url, options: [:])}
            
            print("You selected \(indexPath.item + 1)")

        case 2:
            if let url = URL(string: "https://www.critical-app.com") {
                UIApplication.shared.open(url, options: [:])}
            
            print("You selected \(indexPath.item + 1)")
            
        
        
        default:
            _ = SCLAlertView().showWarning("Sorry", subTitle: "We are working on coding this transition.")
            

        } // Close switch
        
} // Close function
    } // Close the class



class CalProtocols {
    let name: String
    let image: String
    let category: String
    
    init(name: String, category: String, image: String) {
        self.name = name
        self.category = category
        self.image = image
    }
}

enum CategoryType: String {
    case airway = "Airway"
    case respiratory = "Respiratory"
    case cardiac = "Cardiac"
    
    
    case calstarImage = "Critical-CalStarLogo"
    
    
    func execute() -> String {
        return self.rawValue
    }
}

