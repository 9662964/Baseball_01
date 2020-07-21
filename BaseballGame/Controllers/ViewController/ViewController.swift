


//
//  ViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/13/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Darwin
import Foundation

class ViewController: UIViewController {
    
    static let shared = ViewController()
    
    var timer = Timer()
    var totalTime: Int = 0
    var score: [String] = []
    

    //MARK: - Properties
    var count: Int = 0
    var strike: Int = 0
    var randomNumber: Int = 0
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var thirdNumber: Int = 0
    var number = [Int]()
    var finalStrikeNumber: Int = 0
    var finalBallNumber: Int = 0
    var finalOutNumber:Int = 0
    var strikeCount: Int = 0
    var ballCount: Int = 0
    var outCount: Int = 0
    var indexNumber: Int = 0
    var rawInput: String = ""
    
    //MARK: - For Golden number
    var tempGeneratedNumber:String = ""
    var goldenNumber = [String]()
    

    //MARK: - For gettinginput func
    var inputNumber = [String]()
    var userInputAddToArray = [String]()
    var userInputSplitNumber = [String]()
    var userInput = [String]()
    var playBtn = UIBarButtonItem()
    var pauseBtn = UIBarButtonItem()
    

    //MARK: - Outlet
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateFirstNumber()
        generateSecondNumber()
        generateThirdNumber()
        tempGeneratedNumber = String(firstNumber) + String(secondNumber) + String(thirdNumber)
        //MARK: display golden number
        //randomNumberLabel.text = tempGeneratedNumber
        gettingGoldenNumber()
        number = []
//        self.playBtn = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(Action))
//
//        self.pauseBtn = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(pause))
        
    }
    @IBAction func playBtnTapped(_ sender: Any) {
        timerFunction()
    }
    
    
    
 
    
    func timerFunction() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBtnTapped(_ sender: Any) {
        
        timer.invalidate()
    }
    
