//
//  MyGroupsCell.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 14.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class MyGroupsCell: UITableViewCell
    
{
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupAvatar: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      UIView.animate(withDuration: 0.3, animations:
              {
                  self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
          })
          
          }
      override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, animations:
          {
              self.transform = CGAffineTransform(scaleX: 1, y: 1)
      })
      
      }
    
}
