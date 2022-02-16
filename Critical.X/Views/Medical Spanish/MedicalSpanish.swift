//
//  ViewController.swift
//  Medical Spanish
//
//  Created by Jadie Barringer III on 1/13/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AVFoundation


class MedicalSpanish: UIViewController {
    
    //MARK: - Computed Properties for the UIView.
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }}
    
    @IBOutlet weak var clinicalExamView : UIView! {
        didSet {clinicalExamView.clipsToBounds = true; clinicalExamView.layer.cornerRadius = 5 }}
    
    @IBOutlet weak var generalResponsesView : UIView! {
        didSet {generalResponsesView.clipsToBounds = true; generalResponsesView.layer.cornerRadius = 5 }}
    
    
    @IBOutlet weak var commandView : UIView! {
        didSet {commandView.clipsToBounds = true; commandView.layer.cornerRadius = 5 }}
    
    @IBOutlet weak var greetingsView : UIView! {
        didSet { greetingsView.clipsToBounds = true; greetingsView.layer.cornerRadius = 5 }}
   
    @IBOutlet weak var questionsView : UIView! {
        didSet {questionsView.clipsToBounds = true; questionsView.layer.cornerRadius = 5 }}
    
    //MARK: - Variable to store Audioplayer
    //Store your audio player as a property somewhere so it is retained while the sound is playing
    var spanishTranslate: AVAudioPlayer?
    
    
    //MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    //MARK: - Popup Message
    // Displays to take the phone off vibrate so we can hear.
    
    @IBAction func popBtnReference(_ sender: Any) {
        
        let popTip = PopTip()
        popTip.bubbleColor = UIColor.darkGray
        popTip.textColor = UIColor.white
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        let here = CGRect (x: view.frame.width/3, y: 40, width: 100, height: 100)
        
        
        popTip.show(text: "Ensure that the phone is off vibrate to hear the translation", direction: .down, maxWidth: 200, in: view, from: here)
        
        //Background color changes. Not sure how to dismiss.
        //view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        
        //Changes the font of the pop-up and size
        //popTip.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 10.0)!
        
        
    }
    
    //MARK: - Dismisses the view controller // Takes the button and makes it into a circle
    @IBAction func dismissSpanishView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
   //MARK: - Play Greetings
/*
     With those two lines of code inserted, all you need to do is play your audio file. This is done first by finding where the sound is in your project using path(forResource:), then creating a file URL out of it. That can then get passed to AVAudioPlayer to create an audio player object, at which point – finally – you can play the sound.
 */
    
    @IBAction func playParamedic(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "paramedic", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile

        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    
    @IBAction func playFireman(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "fireman", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playHi(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "hi", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playBye(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "bye", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playImADr(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "doctor", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playimARN(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "nurse", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    
    
    
    
    
    
    //MARK: - Play Questions

    @IBAction func playHavePatience(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "bePatient", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playTYForYouPatience(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "tyForYourPatience", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playIspeakSpanish(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "habloPoco", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playAnyoneThatSpeaksenglish(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "anyThatSpeaksEnglish", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playWhatsYourName(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "name", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playDontUnderstand(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "dontUnderstand", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playDontSpeakSpanish(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "dontSpeakSpanish", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playSpeakMoreSlowly(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "speakSlowly", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }
        print("Button pressed and played \(path)")
        
    }
    @IBAction func playLookForSomeonewhoSpeaksSpanish(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "goingToLook", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    
    
    
    //MARK: - Play Commands
    
    
    @IBAction func play_WakeUp(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "wakeUp", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_DeepBreath(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "deepbreath", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_DontMove(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "dontmove", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_layDown(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "lieDown", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_listenToMe(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "listen", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_sitDown(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "sitHere", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_wiggleToesandFeet(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "moveHandsFeet", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_pleaseRepeat(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "pleaseRepeat", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_sitHere(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "sitHere", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_bePatient(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "bePatient", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_speakMoreSlowly(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "speakSlowly", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    
    //MARK: - Play Clinical Exam
    
    @IBAction func play_haveAllergies(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "allergies", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_haveAsthma(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "asthma", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_youSmoke(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "doyousmoke", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_haveDiabetes(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "diabetes", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_feelPain(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "havepain", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_howDoYouFeel(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "howDoYouFeel", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_chestPain(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "chestpain", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_heartProblems(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "heartproblems", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_highBP(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "highbloodpressure", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_difficultyBreathing(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "havebreathingdifficulties", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_weaknessTingling(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "haveweakness", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_haveYouBeenDrinkingAlcohol(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "drinkingacohol", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_goingToOutIV(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "putIV", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_thisMayHurt(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "mayhurt", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_thisWillRelievePain(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "relievepain", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_giveYouMedicine(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "giveyoumedicine", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_goingToTakeVitals(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "takevital", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_goingToTakeTemp(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "taketemperature", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_giveYouOxygen(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "giveoxygen", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_goingToPutaCollar(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "cervicalcollar", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    
    
    
    
    //MARK: - Play General Responses
    
    
    @IBAction func play_excuseMe(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "excuseMe", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_itsSerious(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "itsSerious", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_notSerious(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "notSerious", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_thankYou(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "thankYou", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_whatsHappening(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "whatshappening", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_whatDoyouNeed(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "whatdoyouneed", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_everythingWillBeFine(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "everyWillBeFine", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_DrWillTakeCare(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "docwilltakecaresoon", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needHelpToGetUp(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "helpStanding", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_goToHospital(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "havetogotohospital", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_anythingForPain(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needpainkiller", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needToGoPotty(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needpotty", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needGoBathroom(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "helpBathroom", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needWheelchair(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needwheelchair", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needWalkingStick(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needwalkingstick", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_wantToGoToHospital(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "wanttogotohospital", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needWater(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needwater", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needWalker(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needwalker", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needCrutches(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "doyouneedcrutches", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    @IBAction func play_needJuice(_ sender: AnyObject) {
        // Place the name of the file in forResource and type ie. wav, mp3 etc in "ofType"
        let path = Bundle.main.path(forResource: "needjuice", ofType:"wav")!; let url = URL(fileURLWithPath: path)
        //Name of the varible used to store the AudioFile
        do { spanishTranslate = try AVAudioPlayer(contentsOf: url); spanishTranslate?.play()}
            //couldn't load file :(
        catch { }; print("Button pressed and played \(path)")}
    
    
    
    
}// End the class

