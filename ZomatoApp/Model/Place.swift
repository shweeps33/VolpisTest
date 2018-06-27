//
//  Place.swift
//  VolpisTestProject
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONRoot: Codable {
    let Status: Int
    let Result: [Place]
}

struct Place: Codable {
    let ObjectId: String
    let Title: String
    let Description: String
    let ImageUrl: String
    let Latitude: Double
    let longitude: Double
    
}
