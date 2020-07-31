//
//  ArticleSearchTableViewCell.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class ArticleSearchTableViewCell: UITableViewCell {

  
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    var article: Article? {
        didSet{
            updateView()
        }
    }
    
    weak var delegate: PresentErrorToUserDelegate?

    func updateView() {
        
        guard let article = article else {return}
        articleTitle.text = article.title
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
        
    }//End of function

}//End Of class
