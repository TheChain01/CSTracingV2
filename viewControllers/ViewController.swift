//
//  ViewController.swift
//  CSTracing
//
//  Created by Hubert Lachaîne on 2020-07-20.
//  Copyright © 2020 Hubert Lachaîne. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var reportButton: UIButton!
    
    @IBOutlet weak var mapButton: UIButton!
    
    @IBOutlet weak var TitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Utilities.stylePremium(TitleLabel)
        Utilities.styleHollowButton(mapButton)
        Utilities.styleHollowButton(reportButton)
    }
    

    
    @IBAction func unwindToHomePage(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
    }
}
