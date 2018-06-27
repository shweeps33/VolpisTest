//
//  JSONParser.swift
//  VolpisTestProject
//
//  Created by Davyd Shved on 6/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import Alamofire

let zomatoKey = "0c24e0cda37830f6b6f56ad7404ac565"
let buffer = 20

class JSONParser {
    static func fetchData(from start: Int, amount: Int? = 20, completion: @escaping (([Restaurant]) -> Void)) {
        var restList = [Restaurant]()
        let centerLatitude = 19.06558
        let centerLongitude = 72.86215
        let urlString = "https://developers.zomato.com/api/v2.1/search?&lat=\(centerLatitude)&lon=\(centerLongitude)&start=\(start)&count=\(amount)"
        let headers: HTTPHeaders = [
            "user_key": zomatoKey,
            "Accept": "application/json"
        ]
        Alamofire.request(urlString, headers: headers)
            .responseJSON { response in
                if response.response?.statusCode == 200 {
                    do {
                        guard let data = response.data else { return }
                        if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let restaurants = json["restaurants"] as? [NSDictionary] {
                                for rest in restaurants {
                                    let restaurant = rest["restaurant"] as! NSDictionary
                                    let id = restaurant["id"] as! String
                                    let url = restaurant["url"] as! String
                                    let thumb = restaurant["thumb"] as! String
                                    let name = restaurant["name"] as! String
                                    var newRest = Restaurant(id: id, name: name, photoURL: thumb, url: url)
                                    
                                    if let location = restaurant["location"] as? NSDictionary {
                                        newRest.city = location["city"] as! String
                                        newRest.address = location["address"] as! String
                                        newRest.latitude = Double(location["latitude"] as! String)
                                        newRest.longitude = Double(location["longitude"] as! String)
                                    }

                                    if let user_rating = restaurant["user_rating"] as? NSDictionary {
                                        newRest.rating = user_rating["aggregate_rating"] as! String
                                        newRest.ratingColor = user_rating["rating_color"] as! String
                                    }
                                    restList.append(newRest)
                                }
                                completion(restList)
                            }
                        }
                        
                    } catch {
                        print(error)
                    }
                }
        }
    }
    
}

