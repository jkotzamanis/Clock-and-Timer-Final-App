//
//  ViewController.swift
//  Clock and Organization App
//
//  Created by Jacob Kotzamanis (Student) on 10/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundColorLabel: UILabel!
    
    @IBOutlet weak var addCalenderEntryButtion: UIButton!
    
    @IBOutlet weak var addCalenderEntryLabel: UILabel!
    
    @IBOutlet weak var changeBackgroundButton: UIButton!
    
    @IBOutlet weak var changeBackgroundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        backgroundColorLabel.layer.cornerRadius = 20
        addCalenderEntryButtion.layer.cornerRadius = 50
        addCalenderEntryLabel.layer.cornerRadius = 15
        changeBackgroundButton.layer.cornerRadius = 50
        changeBackgroundLabel.layer.cornerRadius = 15
        
        
    }
}


