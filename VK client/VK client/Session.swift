//
//  Session.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 13.08.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import Foundation

class Session
    
{
    var token : String
    var userId : Int
    
    static let shared = Session()
    private init()
    {
        
    }
}
