//
//  alertView.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/31/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let shared = AlertView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var doneBtnLabel: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        parentView.removeFromSuperview()
        
    }
    private func commonInit() {
        img.layer.cornerRadius = 30
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        
        alertView.layer.cornerRadius = 15
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    enum AlertType {
        case Success
        case failure
    }
    
    func showAlert(title: String, message: String, alertType: AlertType) {
        self.titleLabel.text = title
        self.msgLabel.text = message
        
        switch alertType {
        case .Success:
            img.image = UIImage(named: "Success")
        case .failure:
            img.image = UIImage(named: "Failure")
            doneBtnLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
}
