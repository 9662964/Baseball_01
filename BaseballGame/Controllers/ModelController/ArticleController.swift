//
//  ArticleController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
class ArticleController {
    
    static let finalURL = URL(string: "https://newsapi.org/v2/everything?q=major%20league%20baseball&apiKey=ae910eac68e44996a3e949c1458b8138")
    
//    https://newsapi.org/v2/everything?q=dodgers&apiKey=ae910eac68e44996a3e949c1458b8138
//      https://newsapi.org/v2/everything?q=Dodgers&apiKey=ae910eac68e44996a3e949c1458b8138
    
    private static let baseURL = URL(string: "https://newsapi.org/v2")
    private static let newsComponent = "everything"
    private static let articleQueryKey = "q"
    private static let apiKey = "apiKey"
    private static let apiValue = "ae910eac68e44996a3e949c1458b8138"
    
    static func searchArticleWith(searchTerm: String, completion: @escaping (Result<[Article], ArticleError>) -> Void) {
        guard let baseURL = baseURL else {return}
        let newsURL = baseURL.appendingPathComponent(newsComponent)
        var components = URLComponents(url: newsURL, resolvingAgainstBaseURL: true)
        let articleSearchQuery = URLQueryItem(name: articleQueryKey, value: searchTerm)
        let apiQueryItem = URLQueryItem(name: apiKey, value: apiValue)
        components?.queryItems = [articleSearchQuery,apiQueryItem]
        
        guard let finalURL = components?.url else { return }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let topLevel = try jsonDecoder.decode(TopLevelObject.self, from: data)
                let articles = topLevel.articles
                return completion(.success(articles))
            }catch{
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    
        
    }
    
    
    static func fetchArticles(completion: @escaping (Result<[Article], ArticleError>) -> Void) {
        guard let finalURL = finalURL else {return completion(.failure((.invalidURL)))}
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevel = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let articles = topLevel.articles
                return completion(.success(articles))
            }catch{
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(article: Article, completion: @escaping (Result<UIImage, ArticleError>) -> Void) {
        
        guard let finalURL = article.urlToImage else {return}
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.invalidURL))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            guard let urlToImage = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            return completion(.success(urlToImage))
            
        }.resume()
    }
    
    
}//End of Class
