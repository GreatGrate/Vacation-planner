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

    @IBOutlet weak var plannerButton: UIButton!
    @IBOutlet weak var placesButton: UIButton!
    @IBAction func createPlan(segue: UIStoryboardSegue) {
        if expectedAttraction != nil {
            print("Segued back to main screen from \(expectedAttraction!.name)")
            self.performSegue(withIdentifier: "createPlan", sender: self)
        } else {
            print("Segued back from unknown attraction")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesButton.layer.cornerRadius = 8.0
        placesButton.clipsToBounds = true
        plannerButton.layer.cornerRadius = 8.0
        plannerButton.clipsToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createPlan" {
            let controller = segue.destination as! plannerController
            controller.expectedAttraction = expectedAttraction
        }
    }
}
