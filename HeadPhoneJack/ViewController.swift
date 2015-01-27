//
//  ViewController.swift
//  HeadPhoneJack
//
//  Created by Sven Schmidt on 27/01/2015.
//  Copyright (c) 2015 feinstruktur. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = ""
        self.checkState(self)
        
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserverForName("AVAudioSessionRouteChangeNotification", object: nil, queue: NSOperationQueue.mainQueue()) { notification in
            self.checkState(self)
        }
    }

    @IBAction func checkState(sender: AnyObject) {
        let route = AVAudioSession.sharedInstance().currentRoute
        for output in route.outputs {
            NSLog("output: \(output)")
            if let desc = output as? AVAudioSessionPortDescription {
                self.label.text = desc.portName
            }
        }
    }
    
}

