//
//  ViewController.swift
//  Clock and Organization App
//
//  Created by Jacob Kotzamanis (Student) on 10/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeZoneBackgroundBorder: UIView!
    
    @IBOutlet weak var timeZoneLabel: UILabel!
    
    @IBOutlet weak var changeTimeZoneSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var timeDateBackgroundBorder: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!

    
    let months = ["January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    
    
    
    
    @IBOutlet weak var startStopWatchBackgroundBorder: UIView!
    
    @IBOutlet weak var startStopwatchButton: UIButton!
    
    @IBOutlet weak var stopWatchBackgroundBorder: UIView!
    
    @IBOutlet weak var stopWatchLabel: UILabel!
    
    @IBOutlet weak var stopClearBackgroundBorder: UIView!
    
    @IBOutlet weak var stopStopWatchButton: UIButton!
    
    @IBOutlet weak var clearStopWatchButton: UIButton!
    
    @IBOutlet weak var changeBackgroundColorBackgroundBorder: UIView!
    
    @IBOutlet weak var changeBackgroundColorLabel: UILabel!
    
    @IBOutlet weak var backgroundColorBorder: UIView!
    
    @IBOutlet weak var backgroundColorBlueButton: UIButton!
    
    @IBOutlet weak var backgroundCColorOrangeButton: UIButton!
    
    @IBOutlet weak var backgroundColorGreenButton: UIButton!
    
    @IBOutlet weak var backgroundColorBlackButton: UIButton!
    
    @IBOutlet weak var backgroundColorYellowButton: UIButton!
    
    @IBOutlet weak var backgroundColorPurpleButton: UIButton!
    
    let timer = Timer()
    let dateFormatter = DateFormatter()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        dateFormatter.timeZone = TimeZone(abbreviation: "CST")
        timerRun()
        
        timeZoneLabel.text = "Central"
        
        timeZoneBackgroundBorder.layer.cornerRadius = 10
        timeZoneLabel.layer.cornerRadius = 10
        changeTimeZoneSegmentedControl.layer.cornerRadius = 10
        timeDateBackgroundBorder.layer.cornerRadius = 10
        timeLabel.layer.cornerRadius = 10
        dateLabel.layer.cornerRadius = 10
        startStopWatchBackgroundBorder.layer.cornerRadius = 10
        startStopwatchButton.layer.cornerRadius = 10
        stopClearBackgroundBorder.layer.cornerRadius = 10
        stopStopWatchButton.layer.cornerRadius = 10
        stopWatchBackgroundBorder.layer.cornerRadius = 10
        stopWatchLabel.layer.cornerRadius = 10
        
        clearStopWatchButton.layer.cornerRadius = 10
        changeBackgroundColorBackgroundBorder.layer.cornerRadius = 10
        changeBackgroundColorLabel.layer.cornerRadius = 10
        backgroundColorBorder.layer.cornerRadius = 10
        backgroundColorBlueButton.layer.cornerRadius = 15
        backgroundCColorOrangeButton.layer.cornerRadius = 15
        backgroundColorGreenButton.layer.cornerRadius = 15
        backgroundColorBlackButton.layer.cornerRadius = 15
        backgroundColorYellowButton.layer.cornerRadius = 15
        backgroundColorPurpleButton.layer.cornerRadius = 15
    }
    
    func clockFunc() {
      
       let date = Date()
   
       dateFormatter.dateFormat = "hh:mm:ss a"
       let currentTime = dateFormatter.string(from: date)
       self.timeLabel.text = currentTime
       
       dateFormatter.dateFormat = "MM/dd/yyyy"
       
       let calendar = Calendar.current
       let month = calendar.component(.month, from: date)
       let monthString = self.months[month - 1 ]
       let day = calendar.component(.day, from: date)
       
       var dayString = String(day)
      
       let lastChar = dayString.last!

       if lastChar == "1" {
           dayString = dayString + "st"
           }
               else if lastChar == "2" {
                   dayString = dayString + "nd"
           }
               else if lastChar == "3" {
                   dayString = dayString + "rd"
           }
               else {
                   dayString = dayString + "th"
           }
           let year = calendar.component(.year, from: date)
           let currentDate = "\(monthString) \(dayString), \(year)"
           self.dateLabel.text = currentDate
       
       }
   
   func timerRun() {
       Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
           self.clockFunc()
       }.fire()
   }
    
    @IBAction func changeBackgroundColorBlueButton(_ sender: UIButton) {
        view.backgroundColor = .blue
    }
    
    @IBAction func chagneBackgroundColorOrangeButton(_ sender: UIButton) {
        view.backgroundColor = .orange
    }
    
    @IBAction func changeBackgroundColorGreenButton(_ sender: UIButton) {
        view.backgroundColor = .green
    }
    
    @IBAction func changeBackgroundColorWhiteButton(_ sender: UIButton) {
        view.backgroundColor = .white
    }
    
    @IBAction func changeBackgroundColorYellowButton(_ sender: UIButton) {
        view.backgroundColor = .yellow
    }
    
    @IBAction func changeBackgroundColorPurpleButton(_ sender: UIButton) {
        view.backgroundColor = .purple
    }

    
    
    
    var timerWatch:Timer = Timer()
    var count:Int = 0
    var timercounting:Bool = false
    
    
    @IBAction func startStopWatchButton(_ sender: UIButton) {
        timerWatch = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCoutner), userInfo: nil, repeats: true)
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
    return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    @objc func timerCoutner() -> Void
    {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        stopWatchLabel.text = timeString
        stopWatchLabel.text = timeString
    }
    
    
    
    @IBAction func clearStopWatchButton(_ sender: UIButton) {
        stopWatchLabel.text = "00 : 00 : 00"
        self.count = 0
        self.timer.invalidate()
        self.stopWatchLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
        
        
    }
    
    
    @IBAction func stopStopwatchButton(_ sender: UIButton) {
        if (timercounting == false) {
            timer.invalidate()
            
        }
    }
    
    @IBAction func changeTimeZoneSegmentedController(_ sender: UISegmentedControl) {
        switch changeTimeZoneSegmentedControl.selectedSegmentIndex {
            
        case 0:
            dateFormatter.timeZone = TimeZone(abbreviation: "EST")
            timeZoneLabel.text = "Eastern"
        case 1:
            dateFormatter.timeZone = TimeZone(abbreviation: "CST")
            timeZoneLabel.text = "Central"
        case 2:
            dateFormatter.timeZone = TimeZone(abbreviation: "PST")
            timeZoneLabel.text = "Pacific"
        case 3:
            dateFormatter.timeZone = TimeZone(abbreviation: "MST")
            timeZoneLabel.text = "Mountain"
        default:
            dateFormatter.timeZone = TimeZone(abbreviation: "CST")
            timeZoneLabel.text = "Central"
    }
    
    
    
    
    
        
}
   



}
