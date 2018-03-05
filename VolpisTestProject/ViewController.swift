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

    @IBOutlet weak var tableView: UITableView!
    
    var placesArray = [Place]()
    let nib = "TableViewCell"
    let cellId = "TableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: cellId)
        
        RequestManager.getData { response in
            self.placesArray.append(contentsOf: response)
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func showPlaces(_ sender: UIButton) {
        var placesToShow = [Place]()
        for i in 0..<tableView.numberOfRows(inSection: 0) {
            let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! TableViewCell
            if cell.checkMark.state == .selected {
                placesToShow.append(placesArray[i])
            }
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
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.fill(withData: placesArray[indexPath.row])
        cell.prepareForReuse()
        return cell
    }
}

