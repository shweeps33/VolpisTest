//
//  Place.swift
//  VolpisTestProject
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Place {
    var name: String?
    var imageUrl: String? {
        didSet {
            let url = URL(string: imageUrl ?? "")
            if let data = try? Data(contentsOf: url!) {
                imageData = data
            }
        }
    }
    var descr: String?
    var coordinates: (Double, Double)
    var imageData: Data?
    var isChosen: Bool
    
    init() {
        name = ""
        imageUrl = ""
        descr = ""
        coordinates = (0.0, 0.0)
        imageData = Data()
        isChosen = false
    }
    
    mutating func saveData(_ data: JSON) {
        self.name = data["Title"].string ?? ""
        self.descr = data["Description"].string ?? ""
        //self.imageUrl = data["ImageUrl"].string ?? ""
        let lat = data["Latitude"].double ?? 0.0
        let long = data["longitude"].double ?? 0.0
        self.coordinates = (lat, long)
    }
    
    mutating func placeIsChosen(_ choise: Bool) {
        self.isChosen = choise
    }
}
