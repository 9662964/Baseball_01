//
//  SideMenuViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController {

    var menu: SideMenuNavigationController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu?.setNavigationBarHidden(true, animated: false)
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        SideMenuManager.default.leftMenuNavigationController = menu
        
    }
    
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }
 
}

class MenuListController: UITableViewController {
    var items = ["First", "Second", "Third","First", "Second", "Third","First", "Second", "Third","First", "Second", "Third"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "Hello"
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(items[indexPath.row])
    }
}
