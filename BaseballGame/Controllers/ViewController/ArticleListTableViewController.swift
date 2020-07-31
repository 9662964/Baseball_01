//
//  ArticleListTableViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import SafariServices

class ArticleListTableViewController: UITableViewController,UISearchBarDelegate {
    
    @IBOutlet weak var articleSearchBar: UISearchBar!
    
    var tempSearchTerm: String  = ""
    
    
    
    var articles : [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticle()
        articleSearchBar.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
//        tableView.backgroundColor = UIColor.lightBlue
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    @IBAction func shareBtnTapped(_ sender: Any) {
       
        

        
            

        }
    
    func shareArticleUrlandTitle() {
      
    }
    
    
    func shareCaptureScreenImage() {
        // Capture the whole screen and share
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img!], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func favoriteBtnTapped(_ sender: Any) {
        print("Favorite btn tapped from atriclelisttableView")
        let indexPath = tableView.indexPathForSelectedRow
        print(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accept = UIContextualAction(style: .normal, title: "Favorite") { (action, view, nil) in
            
            print(indexPath)
            tableView.backgroundColor = UIColor.lightBlue
            self.tempSearchTerm = self.articles[indexPath.row].title ?? ""
            let tempUrl = self.articles[indexPath.row].url
            print(tempUrl)
            print(self.tempSearchTerm)
        }
        
        accept.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        //How to add icon
        //accept.image = #imageLiteral(resourceName: <#T##String#>)
        
        let shareBtn = UIContextualAction(style: .normal, title: "Share") { (action, view, nil) in
            print("Share btn tapped")
             //share the text string
            let articleURL = self.articles[indexPath.row].url
            
                     let textShare = [ articleURL  ]
                     let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
                     activityViewController.popoverPresentationController?.sourceView = self.view
                     self.present(activityViewController, animated: true, completion: nil)
                
                 print("shareArticleUrlandTitle func tapped")

        }
        
        shareBtn.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        //prevent full swipe
        let config = UISwipeActionsConfiguration(actions: [accept,shareBtn])
        config.performsFirstActionWithFullSwipe = false
        return config
        
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Like") { (action, view, nil) in
            print("like")
        }
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //    override func viewWillLayoutSubviews() {
    //        super.viewWillAppear(true)
    //        tableView.reloadData()
    //    }
    
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
                    self.presentErrorToUser(error: error)
                }
            }
        }
    }
    
    
    
    func fetchArticle() {
        ArticleController.fetchArticles { (result) in
            switch result {
            case .success(let articles):
                //                self.articles.append(article)
                self.articles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.presentErrorToUser(error: error)
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleTableViewCell else {return UITableViewCell()}
        let article = articles[indexPath.row]
        cell.article = article
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = articles[indexPath.row]
        let safariVC = SFSafariViewController(url:selectedArticle.url!)
        print(selectedArticle.url)
        safariVC.view.tintColor = .blue
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
    }
}



extension ArticleListTableViewController: PresentErrorToUserDelegate {
    func presentErrorToUser(error: LocalizedError) {
        self.presentErrorToUser(error: error)
    }
}

extension ArticleListTableViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
