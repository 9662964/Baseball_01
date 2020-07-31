//
//  ScoreDetailViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/27/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ScoreDetailViewController: UIViewController {

    
    var topObject: TopObject?
    
    
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!

    @IBOutlet weak var inningLabel1: UILabel!
    @IBOutlet weak var inningLabel2: UILabel!
    @IBOutlet weak var inningLabel3: UILabel!
    @IBOutlet weak var inningLabel4: UILabel!
    @IBOutlet weak var inningLabel5: UILabel!
    @IBOutlet weak var inningLabel6: UILabel!
    @IBOutlet weak var inningLabel7: UILabel!
    @IBOutlet weak var inningLabel8: UILabel!
    @IBOutlet weak var inningLabel9: UILabel!
    @IBOutlet weak var inningLabel10: UILabel!
    @IBOutlet weak var inningLabel11: UILabel!
    
    @IBOutlet weak var homeTeamScoreLabel1: UILabel!
    @IBOutlet weak var homeTeamScoreLabel2: UILabel!
    @IBOutlet weak var homeTeamScoreLabel3: UILabel!
    @IBOutlet weak var homeTeamScoreLabel4: UILabel!
    @IBOutlet weak var homeTeamScoreLabel5: UILabel!
    @IBOutlet weak var homeTeamScoreLabel6: UILabel!
    @IBOutlet weak var homeTeamScoreLabel7: UILabel!
    @IBOutlet weak var homeTeamScoreLabel8: UILabel!
    @IBOutlet weak var homeTeamScoreLabel9: UILabel!
    @IBOutlet weak var homeTeamScoreLabel10: UILabel!
    @IBOutlet weak var homeTeamScoreLabel11: UILabel!
    
    
   
    @IBOutlet weak var awayTeamScoreLabel1: UILabel!
    @IBOutlet weak var awayTeamScoreLabel2: UILabel!
    @IBOutlet weak var awayTeamScoreLabel3: UILabel!
    @IBOutlet weak var awayTeamScoreLabel4: UILabel!
    @IBOutlet weak var awayTeamScoreLabel5: UILabel!
    @IBOutlet weak var awayTeamScoreLabel6: UILabel!
    @IBOutlet weak var awayTeamScoreLabel7: UILabel!
    @IBOutlet weak var awayTeamScoreLabel8: UILabel!
    @IBOutlet weak var awayTeamScoreLabel9: UILabel!
    @IBOutlet weak var awayTeamScoreLabel10: UILabel!
    @IBOutlet weak var awayTeamScoreLabel11: UILabel!
    
    @IBOutlet weak var homeStarter: UILabel!
    @IBOutlet weak var awayStarter: UILabel!
    @IBOutlet weak var winningPitcher: UILabel!
    @IBOutlet weak var losingPitcher: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
        
    }
    
    func updateViews() {
//        guard let topObject = self.topObject else {return}
        if let topObject = topObject {
            
            gameStatusLabel.text = "\(topObject.status)"
            awayTeamScoreLabel.text = "\(topObject.awayTeam)  \(topObject.awayTeamRuns ?? 0)"
            homeTeamScoreLabel.text = "\(topObject.homeTeam)  \(topObject.homeTeamRuns ?? 0)"
            
            homeStarter.text = "\(topObject.homeTeamStartingPitcherID ?? 0)"
            awayStarter.text = "\(topObject.awayTeamStartingPitcherID ?? 0)"
            
            winningPitcher.text = "\(topObject.winningPitcherID ?? 0)"
            losingPitcher.text = "\(topObject.losingPitcherID ?? 0)"
            
            
            
        
            let inningCount = topObject.innings.count
            print(inningCount)
            var index = 0
            
            while inningCount > index {
                switch index {
                case 0:
                    inningLabel1.text = "\(topObject.innings[index].inningNumber ?? 0)"
                    homeTeamScoreLabel1.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                    awayTeamScoreLabel1.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                    index += 1
                    case 1:
                        inningLabel2.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel2.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel2.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 2:
                        inningLabel3.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel3.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel3.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 3:
                        inningLabel4.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel4.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel4.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 4:
                        inningLabel5.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel5.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel5.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 5:
                        inningLabel6.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel6.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel6.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 6:
                        inningLabel7.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel7.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel7.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 7:
                        inningLabel8.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel8.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel8.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 8:
                        inningLabel9.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel9.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel9.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 9:
                        inningLabel10.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel10.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel10.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                    case 10:
                        inningLabel11.text = "\(topObject.innings[index].inningNumber ?? 0)"
                        homeTeamScoreLabel11.text = "\(topObject.innings[index].homeTeamRuns ?? 0)"
                        awayTeamScoreLabel11.text = "\(topObject.innings[index].awayTeamRuns ?? 0)"
                        index += 1
                default:
                    break;
                }
            }

//            if topObject.innings[0].awayTeamRuns != nil {
//                inningLabel1.text = "\(topObject.innings[0].inningNumber ?? 0)"
//                homeTeamScoreLabel1.text = "\(topObject.innings[0].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel1.text = "\(topObject.innings[0].awayTeamRuns ?? 0)"
//            }
//
//            if topObject.innings[1].awayTeamRuns != nil {
//                inningLabel2.text = "\(topObject.innings[1].inningNumber ?? 0)"
//                homeTeamScoreLabel2.text = "\(topObject.innings[1].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel2.text = "\(topObject.innings[1].awayTeamRuns ?? 0)"
//            }
//
//            if topObject.innings[2].awayTeamRuns != nil {
//                inningLabel3.text = "\(topObject.innings[2].inningNumber ?? 0)"
//                homeTeamScoreLabel3.text = "\(topObject.innings[2].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel3.text = "\(topObject.innings[2].awayTeamRuns ?? 0)"
//            }
//
//
//
//            if topObject.innings[3].awayTeamRuns == nil {
//                inningLabel4.text = "4"
//                homeTeamScoreLabel4.text = "0"
//                awayTeamScoreLabel4.text = "0"
//
//
//            }else{
//                inningLabel4.text = "\(topObject.innings[3].inningNumber ?? 0)"
//                homeTeamScoreLabel4.text = "\(topObject.innings[3].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel4.text = "\(topObject.innings[3].awayTeamRuns ?? 0)"
//
//            }
//
//            if topObject.innings[4].awayTeamRuns != nil {
//                inningLabel5.text = "\(topObject.innings[4].inningNumber ?? 0)"
//                homeTeamScoreLabel5.text = "\(topObject.innings[4].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel5.text = "\(topObject.innings[4].awayTeamRuns ?? 0)"
//            }else{
//                inningLabel9.text = "\(topObject.innings[4].inningNumber ?? 5)"
//                homeTeamScoreLabel5.text = "0"
//                awayTeamScoreLabel5.text = "0"
//            }
//
//            if topObject.innings[5].awayTeamRuns != nil {
//                inningLabel6.text = "\(topObject.innings[5].inningNumber ?? 0)"
//                homeTeamScoreLabel6.text = "\(topObject.innings[5].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel6.text = "\(topObject.innings[5].awayTeamRuns ?? 0)"
//            }else{
//                inningLabel9.text = "6"
//                homeTeamScoreLabel6.text = "0"
//                awayTeamScoreLabel6.text = "0"
//            }
//
//            if topObject.innings[6].awayTeamRuns != nil {
//                inningLabel7.text = "\(topObject.innings[6].inningNumber ?? 0)"
//                homeTeamScoreLabel7.text = "\(topObject.innings[6].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel7.text = "\(topObject.innings[6].awayTeamRuns ?? 0)"
//            }else{
//                inningLabel9.text = "\(topObject.innings[6].inningNumber ?? 0)"
//                homeTeamScoreLabel7.text = "0"
//                awayTeamScoreLabel7.text = "0"
//            }
//
//            if topObject.innings[7] == nil {
//                inningLabel9.text = "8"
//                homeTeamScoreLabel8.text = "0"
//                awayTeamScoreLabel8.text = "0"
//
//
//            }else{
//                inningLabel8.text = "\(topObject.innings[7].inningNumber ?? 0)"
//                homeTeamScoreLabel8.text = "\(topObject.innings[7].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel8.text = "\(topObject.innings[7].awayTeamRuns ?? 0)"
//            }
//
//            if topObject.innings[8].awayTeamRuns != nil {
//                inningLabel9.text = "\(topObject.innings[8].inningNumber ?? 0)"
//                homeTeamScoreLabel9.text = "\(topObject.innings[8].homeTeamRuns ?? 0)"
//                awayTeamScoreLabel9.text = "\(topObject.innings[8].awayTeamRuns ?? 0)"
//            }else{
//                inningLabel9.text = "\(topObject.innings[8].inningNumber ?? 0)"
//                homeTeamScoreLabel9.text = "0"
//                awayTeamScoreLabel9.text = "0"
//            }
//
//        }else{
//            awayTeamScoreLabel.text = "Game Postponed"
//            homeTeamScoreLabel.text = "Game Postponed"
//
//        }

        }
    }
   
}
