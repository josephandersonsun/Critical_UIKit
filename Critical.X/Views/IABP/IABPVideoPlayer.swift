//
//  IABPVideoPlayer.swift
//  Intra Aortic Balloon Pump
//
//  Created by Jadie Barringer III on 1/22/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class IABPVideoPlayer: UIViewController {


    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Only add the URL after the = in the webaddress.
        getVideo(videoCode: "KQxsPH3TAa4")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getVideo(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        myWebView.loadRequest(URLRequest(url: url!))
    }

    
    
}

