//
//  NewsViewControllerCell.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 24.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class NewsViewControllerCell: UITableViewCell
{
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    let react = ReactionViewController()
    
override func awakeFromNib()
    {
        super.awakeFromNib()
        react.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(react)
        
        
        let _ =
               
                   [
                       react.leftAnchor.constraint(equalTo: newsImage.rightAnchor ),
                       react.rightAnchor.constraint(equalTo: rightAnchor ),
                       react.centerXAnchor.constraint(equalTo: centerXAnchor )
                       
                   ]
    }
    
    
}
