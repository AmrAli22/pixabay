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
    
    
    func ConfigureCell(Image : UIImage)
    {
        self.ImgView.image = Image
    }
}
