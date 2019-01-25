//
//  CustomTableViewCell.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 1/23/19.
//  Copyright © 2019 Danner Opp., LLC. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var postText: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
