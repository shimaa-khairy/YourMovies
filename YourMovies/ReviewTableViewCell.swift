//
//  ReviewTableViewCell.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/27/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var reviewContent: UITextView!
    @IBOutlet weak var reviewAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
