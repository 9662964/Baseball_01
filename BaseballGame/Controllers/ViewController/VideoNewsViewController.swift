//
//  VideoNewsViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/17/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoNewsViewController: UIViewController,YTPlayerViewDelegate {

    @IBOutlet var playerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
//        playerView.load(withVideoId: "")
        playerView.load(withPlaylistId: "PLJcLhnl344eSLkTkYxhz9_QQelN6LkEDe", playerVars:["playsinline":1])
//        playerView.load(withVideoId: "70gKWkz5nXs", playerVars:["playsinline":1])
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
