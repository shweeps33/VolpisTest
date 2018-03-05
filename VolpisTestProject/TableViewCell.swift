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
    
    var cellPlace = Place()
    var delegate: PlaceSelectionDelegate?

    func fill(withData: Place) {
       
        DispatchQueue.main.async {
            self.cellPlace = withData
            self.objectName.text = withData.name
            self.objectDescr.text = withData.descr
            self.checkMark.isSelected = withData.isChosen
            if let data = withData.imageData {
                self.objectImage.image = UIImage(data: data)
            }
            
        }

    }
    
    @IBAction func checkMark(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.changeStateForPlace(atIndex: self.tag)
    }
    
    override func prepareForReuse() {
        self.objectName.text = ""
        self.objectDescr.text = ""
        self.checkMark.isSelected = false
    }
    
}

