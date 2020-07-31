//
//  GameScoreViewController.swift
//  BaseballGame
//
//  Created by iljoo Chae on 7/23/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BaseBallScoreViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var topObject: [TopObject] = []
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd"
        return dateFormatter.string(from: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        fetchInning(selectedDate: date)
        
        
    }
    @IBAction func datePickerChanged(_ sender: Any) {

  
            datePicker.datePickerMode = UIDatePicker.Mode.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MMM-dd"
            let selectedDate = dateFormatter.string(from: datePicker.date)
            print("From datePickerChanged: \(selectedDate)")
            fetchInning(selectedDate: selectedDate)
            tableView.reloadData()
        
    }
    
    
    //    MM/dd/yyyy
    func formattedDateFromString(strString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd"
        let strDate = dateFormatter.string(from: NSDate() as Date)
        print(strDate)
        //        return strDate
    }
    
    
    func fetchInning(selectedDate: String) {
        BaseballController.fetchGameResult(date: selectedDate) { (result) in
            switch result {
            case .success(let innings):
                self.topObject = innings
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return topObject.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as? GameScoreTableViewCell else {return UITableViewCell()}
        
        let topObject = self.topObject[indexPath.row]
        cell.topObject = topObject
        //     cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        print("from didSelectRow : \(index)")
        print("from topObject \(topObject[index.row	])")
        print("from innings\(topObject[index.row].innings)")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            if topObject[indexPath.row].homeTeamRuns != nil {
                guard let destinationVC = segue.destination as? ScoreDetailViewController else {return}
                let selectedInfo = topObject[indexPath.row]
                destinationVC.topObject = selectedInfo
            } else {
                print("no game yesterday")
            }
            
            
            
        }
    }
    
    
    
    
    
    
}
