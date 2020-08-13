//
//  MyFriendsPicturesCell.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 10.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class MyFriendsPicturesCell: UICollectionViewCell {
    @IBOutlet weak var picture: UIImageView!
    let likeControl = LikeControl()
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        likeControl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(likeControl)
        
        let _ =
        
            [
                likeControl.leftAnchor.constraint(equalTo: picture.rightAnchor ),
                likeControl.rightAnchor.constraint(equalTo: rightAnchor ),
                likeControl.centerXAnchor.constraint(equalTo: centerXAnchor )
                
            ]
    }
    
}
