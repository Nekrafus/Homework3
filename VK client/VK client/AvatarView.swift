//
//  AvatarView.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 15.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

@ IBDesignable class AvatarView: UIView
    
{
    override class var layerClass: AnyClass
        
    {
        return CAShapeLayer.self
    }
    
    func configure()
        
    {
        
        let avaLayer = CAShapeLayer()
        
        layer.cornerRadius = 50
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.contents = UIImage(named: "darkfit")?.cgImage
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.addSublayer(avaLayer)
        avaLayer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 8
        layer.shadowOffset = .zero
    }
    
    
}