//    @objc func pause() {
//        timer.invalidate()
//        self.navigationItem.rightBarButtonItem = playBtn
//    }
    
   @objc func Action() {
        totalTime += 1
        timerLabel.text = "\(totalTime)"
    }
    
    
    
    @objc func updateTimer() {
        totalTime += 1
        timerLabel.text = "\(totalTime)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    //MARK: - Action
    @IBAction func checkBtnTapped(_ sender: Any) {
        print(number)
        gettingInput()
        checkStrike()
        checkBall()
        updateLabel()
        indexNumber += 1
        inputField.text = ""
//        resetLabel()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    
    @IBAction func resetBtnTapped(_ sender: Any) {
        resetLabel()
        indexNumber = 0
        label0.text = ""
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        label5.text = ""
        label6.text = ""
        label7.text = ""
        label8.text = ""
        generateFirstNumber()
        generateSecondNumber()
        generateThirdNumber()
        tempGeneratedNumber = String(firstNumber) + String(secondNumber) + String(thirdNumber)
        gettingGoldenNumber()
        totalTime = 0
        number = []
    }
    
    func resetLabel() {
        strikeCount = 0
        ballCount = 0
        outCount = 0
        var labelRest = "Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        timer.invalidate()
        timerLabel.text = "0"
    }
    
    func updateLabel() {
        if indexNumber == 0 {
            label0.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        } else if indexNumber == 1{
            label1.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 2{
            label2.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 3{
            label3.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 4{
            label4.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 5{
            label5.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 6{
            label6.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 7{
            label7.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }else if indexNumber == 8{
            label8.text = "\(rawInput)   Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
        }

    }
    
    @IBAction func admBtnTapped(_ sender: Any) {
        gettingGoldenNumber()
        gettingInput()
    }
    
    //MARK: Methoods
        func checkStrike() {
            if  userInput[0] == goldenNumber[0] && userInput[1] == goldenNumber[1] && userInput[2] == goldenNumber[2] {
                strikeCount = 3
                let finalScore:String = String(totalTime)
                score.append(finalScore)
                print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
                timer.invalidate()
                
            }
            else if userInput[0] == goldenNumber[0] && userInput[1] == goldenNumber[1] ||
                userInput[0] == goldenNumber[0] && userInput[2] == goldenNumber[2] ||
                userInput[1] == goldenNumber[1] && userInput[2] == goldenNumber[2]
            {
                strikeCount = 2
                print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
            }
            else if userInput[0] == goldenNumber[0] || userInput[1] == goldenNumber[1] || userInput[2] == goldenNumber[2]
            {
                strikeCount = 1
                print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
            }
            else
            {
                strikeCount = 0
            }
    }
     
        func checkBall() {
            if
                userInput[0] == goldenNumber[1] && userInput[1] == goldenNumber[2] && userInput[2] == goldenNumber[0] ||
                userInput[0] == goldenNumber[2] && userInput[1] == goldenNumber[0] && userInput[2] == goldenNumber[1] ||
                userInput[1] == goldenNumber[0] && userInput[0] == goldenNumber[2] && userInput[2] == goldenNumber[1] ||
                userInput[1] == goldenNumber[2] && userInput[0] == goldenNumber[1] && userInput[2] == goldenNumber[0] ||
                userInput[2] == goldenNumber[0] && userInput[1] == goldenNumber[2] && userInput[0] == goldenNumber[1] ||
                userInput[2] == goldenNumber[1] && userInput[1] == goldenNumber[0] && userInput[2] == goldenNumber[1]
            {
                ballCount = 3
                  print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
            }
           else if
              userInput[0] == goldenNumber[1] && userInput[1] == goldenNumber[0] ||
              userInput[0] == goldenNumber[1] && userInput[1] == goldenNumber[2] || userInput[0] == goldenNumber[1] && userInput[2] == goldenNumber[0] ||
              userInput[0] == goldenNumber[2] && userInput[1] == goldenNumber[0] ||
              userInput[0] == goldenNumber[2] && userInput[2] == goldenNumber[0] ||
              userInput[0] == goldenNumber[2] && userInput[2] == goldenNumber[1] ||
              userInput[1] == goldenNumber[0] && userInput[0] == goldenNumber[1] ||
              userInput[1] == goldenNumber[0] && userInput[0] == goldenNumber[2] ||
              userInput[1] == goldenNumber[0] && userInput[2] == goldenNumber[1] ||
              userInput[1] == goldenNumber[2] && userInput[0] == goldenNumber[1] || userInput[1] == goldenNumber[2] && userInput[0] == goldenNumber[2] ||
              userInput[1] == goldenNumber[2] && userInput[2] == goldenNumber[1] ||
              userInput[2] == goldenNumber[0] && userInput[0] == goldenNumber[1] || userInput[2] == goldenNumber[0] && userInput[0] == goldenNumber[2] ||
              userInput[1] == goldenNumber[0] && userInput[1] == goldenNumber[2] ||
              userInput[2] == goldenNumber[1] && userInput[0] == goldenNumber[2] ||
              userInput[2] == goldenNumber[1] && userInput[1] == goldenNumber[0] || userInput[2] == goldenNumber[1] && userInput[1] == goldenNumber[2]
           {
                ballCount = 2
                  print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
            }
           else if userInput[0] == goldenNumber[1] || userInput[0] == goldenNumber[2] || userInput[1] == goldenNumber[0] || userInput[1] == goldenNumber[2] ||
                   userInput[2] == goldenNumber[0] || userInput[2] == goldenNumber[1]
            {
                ballCount = 1
                  print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
            } else {
                ballCount = 0
                  print("Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)")
            }
        }
    
    func gettingGoldenNumber() {
        print("Raw Gonden number  \(tempGeneratedNumber)" )
        //        let tempSplitNumber = tempGeneratedNumber.split(separator: " ")
        //        print("Splited Golden number : \(tempSplitNumber)")
        goldenNumber = tempGeneratedNumber.map{ String($0) }
        print("Golden number is : \(goldenNumber)")
    }
    
    
    func gettingInput() {
        guard let input = inputField.text else {return}
        rawInput = input
        print("Before Input Split - first input number: \(input)")
//        var userInputAddToArray = inputNumber.append(input)
//        print("Temp Input into Array: \(userInputAddToArray)")
        userInput = input.map{ String($0) }
        print("Input Number is \(userInput)")
    }
    
    func generateFirstNumber() {
        firstNumber = Int.random(in: 1...9)
        //        print("First Number is : \(firstNumber)")
        
        number.append(firstNumber)
    }//End of function
    
    
    func generateSecondNumber() {
        randomNumber = Int.random(in: 0...9)
        if randomNumber != firstNumber {
            secondNumber = randomNumber
            //            print("Second Number is :  \(secondNumber)")
            number.append(secondNumber)
        }else if randomNumber == firstNumber {
            //print("Opps~ We got same number, will draw once agein")
            randomNumber = Int.random(in: 0...9)
            //            print("Second number : \(secondNumber)")
            number.append(secondNumber)
        }
    }//End of function
    
    func generateThirdNumber() {
        randomNumber = Int.random(in: 0...9)
        if randomNumber != firstNumber && randomNumber != secondNumber {
            thirdNumber = randomNumber
            //            print("Third number is :  \(thirdNumber)\n\n")
            number.append(thirdNumber)
        } else if randomNumber == firstNumber || randomNumber == secondNumber {
            print("Got Same number as first or second number  \(randomNumber)")
            randomNumber = Int.random(in: 0...9)
            if randomNumber != firstNumber && randomNumber != secondNumber {
                thirdNumber = randomNumber
            }else if randomNumber == firstNumber || randomNumber == secondNumber {
                print("Wow, same number two in a row \(randomNumber)")
                randomNumber = Int.random(in: 0...9)
                if randomNumber != firstNumber && randomNumber != secondNumber {
                    thirdNumber = randomNumber
                } else if randomNumber == firstNumber || randomNumber == secondNumber {
                    print("Miracle, same number two in a row \(randomNumber)")
                    randomNumber = Int.random(in: 0...9)
                    thirdNumber = randomNumber
                }
            }
            //            print("Third number is : \(thirdNumber)\n\n")
            number.append(thirdNumber)
        }
    }//End of Function
    
    
    
    
}//End of Class



