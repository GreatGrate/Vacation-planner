//
//  ViewController.swift
//  Vacation Planner
//
//  Created by Mouse food on 7/17/18.
//  Copyright © 2018 Mouse food. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var expectedAttraction: Attraction?

    @IBOutlet weak var placesButton: UIButton!
    @IBAction func createPlan(segue: UIStoryboardSegue) {
        if expectedAttraction != nil {
            print("Segued back to main screen from \(expectedAttraction!.name)")
        } else {
            print("Segued back from unknown attraction")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesButton.layer.cornerRadius = 8.0
        placesButton.clipsToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
