//
//  MyGroupsViewController.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 14.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit


struct Group: Equatable
{
    var groupName: String
    var groupAvatar: UIImage?
    
    init(_ groupName: String, _ groupAvatar: UIImage?)
    {
        self.groupName = groupName
        self.groupAvatar = groupAvatar
    }
}

var MyGroups: [Group] =
    
[
    Group("MDK", UIImage(named: "darkfit")),
    Group("My Moscow", UIImage(named: "darkfit")),
    Group("Vats", UIImage(named: "darkfit")),
    Group("Cat", UIImage(named: "darkfit")),
    Group("CatDogs", UIImage(named: "darkfit")),
    Group("Cats1", UIImage(named: "darkfit")),
    Group("Cats2", UIImage(named: "darkfit")),
    Group("Mats", UIImage(named: "darkfit"))
]



private let searchController = UISearchController(searchResultsController: nil)
private var filteredGroups = [Group]()



class MyGroupsViewController: UITableViewController
{
    
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        
    }
    
    

    
    @IBAction func addGroup(segue: UIStoryboardSegue)
    {
        if segue.identifier == "addGroup"
            
        {
            guard let allGroupsViewController = segue.source as? AllGroupsViewController else {return}
            
            
            if let indexPath = allGroupsViewController.tableView.indexPathForSelectedRow
                
            {
                let groups = allGroupsViewController.AllGroups[indexPath.row]
                
                if !MyGroups.contains(groups)
                {
                    MyGroups.append(groups)
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    override func numberOfSections(in TableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isFiltering
        {
            return filteredGroups.count
        }
        return MyGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as!
        MyGroupsCell
        
        var group: Group
        
        if isFiltering
        {
            group = filteredGroups[indexPath.row]
            
            cell.groupName.text = group.groupName
            cell.groupAvatar.image = group.groupAvatar
            
        }
        else
        {
            cell.groupName.text = MyGroups[indexPath.row].groupName
            cell.groupAvatar.image = MyGroups[indexPath.row].groupAvatar
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle == .delete
           {
            MyGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           }
    }
    
}





extension MyGroupsViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredGroups = MyGroups.filter({ (myGroup: Group) -> Bool in
            return myGroup.groupName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
}
