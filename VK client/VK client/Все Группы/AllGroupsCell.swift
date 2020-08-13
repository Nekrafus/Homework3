//
//  AllGroupsCell.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 14.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class AllGroupsCell: UITableViewCell
{
    
    @IBOutlet weak var AllGroupAvatar: UIImageView!
    @IBOutlet weak var AllGroupName: UILabel!
    
    
    override func awakeFromNib()
        {
            super.awakeFromNib()
        }
    
        override func setSelected(_ selected: Bool, animated: Bool)
        {
            super.setSelected(selected, animated: animated)
        }
}
