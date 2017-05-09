//
//  TableViewCell.swift
//  SwiftTest
//
//  Created by 张阳浩 on 17/4/19.
//  Copyright © 2017年 张阳浩. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var contentLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        contentLable.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
