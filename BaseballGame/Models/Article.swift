//
//  Article.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


struct TopLevelObject: Decodable  {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
    let content: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
}

class TempBtnTitle {
    static var btn1: String = ""
    var btn2: String = ""
    var btn3: String = ""
    var btn4: String = ""
    var btn5: String = ""
    var btn6: String = ""
    
    
}

