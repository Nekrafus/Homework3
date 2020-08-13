//
//  MyFriendsViewController.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 10.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

struct MyFriend
{
    var friendName: String
    var friendAvatar: UIImage?
    
    init(_ friendName: String, _ friendAvatar: UIImage?)
    {
        self.friendName = friendName
        self.friendAvatar = friendAvatar
    }
}

var MyFriends: [MyFriend] =
    
[
    MyFriend("Вася", UIImage(named: "darkfit")),
    MyFriend("Паша", UIImage(named: "darkfit")),
    MyFriend("Артем", UIImage(named: "darkfit")),
    MyFriend("Влад", UIImage(named: "darkfit")),
    MyFriend("Витя", UIImage(named: "darkfit")),
    MyFriend("Игорь", UIImage(named: "darkfit")),
    MyFriend("Вова", UIImage(named: "darkfit")),
    MyFriend("Катя", UIImage(named: "darkfit")),
    MyFriend("Кирилл", UIImage(named: "darkfit"))
]

var sections : [Character: [MyFriend]] = [:]
var sectionTitle = [Character]()


private let searchController = UISearchController(searchResultsController: nil)
private var filteredFriends = [MyFriend]()


class MyFriendsViewController: UITableViewController
    
{
    
    
    
    
    
    
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        
        
        for friend in MyFriends
            
        {
            let firstLetter = friend.friendName.first!
            if sections[firstLetter] != nil
            {
                sections[firstLetter]?.append(friend)
            }
            else
            {
                sections[firstLetter] = [friend]
            }
        }
        sectionTitle = Array(sections.keys)
        
    }
    
    override func numberOfSections(in TableView: UITableView) -> Int
    {
        return sections.count
    }
    
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]?
    {
        return sectionTitle.map{String($0)}
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
        
        {
            return String(sectionTitle[section])
        }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isFiltering {
            return filteredFriends.count
        }
        return sections[sectionTitle[section]]?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as!
        MyFriendsCell
        
        
        var ffriend: MyFriend
        
        if isFiltering
            
        {
            ffriend = filteredFriends[indexPath.row]
            cell.friendName.text = ffriend.friendName
        }
            
        else
        {
            guard let friend = sections[sectionTitle[indexPath.section]]?[indexPath.row]
            else {fatalError()}
            cell.friendName.text = friend.friendName
        }
        
        
        
            
        
        cell.friendAvatar.image = MyFriends[indexPath.row].friendAvatar
        return cell
    }
    
    
}

extension MyFriendsViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredFriends = MyFriends.filter({ (myFriend: MyFriend) -> Bool in
            return myFriend.friendName.lowercased().contains(searchText.lowercased())
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
