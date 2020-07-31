//
//  ArticleSearchViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import SafariServices
import SideMenu

class ArticleSearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {
    
    static let shared = ArticleSearchViewController()
    var menu: SideMenuNavigationController?
    
    var temp: TempBtnTitle?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var articleSearchBar: UISearchBar!
    @IBOutlet weak var searchBtn1Label: UIButton!
    @IBOutlet weak var searchBtn2Label: UIButton!
    @IBOutlet weak var searchBtn3Label: UIButton!
    @IBOutlet weak var searchBtn4Label: UIButton!
    @IBOutlet weak var searchBtn5Label: UIButton!
    @IBOutlet weak var searchBtn6Label: UIButton!
 
    var tempSearchTerm: String = ""
    var articles: [Article] = []
//    var searTermFromBtn1: String = ""
//    var searTermFromBtn2: String = ""
//    var searTermFromBtn3: String = ""
//    var searTermFromBtn4: String = ""
//    var searTermFromBtn5: String = ""
//    var searTermFromBtn6: String = ""

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticle()
        articleSearchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        menu?.setNavigationBarHidden(true, animated: false)
        menu = SideMenuNavigationController(rootViewController: MenuListController1())
        menu?.leftSide = false
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        if let btn1label = UserDefaults.standard.object (forKey: "btn1") as? NSString {
            searchBtn1Label.setTitle(btn1label as String, for: .normal)
        }
        if let btn2label = UserDefaults.standard.object (forKey: "btn2") as? NSString {
            searchBtn2Label.setTitle(btn2label as String, for: .normal)
        }
        if let btn3label = UserDefaults.standard.object (forKey: "btn3") as? NSString {
            searchBtn3Label.setTitle(btn3label as String, for: .normal)
        }
        if let btn4label = UserDefaults.standard.object (forKey: "btn4") as? NSString {
            searchBtn4Label.setTitle(btn4label as String, for: .normal)
        }
        if let btn5label = UserDefaults.standard.object (forKey: "btn5") as? NSString {
            searchBtn5Label.setTitle(btn5label as String, for: .normal)
        }
        if let btn6label = UserDefaults.standard.object (forKey: "btn6") as? NSString {
            searchBtn6Label.setTitle(btn6label as String, for: .normal)
        }

        searchBtn1Label.layer.cornerRadius = 0
        searchBtn1Label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        searchBtn1Label.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchBtn2Label.layer.cornerRadius = 0
        searchBtn2Label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        searchBtn2Label.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchBtn3Label.layer.cornerRadius = 0
        searchBtn3Label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        searchBtn3Label.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchBtn4Label.layer.cornerRadius = 0
        searchBtn4Label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        searchBtn4Label.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchBtn5Label.layer.cornerRadius = 0
        searchBtn5Label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        searchBtn5Label.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchBtn6Label.layer.cornerRadius = 0
        searchBtn6Label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        searchBtn6Label.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        searchBtnTitle()
//        btnTitleUpdate()
        
    }
    
    //MARK: Testing
    
