//
//  ViewController.swift
//  VolpisTestProject
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    let downloader = ImageDownloader()
    var restaurants = [Restaurant]()
    
    @IBOutlet weak var tableView: UITableView!
    
    var placesArray = [Place]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    let nib = "TableViewCell"
    let cellId = "TableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: cellId)
        
        downloader.delegate = self
        
        JSONParser.fetchData(from: restaurants.count) { restaurants in
            self.restaurants.append(contentsOf: restaurants)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func showPlaces(_ sender: UIButton) {
        var placesToShow = [Place]()
        for place in placesArray {
//            if place.isChosen {
//                placesToShow.append(place)
//            }
        }
        guard let mapsVC = storyboard?.instantiateViewController(withIdentifier: String(describing: MapsViewController.self)) as? MapsViewController else {
            return
        }
        mapsVC.placesArray = placesToShow
        navigationController?.pushViewController(mapsVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        cell.tag = indexPath.row
        if indexPath.row == restaurants.count - 1 {
            JSONParser.fetchData(from: restaurants.count) { restaurants in
                self.restaurants.append(contentsOf: restaurants)
                self.tableView.reloadData()
            }
        }
        cell.fill(withData: restaurants[indexPath.row]) { url in
            if cell.imageView?.image == nil {
                cell.loadingIndicator.startAnimating()
                self.downloader.download(withUrl: url, forCell: indexPath)
            }
        }
        return cell
    }
}

extension ViewController: PlaceSelectionDelegate {
    func changeStateForPlace(atIndex: Int) {
        //placesArray[atIndex].isChosen = !placesArray[atIndex].isChosen
    }
}

extension ViewController: ImageDownloaderDelegate {
    func finished(withImage image: Data, forCell index: IndexPath) {
        guard let cell = tableView.cellForRow(at: index) as? TableViewCell else { return }
        cell.setImage(with: image)
    }
}
