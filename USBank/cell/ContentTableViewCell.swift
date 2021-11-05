//
//  ContentTableViewCell.swift
//  USBank
//
//  Created by Baiaman Gapparov on 11/5/21.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
        @IBOutlet var descLabel: UILabel!
        @IBOutlet var cellImageView: UIImageView!
    
    func setContents(content: Content) {
        cellImageView.image = content.image
        descLabel.text = content.description
    }
}
