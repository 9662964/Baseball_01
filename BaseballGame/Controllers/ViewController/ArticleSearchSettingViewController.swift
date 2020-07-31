//
//  ArticleSearchSettingViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//



import UIKit

protocol UpdateBtnTitleDelegate: AnyObject {
    func settingBtnTitle(btn1: String, btn2: String, btn3: String, btn4: String, btn5: String, btn6: String)
}

class ArticleSearchSettingViewController: UIViewController {
    var temp: TempBtnTitle?
    
    public weak var delegate: UpdateBtnTitleDelegate?
    
    @IBOutlet weak var settingBtnLabel: UIButton!
    
    var btn1SearchTerm: String = ""
    //MARK: Outlet
    @IBOutlet weak var btn1TextField: UITextField!
    @IBOutlet weak var btn2TextField: UITextField!
    @IBOutlet weak var btn3TextField: UITextField!
    @IBOutlet weak var btn4TextField: UITextField!
    @IBOutlet weak var btn5TextField: UITextField!
    @IBOutlet weak var btn6TextField: UITextField!
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBtnLabel.layer.cornerRadius = 10
        settingBtnLabel.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        settingBtnLabel.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }
    //MARK: Actions
    @IBAction func settingBtnTapped(_ sender: Any) {
        
//        TempBtnTitle.btn1 = btn1TextField.text ?? "abcd"
//        For Delegate
        delegate?.settingBtnTitle(btn1: btn1TextField.text ?? "", btn2: btn2TextField.text ?? "", btn3: btn3TextField.text ?? "", btn4: btn4TextField.text ?? "", btn5: btn5TextField.text ?? "", btn6: btn6TextField.text ?? "")
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
//
//        print("SettingBtnTapped")
        
        //For SOT
//        temp?.btn1 = btn1TextField.text ?? ""
//        temp?.btn2 = btn1TextField.text ?? ""
//        temp?.btn3 = btn1TextField.text ?? ""
//        temp?.btn4 = btn1TextField.text ?? ""
//        temp?.btn5 = btn1TextField.text ?? ""
//        temp?.btn6 = btn1TextField.text ?? ""
//        print(temp?.btn1)
    }
}


