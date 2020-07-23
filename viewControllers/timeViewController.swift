//
//  timeViewController.swift
//  MapSearch
//
//  Created by Hubert Lachaîne on 2020-07-23.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import CoreLocation

class timeViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var submitButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "WHEN?"
        navigationController?.navigationBar.backgroundColor = UIColor.systemOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        
        Utilities.styleHollowButton(submitButton)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        var dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        var inputDate = dateFormatter.string(from: datePicker.date)
        print(inputDate)
        
        Global.MapTempInfo.timeStamps.append(inputDate)
        print(Global.MapTempInfo.timeStamps)
        print(Global.MapTempInfo.mapItems)
        print(Global.MapTempInfo.coordinates)
        let x = Global.MapTempInfo.timeStamps.firstIndex(of: "")
        if x == 0 {
            Global.MapTempInfo.timeStamps.removeFirst()
        }
    }
    
}
