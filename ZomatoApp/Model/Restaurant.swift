//
//  Restaurant.swift
//  VolpisTestProject
//
//  Created by Davyd Shved on 6/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Restaurant {
    var id: String
    var name: String
    var photoURL: String?
    var rating: String?
    var latitude: Double?
    var longitude: Double?
    var city: String?
    var ratingColor: String?
    var url: String?
    var address: String?
    
    init() {
        id = ""
        name = ""
        latitude = nil
        longitude = nil
        photoURL = nil
        rating = nil
        city = nil
        rating = nil
        url = nil
        address = nil
    }
    
    init(id: String, name: String, photoURL: String? = nil, rating: String? = nil, latitude: Double? = nil, longitute: Double? = nil, city: String? = nil, ratingColor: String? = nil, url: String? = nil) {
        self.id = id
        self.name = name
        if let photoURL1 = photoURL {
            self.photoURL = photoURL1
        }
        if let rating1 = rating {
            self.rating = rating1
        }
        self.latitude = latitude
        self.longitude = longitute
        if let city1 = city {
            self.city = city1
        }
        if let ratingColor1 = ratingColor {
            self.ratingColor = ratingColor1
        }
        if let url1 = url {
            self.url = url1
        }
    }
    
}
