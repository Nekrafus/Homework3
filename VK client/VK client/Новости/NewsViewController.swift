//
//  NewsViewController.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 24.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

struct News
{
    var newsLabel: String
    var newsImage: UIImage?
    
    init(_ newsLabel: String, _ newsImage: UIImage?)
    {
        self.newsLabel = newsLabel
        self.newsImage = newsImage
    }
}

var AllNews: [News] =
    
[
    News("Адвокат Ефремова Эльман Пашаев заявил о том, что актер «данное преступление не совершал». При этом представитель потерпевшей стороны Александр Добровинский сообщил о том, что Ефремов сначала признал вину, затем отказался.В", UIImage(named: "darkfit")),
    News("Описание2", UIImage(named: "darkfit")),
    News("Описание3", UIImage(named: "darkfit")),
    News("Описание4", UIImage(named: "darkfit"))
]


class NewsViewController: UITableViewController
    
{
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
         return AllNews.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
         let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewControllerCell", for: indexPath) as!
         NewsViewControllerCell
         
         cell.newsLabel.text = AllNews[indexPath.row].newsLabel
         cell.newsImage.image = AllNews[indexPath.row].newsImage
         
         return cell
     }
}
