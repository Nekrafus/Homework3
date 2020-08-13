//
//  MyFriendsPictures.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 10.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class MyFriendsPictures: UICollectionViewController
{

    var allPictures:[String]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        allPictures = [ "darkfit","darkfit","darkfit","darkfit","darkfit"]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int
        {
            return 1
        }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPictures.count        }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFriendsPicturesCell", for: indexPath) as! MyFriendsPicturesCell
        
        cell.picture.image = UIImage(named: "darkfit")
        
        return cell
    }

        
        
}
