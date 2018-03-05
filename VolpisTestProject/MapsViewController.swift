//
//  MapsViewController.swift
//  VolpisTestProject
//
//  Created by Admin on 04.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var placesArray = [Place]()
    var marker = GMSMarker()

    override func viewDidLoad() {
        super.viewDidLoad()

        for place in placesArray {
            let markerForLocation = GMSMarker()
            markerForLocation.icon = #imageLiteral(resourceName: "marker")
            markerForLocation.position = CLLocationCoordinate2D(latitude: place.coordinates.0, longitude: place.coordinates.1)
            markerForLocation.map = mapView
        }
    }
    @IBAction func backToList(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
