//
//  ArticleError.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
enum ArticleError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
}
