//
//  Baseball.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation



struct TopObject: Decodable {
    let gameID: Int?
    let awayTeam: String
    let homeTeam: String
    let inning: Int?
    let awayTeamRuns: Int?
    let homeTeamRuns: Int?
    let status: String
    let winningPitcherID: Int?
    let losingPitcherID: Int?
    let awayTeamStartingPitcherID: Int?
    let homeTeamStartingPitcherID: Int?
    let dateTime: String?
    
    let innings: [Inning]

    enum CodingKeys: String, CodingKey {
    
//        case innings = "Innings"
        case losingPitcherID = "LosingPitcherID"
        case winningPitcherID = "WinningPitcherID"
        case awayTeamStartingPitcherID = "AwayTeamStartingPitcherID"
        case homeTeamStartingPitcherID = "HomeTeamStartingPitcherID"
        case status = "Status"
        case gameID = "GameID"
        case awayTeam = "AwayTeam"
        case homeTeam = "HomeTeam"
        case inning = "Inning"
        case awayTeamRuns = "AwayTeamRuns"
        case homeTeamRuns = "HomeTeamRuns"
        case innings = "Innings"
        case dateTime = "DateTime"
    }
}

enum AwayTeamStartingPitcher: String, Codable {
    case scrambled = "Scrambled"
}

enum Day: String, Codable {
    case the20200724T000000 = "2020-07-24T00:00:00"
}

enum InningHalf: String, Codable {
    case b = "B"
    case t = "T"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.inningTask(with: url) { inning, response, error in
//     if let inning = inning {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Inning
struct Inning: Codable {
    let inningID, gameID, inningNumber, awayTeamRuns: Int?
    let homeTeamRuns: Int?

    enum CodingKeys: String, CodingKey {
        case inningID = "InningID"
        case gameID = "GameID"
        case inningNumber = "InningNumber"
        case awayTeamRuns = "AwayTeamRuns"
        case homeTeamRuns = "HomeTeamRuns"
    }
}

enum Status: String, Codable {
    case statusFinal = "Final"
}

struct SelectedIndex {
    let selectedIndex: String
}






