//
//  RequestManager.swift
//  VolpisTestProject
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

//for item in jsonArray.values {
//    for obj in item.arrayValue {
//        var place = Place()
//        place.saveData(obj)
//        placesArray.append(place)
//    }
//    completion(placesArray)
//}

import Foundation
import Alamofire
import SwiftyJSON

class RequestManager {
    static let baseUrl = "http://zavtrakov.eurodir.ru/response.json"
    
    
    static func getData(completion: @escaping ([Place]) -> ()) {
        let url = RequestManager.baseUrl
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let jsonArray = json.dictionary {
                    var placesArray = [Place]()
                    let places = jsonArray.values.first
                    for item in places! {
                        var place = Place()
                        place.saveData(item.1)
                        placesArray.append(place)
                    }
                    completion(placesArray)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
