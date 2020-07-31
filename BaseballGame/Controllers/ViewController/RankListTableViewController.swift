//
//  RankListTableViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/18/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class RankListTableViewController: UITableViewController {

    var score:[String] = []
        
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        viewDidAppear(true)
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreArray.count
    }
    
    var scoreArray: [NSString] = []
    override func viewDidAppear(_ animated: Bool) {
        if let text = UserDefaults.standard.object(forKey: "score") as? [NSString] {
            scoreArray = text
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankCell", for: indexPath)
        if (indexPath.row % 2 == 0) {
             cell.backgroundColor = UIColor.lightBlue
         } else {
             cell.backgroundColor = UIColor.lightRed
         }
        cell.textLabel?.text = "\(indexPath.row + 1)"
        cell.detailTextLabel?.text = "\(scoreArray[indexPath.row]) Seconds"
        return cell
    }
}