//    func btnTitleUpdate() {
//        searchBtn1Label.setTitle(temp?.btn1, for: .normal)
//        searchBtn1Label.setTitle(temp?.btn2, for: .normal)
//        searchBtn1Label.setTitle(temp?.btn3, for: .normal)
//        searchBtn1Label.setTitle(temp?.btn4, for: .normal)
//        searchBtn1Label.setTitle(temp?.btn5, for: .normal)
//        searchBtn1Label.setTitle(temp?.btn6, for: .normal)
//    }
    
    

    //MARK: Action
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }
    
    @IBAction func searchBtn1Tapped(_ sender: UIButton) {
        var tempSearchTerm1 = searchBtn1Label.currentTitle ?? ""
        let searchTerm = tempSearchTerm1
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }

    }
    
    @IBAction func searchBtn2Tapped(_ sender: UIButton) {
        var tempSearchTerm = searchBtn2Label.currentTitle
        guard let searchTerm = tempSearchTerm else {return}
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }

    }
    
    @IBAction func searchBtn3Tapped(_ sender: UIButton) {
        var tempSearchTerm = searchBtn3Label.currentTitle
        guard let searchTerm = tempSearchTerm else {return}
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }

    }
    
    @IBAction func searchBtn4Tapped(_ sender: UIButton) {
        var tempSearchTerm = searchBtn4Label.currentTitle
        guard let searchTerm = tempSearchTerm else {return}
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }

    }
    
    @IBAction func searchBtn5Tapped(_ sender: UIButton) {
        var tempSearchTerm = searchBtn5Label.currentTitle
        guard let searchTerm = tempSearchTerm else {return}
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }

    }
    
    @IBAction func searchBtn6Tapped(_ sender: UIButton) {
        var tempSearchTerm = searchBtn6Label.currentTitle
        guard let searchTerm = tempSearchTerm else {return}
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }


    //MARK: Methods
    func updateBtnTitleDelegate() {
        let controller = ArticleSearchSettingViewController()
        controller.delegate = self
        navigationController?.popViewController(animated: true)
    }
    
    func searchBtnTitle() {
    
    }
    
    func searchFromSideMenu(term: String) {
        let tempSearchTerm = term
        let searchTerm = tempSearchTerm
       ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
           switch result {
           case .success(let articles):
               DispatchQueue.main.async {
                   self.articles = articles
                   self.articleSearchBar.text = ""
               }
           case .failure(let error):
               print(error, error.localizedDescription)
               DispatchQueue.main.async {
                   self.presentErrorToUser(localizedError: error)
               }
           }
       }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = articleSearchBar.text, !searchTerm.isEmpty else {return}
        ArticleController.searchArticleWith(searchTerm: searchTerm) {(result) in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                    self.articleSearchBar.text = ""
                }
            case .failure(let error):
                print(error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func fetchArticle() {
        ArticleController.fetchArticles { (result) in
            switch result {
            case .success(let articles):
                self.articles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }

    //Swift feature
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favorite = UIContextualAction(style: .normal, title: "Like to Save") { (action, view, nil) in
            print(indexPath)
            tableView.backgroundColor = UIColor.lightBlue
            self.tempSearchTerm = self.articles[indexPath.row].title ?? ""
            let tempUrl = self.articles[indexPath.row].url
            print(tempUrl)
            print(self.tempSearchTerm)
        }
        favorite.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        let shareBtn = UIContextualAction(style: .normal, title: "Share") { (action, view, nil) in
            print("Share btn tapped")
            let articleURL = self.articles[indexPath.row].url
            let textShare = [articleURL]
            let activityController = UIActivityViewController(activityItems: textShare, applicationActivities: nil)
            activityController.popoverPresentationController?.sourceView = self.view
                 self.present(activityController, animated: true, completion: nil)
             print("shareArticleUrlandTitle func tapped")
        }
        shareBtn.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        let config = UISwipeActionsConfiguration(actions: [favorite, shareBtn])
        config.performsFirstActionWithFullSwipe = false
        return config
    }

    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleSearchTableViewCell else {return UITableViewCell()}
        let article = articles[indexPath.row]
        cell.article = article
        cell.delegate = self
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSetting" {
            guard let destination = segue.destination as? ArticleSearchSettingViewController else {return}
            destination.delegate = self
            
            
            
        }
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = articles[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        let safariVC = SFSafariViewController(url:selectedArticle.url!)
        print(selectedArticle.url)
        safariVC.view.tintColor = .blue
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
    }
}

extension ArticleSearchViewController: PresentErrorToUserDelegate {
    func presentErrorToUser(error: LocalizedError) {
        self.presentErrorToUser(error: error)
    }
}

extension ArticleSearchViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

//SideMenu
class MenuListController1: UITableViewController {
    
    var searchTerm: String = ""
    var items = ["Love","Hyunday","Samsung"]
    static let shared = MenuListController1()

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
//        print(items[indexPath.row])
        searchTerm = items[indexPath.row]
        print("Search term is \(searchTerm)")
        ArticleSearchViewController.shared.searchFromSideMenu(term: searchTerm)
    }
    
    func slideMenuSearTearm() {
        let indexPath = tableView.indexPathForSelectedRow
        print("From slideMenuSearteam function : \(indexPath)")
    }
    

}


extension ArticleSearchViewController: UpdateBtnTitleDelegate {
    func settingBtnTitle(btn1: String, btn2: String, btn3: String, btn4: String, btn5: String, btn6: String) {
        
        searchBtn1Label.setTitle(btn1, for: .normal)
        searchBtn2Label.setTitle(btn2, for: .normal)
        searchBtn3Label.setTitle(btn3, for: .normal)
        searchBtn4Label.setTitle(btn4, for: .normal)
        searchBtn5Label.setTitle(btn5, for: .normal)
        searchBtn6Label.setTitle(btn6, for: .normal)
        
        
        let button1label:String = btn1
        let button2label:String = btn2
        let button3label:String = btn3
        let button4label:String = btn4
        let button5label:String = btn5
        let button6label:String = btn6
        
        UserDefaults.standard.set(button1label, forKey: "btn1")
        UserDefaults.standard.set(button2label, forKey: "btn2")
        UserDefaults.standard.set(button3label, forKey: "btn3")
        UserDefaults.standard.set(button4label, forKey: "btn4")
        UserDefaults.standard.set(button5label, forKey: "btn5")
        UserDefaults.standard.set(button6label, forKey: "btn6")
        
        
        
//        print(btn1)
//        print(btn2)
//        print(btn3)
        
    }
    
    

    
    
}
