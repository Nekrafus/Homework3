//
//  AllGroupsViewController.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 14.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

struct AllGroup
{
    var AllGroupName: String
    var AllGroupAvatar: UIImage?
    
    init(_ AllGroupName: String, _ AllGroupAvatar: UIImage?)
    {
        self.AllGroupName = AllGroupName
        self.AllGroupAvatar = AllGroupAvatar
    }
}

    


class AllGroupsViewController: UITableViewController
{
    var AllGroups: [Group] =
        
    [
        Group("1", UIImage(named: "darkfit")),
        Group("2", UIImage(named: "darkfit")),
        Group("3", UIImage(named: "darkfit")),
        Group("4", UIImage(named: "darkfit")),
        Group("5", UIImage(named: "darkfit")),
        Group("6", UIImage(named: "darkfit")),
        Group("7", UIImage(named: "darkfit")),
        Group("8", UIImage(named: "darkfit")),
        Group("9", UIImage(named: "darkfit")),
        Group("10", UIImage(named: "darkfit")),
        Group("11", UIImage(named: "darkfit")),
        Group("12", UIImage(named: "darkfit")),
        Group("13", UIImage(named: "darkfit")),
        Group("14", UIImage(named: "darkfit")),
        Group("15", UIImage(named: "darkfit")),
        Group("16", UIImage(named: "darkfit")),
        Group("17", UIImage(named: "darkfit")),
    ]

    override func viewDidLoad()
        
    {
        super.viewDidLoad()
    }
    
   
    override func numberOfSections(in TableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AllGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as!
        AllGroupsCell
        
        cell.AllGroupName.text = AllGroups[indexPath.row].groupName
        cell.AllGroupAvatar.image = AllGroups[indexPath.row].groupAvatar
        
        return cell
    }
    
   
    
    
    
    
    
}
