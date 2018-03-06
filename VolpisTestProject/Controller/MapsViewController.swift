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
    let baseCoordinates = CLLocationCoordinate2D(latitude: 49.8383, longitude: 24.0232)
    let zoom = 13.0

    override func viewDidLoad() {
        super.viewDidLoad()

        for place in placesArray {
            let markerForLocation = GMSMarker()
            markerForLocation.icon = #imageLiteral(resourceName: "marker")
            markerForLocation.title = place.name
            markerForLocation.position = CLLocationCoordinate2D(latitude: place.coordinates.0, longitude: place.coordinates.1)
            markerForLocation.map = mapView
        }
        
        let camera = GMSCameraPosition.camera(withTarget: baseCoordinates, zoom: Float(zoom))
        mapView.animate(to: camera)
    }
    @IBAction func backToList(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension MapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 40))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        
        let label = UILabel(frame: CGRect.init(x: 10, y: 120, width: 180, height: 20))
        label.text = marker.title
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .center
        
        view.addSubview(label)
        return view
    }
}

