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
    var address = ""
    
    init (json: JSON) {
        self.name = json["name"].stringValue
        self.rating = json["rating"].doubleValue
        self.address = json["address"].stringValue
    }
}
