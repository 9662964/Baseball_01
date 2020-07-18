//
//  ArticleTableViewCell.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol PresentErrorToUserDelegate: class {
    func presentErrorToUser(error: LocalizedError)
}

class ArticleTableViewCell: UITableViewCell {

    //MARK: Properties
    
    
    //MARK: Outlet
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    
    var article: Article? {
        //as soon as get the Post and
        didSet{
            updateViews()
        }
    }
    
    weak var delegate: PresentErrorToUserDelegate?
    
    func updateViews() {
        guard let article = article else {return}
        
        articleTitle.text = article.title
        articleContent.text = article.content
        articleDescription.text = article.description
        articleImageView.image = nil
        
            ArticleController.fetchImage(article: article) {(result) in
                switch result {
                    
                case .success(let image):
                    DispatchQueue.main.async {
                        self.articleImageView.image = image
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.delegate?.presentErrorToUser(error: error)
                    }
                    print(error.localizedDescription)
                }
            }
        }
    
    //MARK: Action
    
    
    //MARK: Methods

}
