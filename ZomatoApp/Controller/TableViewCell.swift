//
//  TableViewCell.swift
//  VolpisTestProject
//
//  Created by Admin on 03.03.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var objectName: UILabel!
    @IBOutlet weak var objectDescr: UILabel!
    @IBOutlet weak var checkMark: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    func fill(withData data: Restaurant, completion: @escaping ((String) -> Void)) {
        DispatchQueue.main.async {
            self.objectName.text = data.name
            self.objectDescr.text = data.address
            if let url = data.photoURL {
                completion(url)
            }
        }
    }
    
    @IBAction func checkMark(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    override func prepareForReuse() {
        self.objectName.text = ""
        self.objectDescr.text = ""
        self.checkMark.isSelected = false
    }
    
    func setImage(with image: Data) {
        loadingIndicator.stopAnimating()
        objectImage.image = UIImage(data: image)
    }
}
