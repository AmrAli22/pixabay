//
//  ImagesCell.swift
//  pixabay
//
//  Created by Amr Ali on 7/16/18.
//  Copyright © 2018 TheAmrAli. All rights reserved.
//

import UIKit

class ImagesCell: UITableViewCell {

    @IBOutlet weak var ImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
