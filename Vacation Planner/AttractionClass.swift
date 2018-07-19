//
//  AttractionClass.swift
//  Vacation Planner
//
//  Created by Macbook on 7/18/18.
//  Copyright © 2018 Mouse food. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Attraction {
    var name = "This place should not appear"
    var rating = 0.0
    var address = "This address should not appear"
    var imageURL: String?
    
    init (json: JSON) {
        self.name = json["name"].stringValue
        self.rating = json["rating"].doubleValue
        self.address = json["formatted_address"].stringValue
        /*
        if json["photos"][0] != JSON.null {
            self.imageURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=71&photoreference=" + json["photos"][0]["photo_reference"].stringValue + "key=AIzaSyDVikiTQQbqRMOXuQF47JffOzpMCrUKS4U"
            
            //photo URL may be done incorrectly.
        } else {
            self.imageURL = nil
        }
        */
    }
}
