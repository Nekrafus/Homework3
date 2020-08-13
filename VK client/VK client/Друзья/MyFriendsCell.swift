//
//  MyFriendsCell.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 10.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell
    
{
    @IBOutlet weak var friendAvatarCotainerView: UIView!
    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendName:UILabel!
    
    
    @IBInspectable var shadowcolor: UIColor = .black
        
    {
        didSet{
            setNeedsDisplay()
        }
        
    }
    
    @IBInspectable var shadowradius: CGFloat = 5
        
    {
        didSet{
            setNeedsDisplay()
        }
        
    }
    
    @IBInspectable var shadowopacity: Float  =  10
        
    {
        didSet{
            setNeedsDisplay()
        }
        
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        friendAvatarCotainerView.layer.cornerRadius = friendAvatarCotainerView.bounds.width / 2
        friendAvatarCotainerView.layer.shadowColor = shadowcolor.cgColor
        friendAvatarCotainerView.layer.shadowRadius = shadowradius
        friendAvatarCotainerView.layer.shadowOpacity = shadowopacity / 10
        friendAvatarCotainerView.layer.shadowOffset = .zero
        friendAvatarCotainerView.layer.shadowPath = UIBezierPath(ovalIn: friendAvatarCotainerView.bounds).cgPath
        
        friendAvatar.layer.cornerRadius = friendAvatarCotainerView.bounds.width / 2
        
        friendAvatar.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
     
    
       
       
    
}
