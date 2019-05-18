//
//  CategoryCellVC.swift
//  WallpapersLive
//
//  Created by Antony Kolesynskyi on 4/18/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class CategoryCellVC: UITableViewCell {
    @IBOutlet weak var categoriImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
