//
//  GameScoreTableViewCell.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/24/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class GameScoreTableViewCell: UITableViewCell {
    
    static let shared = GameScoreTableViewCell()
    
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    
    var topObject: TopObject? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let topObject = topObject else {return}
        
        switch topObject.homeTeam {
        case "ARI":
            homeTeamImageView.image = #imageLiteral(resourceName: "ARI")
        case "ATL":
            homeTeamImageView.image = #imageLiteral(resourceName: "ATL")
        case "BAL":
            homeTeamImageView.image = #imageLiteral(resourceName: "BAL")
        case "BOS":
            homeTeamImageView.image = #imageLiteral(resourceName: "BOS")
        case "CHC":
            homeTeamImageView.image = #imageLiteral(resourceName: "CHC")
        case "CHW":
            homeTeamImageView.image = #imageLiteral(resourceName: "CHW")
        case "CIN":
            homeTeamImageView.image = #imageLiteral(resourceName: "CIN")
        case "CLE":
            homeTeamImageView.image = #imageLiteral(resourceName: "CLE")
        case "COL":
            homeTeamImageView.image = #imageLiteral(resourceName: "COL")
        case "DET":
            homeTeamImageView.image = #imageLiteral(resourceName: "DET")
        case "HOU":
            homeTeamImageView.image = #imageLiteral(resourceName: "HOU")
        case "KC":
            homeTeamImageView.image = #imageLiteral(resourceName: "KC")
        case "LAA":
            homeTeamImageView.image = #imageLiteral(resourceName: "LAA")
        case "LAD":
            homeTeamImageView.image = #imageLiteral(resourceName: "LAD")
        case "MIA":
            homeTeamImageView.image = #imageLiteral(resourceName: "MIA")
        case "MIL":
            homeTeamImageView.image = #imageLiteral(resourceName: "MIL")
        case "MIN":
            homeTeamImageView.image = #imageLiteral(resourceName: "MIN")
        case "NYM":
            homeTeamImageView.image = #imageLiteral(resourceName: "NYM")
        case "NYY":
            homeTeamImageView.image = #imageLiteral(resourceName: "NYY")
        case "OAK":
            homeTeamImageView.image = #imageLiteral(resourceName: "OAK")
        case "PHI":
            homeTeamImageView.image = #imageLiteral(resourceName: "PHI")
        case "PIT":
            homeTeamImageView.image = #imageLiteral(resourceName: "PIT")
        case "SD":
            homeTeamImageView.image = #imageLiteral(resourceName: "SD")
        case "SEA":
            homeTeamImageView.image = #imageLiteral(resourceName: "SEA")
        case "SF":
            homeTeamImageView.image = #imageLiteral(resourceName: "SF")
        case "STL":
            homeTeamImageView.image = #imageLiteral(resourceName: "STL")
        case "TB":
            homeTeamImageView.image = #imageLiteral(resourceName: "TB")
        case "TEX":
            homeTeamImageView.image = #imageLiteral(resourceName: "TEX")
        case "TOR":
            homeTeamImageView.image = #imageLiteral(resourceName: "TOR")
        case "WSH":
            homeTeamImageView.image = #imageLiteral(resourceName: "WSH")
            
        default:
            homeTeamImageView.image = #imageLiteral(resourceName: "else")
        }
        
        switch topObject.awayTeam {
        case "ARI":
            awayTeamImageView.image = #imageLiteral(resourceName: "ARI")
        case "ATL":
            awayTeamImageView.image = #imageLiteral(resourceName: "ATL")
        case "BAL":
            awayTeamImageView.image = #imageLiteral(resourceName: "BAL")
        case "BOS":
            awayTeamImageView.image = #imageLiteral(resourceName: "BOS")
        case "CHC":
            awayTeamImageView.image = #imageLiteral(resourceName: "CHC")
        case "CHW":
            awayTeamImageView.image = #imageLiteral(resourceName: "CHW")
        case "CIN":
            awayTeamImageView.image = #imageLiteral(resourceName: "CIN")
        case "CLE":
            awayTeamImageView.image = #imageLiteral(resourceName: "CLE")
        case "COL":
            awayTeamImageView.image = #imageLiteral(resourceName: "COL")
        case "DET":
            awayTeamImageView.image = #imageLiteral(resourceName: "DET")
        case "HOU":
            awayTeamImageView.image = #imageLiteral(resourceName: "TOR")
        case "KC":
            awayTeamImageView.image = #imageLiteral(resourceName: "KC")
        case "LAA":
            awayTeamImageView.image = #imageLiteral(resourceName: "LAA")
        case "LAD":
            awayTeamImageView.image = #imageLiteral(resourceName: "LAD")
        case "MIA":
            awayTeamImageView.image = #imageLiteral(resourceName: "MIA")
        case "MIL":
            awayTeamImageView.image = #imageLiteral(resourceName: "MIL")
        case "MIN":
            awayTeamImageView.image = #imageLiteral(resourceName: "MIN")
        case "NYM":
            awayTeamImageView.image = #imageLiteral(resourceName: "NYM")
        case "NYY":
            awayTeamImageView.image = #imageLiteral(resourceName: "NYY")
        case "OAK":
            awayTeamImageView.image = #imageLiteral(resourceName: "OAK")
        case "PHI":
            awayTeamImageView.image = #imageLiteral(resourceName: "PHI")
        case "PIT":
            awayTeamImageView.image = #imageLiteral(resourceName: "PIT")
        case "SD":
            awayTeamImageView.image = #imageLiteral(resourceName: "SD")
        case "SEA":
            awayTeamImageView.image = #imageLiteral(resourceName: "SEA")
        case "SF":
            awayTeamImageView.image = #imageLiteral(resourceName: "SF")
        case "STL":
            awayTeamImageView.image = #imageLiteral(resourceName: "STL")
        case "TB":
            awayTeamImageView.image = #imageLiteral(resourceName: "TB")
        case "TEX":
            awayTeamImageView.image = #imageLiteral(resourceName: "TEX")
        case "TOR":
            awayTeamImageView.image = #imageLiteral(resourceName: "TOR")
        case "WSH":
            awayTeamImageView.image = #imageLiteral(resourceName: "WSH")
        default:
            awayTeamImageView.image = #imageLiteral(resourceName: "else")
        }
        
        
        
        if topObject.homeTeamRuns != nil {
            homeTeamScoreLabel.text = "\(String(describing: topObject.homeTeam)) \(topObject.homeTeamRuns ?? 0)"
            awayTeamScoreLabel.text = "\(String(describing: topObject.awayTeam)) \( topObject.awayTeamRuns ?? 0)"
        }else{
            homeTeamScoreLabel.text = "\(topObject.homeTeam) Vs. \(topObject.awayTeam)"
            awayTeamScoreLabel.text = "\(topObject.dateTime ?? "")"
//            awayTeamImageView.image = #imageLiteral(resourceName: "postponed")
//            homeTeamImageView.image = #imageLiteral(resourceName: "postponed1")
        }
        
        
    }
    
    
}//end of class
