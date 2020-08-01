//
//  ViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/13/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Darwin
import CoreData

class ViewController: UIViewController,UITextFieldDelegate {
    
    static let shared = ViewController()
    
    var timer = Timer()
    var totalTime: Int = 0

    

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
    @IBOutlet weak var checkBtnLabel: UIButton!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateFirstNumber()
        generateSecondNumber()
        generateThirdNumber()
        tempGeneratedNumber = String(firstNumber) + String(secondNumber) + String(thirdNumber)
        gettingGoldenNumber()
        number = []
        inputField.delegate = self
        checkBtnLabel.layer.cornerRadius = 10
        checkBtnLabel.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        checkBtnLabel.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testingAlert()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        presentAlert()

    }


    
    
    
    
    func testingAlert() {
        AlertView.shared.showAlert(title: "Test", message: "How to play Game", alertType: .Success)
    }
    
    //MARK: Actions
    @IBAction func playBtnTapped(_ sender: Any) {
        timerFunction()
    }
    
    @IBAction func pauseBtnTapped(_ sender: Any) {
        
        timer.invalidate()
    }
    
    @IBAction func checkBtnTapped(_ sender: Any) {
        inputValidation()
//        if inputField.text != "" {
//           print(number)
//           gettingInput()
//           checkStrike()
//           checkBall()
//           updateLabel()
//           indexNumber += 1
//           inputField.text = ""
//           inputField.backgroundColor = .white
//           inputField.placeholder = ""
//        }else{
//           inputField.placeholder = "Please enter 3 numbers"
//           inputField.backgroundColor = .cyan
//        }
    }
    
    
    func inputValidation() {
        if let tempInput = inputField.text {
            if tempInput.count < 3 {
                inputField.placeholder = "Please enter 3 numbers"
                inputField.backgroundColor = .cyan
            }else{
                print(number)
                gettingInput()
                checkStrike()
                checkBall()
                updateLabel()
                indexNumber += 1
                inputField.text = ""
                inputField.backgroundColor = .white
                inputField.placeholder = ""
            }
        }
    }
    
    @IBAction func resetBtnTapped(_ sender: Any) {
        restartGame()
    }
    
    @IBAction func admBtnTapped(_ sender: Any) {
            randomNumberLabel.text = "\(goldenNumber)"
    }

    
    
    
    //MARK: Methods
    //Dismiss keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = inputField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 16 characters
        return updatedText.count <= 3
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    @objc func Action() {
        totalTime += 1
        timerLabel.text = "\(totalTime)"
    }
    
    @objc func updateTimer() {
        totalTime += 1
        timerLabel.text = "\(totalTime)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("From textFieldShouldReturn: \(inputField .text!)")
        inputField.endEditing(true)
        return true
    }
    
    func timerFunction() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    func presentAlert() {
        let alertController = UIAlertController(title: "Get Start", message: "How to play game \n 1. Please select 3 numbers and then tap Check button \n 2. Base on your input, result will be shown \n 3. Keep trying input 3 number until you get 3 strikes \n 4.If you get correct number within 9 trials, you won if not then you lost" , preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let playAction = UIAlertAction(title: "Play", style: .default) { (_) in
            self.restartGame()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(playAction)
        self.present(alertController,animated: true)
    }
    
    func restartGame() {
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
          timerFunction()
    }
    
    func resetLabel() {
        strikeCount = 0
        ballCount = 0
        outCount = 0
        var labelReset = "Strike: \(strikeCount), Ball: \(ballCount), Out: \(outCount)"
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
    
        //For UserDefault
        var tempArray: [NSString] = [NSString]()
        var score: [String] = [String]()

    func checkStrike() {
            if  userInput[0] == goldenNumber[0] && userInput[1] == goldenNumber[1] && userInput[2] == goldenNumber[2] {
                strikeCount = 3
                let finalScore:String = String(totalTime)
                score.append(finalScore)
                UserDefaults.standard.set(score, forKey: "score")
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
        goldenNumber = tempGeneratedNumber.map{ String($0) }
        print("Golden number is : \(goldenNumber)")
    }

    func gettingInput() {
                    guard let input = inputField.text else {return}
                    rawInput = input
                    print("Before Input Split - first input number: \(input)")
                    userInput = input.map{ String($0) }
                    print("Input Number is \(userInput)")
                }
    
    func generateFirstNumber() {
        firstNumber = Int.random(in: 1...9)
        number.append(firstNumber)
    }//End of function
    
    func generateSecondNumber() {
        randomNumber = Int.random(in: 0...9)
        if randomNumber != firstNumber {
            secondNumber = randomNumber
            number.append(secondNumber)
        }else if randomNumber == firstNumber {
            randomNumber = Int.random(in: 0...9)
            number.append(secondNumber)
        }
    }//End of function
    
    func generateThirdNumber() {
        randomNumber = Int.random(in: 0...9)
        if randomNumber != firstNumber && randomNumber != secondNumber {
            thirdNumber = randomNumber
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
            number.append(thirdNumber)
        }
    }//End of Function
}//End of Class


