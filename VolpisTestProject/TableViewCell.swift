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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fill(withData: Place) {
        objectName.text = withData.name
        objectDescr.text = withData.descr
        DispatchQueue.main.async {
            if let data = withData.imageData {
                self.objectImage.image = UIImage(data: data)
            }
            
        }

    }
    
    @IBAction func checkMark(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
}
