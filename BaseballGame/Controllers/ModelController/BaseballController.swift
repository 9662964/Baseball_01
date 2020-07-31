//
//  BaseballController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class BaseballController {
    
    static let shared = BaseballController()
    
    
    
    
    struct StringConstants {
        fileprivate static let baseURL = "https://api.sportsdata.io/v3/mlb/scores/json/GamesByDate"
        fileprivate static let dateComponent = "2020-JUL-28"
        fileprivate static let apiKey = "key"
        fileprivate static let apiValue = "ff4a9a2106224854ad824a1e666bb42e"
    }
    

    
    static func fetchGameResult(date: String, completion: @escaping (Result<[TopObject],BaseballError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURL) else {return completion(.failure(.invalidURL))}
        
        
        print("From fetchGameResult: \(date)")

        

    
//        let formatter = DateFormatter()
//        var dateComponents = DateComponents()
//            dateComponents.setValue(-1, for: .day)
//            formatter.dateFormat = "yyyy-MMM-dd"
//        let now = Date()
//        guard let tempDate = Calendar.current.date(byAdding: dateComponents, to: now) else {return}
//            let yesterday = formatter.string(from: tempDate)
//            let today = formatter.string(from: now)

//        var today = formatter.string(from: now)
//            print(yesterday)
//            print(today)
        let dataComponent = baseURL.appendingPathComponent(date)
        
//        if selectedDate == "" {
//            let dataComponent = baseURL.appendingPathComponent(today)
//        }else{
//            let dateComponent = baseURL.appendingPathComponent(selectedDate)
//        }

        
        var components = URLComponents(url: dataComponent, resolvingAgainstBaseURL: true)
        let apiQueryItem = URLQueryItem(name: StringConstants.apiKey, value: StringConstants.apiValue)
        components?.queryItems = [apiQueryItem]

        guard let finalURL = components?.url else {return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) {(data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}

            let jsonDecoder = JSONDecoder()

            do {
                let topObject = try jsonDecoder.decode([TopObject].self, from: data)
                let gameResult = topObject
                print("from URL session: \(gameResult)")
//                print("from inning array: \(gameResult[0].innings[0])")
                
               
                
                return completion(.success(gameResult))
            }catch{
                print("\(error) -- \(error.localizedDescription)")
                return completion(.failure(.unableToDecode))
            }
            
        
            
        }.resume()
    }
} //End of class
