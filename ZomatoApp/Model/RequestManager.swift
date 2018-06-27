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
        
        Alamofire.request(baseUrl).responseJSON { response in
            let json = response.data
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(JSONRoot.self, from: json!)
                completion(result.Result)
            } catch let err{
                print(err)
            }
        }
        
    }
    
}
