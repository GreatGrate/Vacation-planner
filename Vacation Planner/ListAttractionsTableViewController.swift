//
//  ListAttractionsTableViewController.swift
//  Vacation Planner
//
//  Created by Macbook on 7/18/18.
//  Copyright © 2018 Mouse food. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListAttractionsTableViewController: UITableViewController {
    var attractions = [Attraction]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchInputTextField: UITextField!
    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchInputTextField.text != nil {
            
            //forms the link to contact the API with the user's search input
            let apiToContact = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" +  searchInputTextField.text!.replacingOccurrences(of: " ", with: "+") + "+point+of+interest&language=en&key=AIzaSyDVikiTQQbqRMOXuQF47JffOzpMCrUKS4U"
            
            Alamofire.request(apiToContact).validate().responseJSON() { response in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                        //filling out the attractions list with 25 attractions pulled from the API
                        self.attractions = []
                        for i in 0...24 {
                            if json["results"][i] != JSON.null {
                                self.attractions.append(Attraction(json: json["results"][i]))
                            } else { return }
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            print("Error! No input in searchInputTextField")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func addNoteButtonPressed(sender: UIButton) {
        print("addNoteButton pressed")
        print("\(sender.tag)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return attractions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListAttractionsTableViewCell", for: indexPath) as! ListAttractionsTableViewCell

        let attraction = attractions[indexPath.row]
        cell.nameTitleLabel.text = attraction.name
        cell.ratingLabel.text = String(attraction.rating)+"⭐"
        cell.addressLabel.text = attraction.address
        cell.addNoteButton.tag = indexPath.row
        return cell
    }
}
