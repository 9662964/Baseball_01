//
//  BaseBallError.swift
//  Reddit_01
//
//  Created by iljoo Chae on 6/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//
import Foundation

enum BaseballError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case thrownImageError(Error)
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data"
        case .thrownImageError(let error):
            return "There was an error \(error.localizedDescription)"
        case .unableToDecode:
            return "There wsa an error when trying to load the data"
        }
    }
}
