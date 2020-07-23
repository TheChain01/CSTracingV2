//
//  reportViewController.swift
//  CSTracing
//
//  Created by Hubert Lachaîne on 2020-07-23.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class reportViewController: UITableViewController {
    
    @IBOutlet weak var submitButt: UIBarButtonItem!
    
    
    let cellId = "cellId"
    let InputCell = "InputCell"
    
    var dateTime: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Tracing Submission"
        navigationController?.navigationBar.backgroundColor = UIColor.systemOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 3 {
            
            let button = UIButton(type: .system)
            button.setTitle("Significant Locations                                + ADD", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            
            button.addTarget(self, action: #selector(addNewLocations), for: .touchUpInside)
            
            return button
        } else {
        let label = UILabel()
        label.backgroundColor = UIColor.systemBlue
        
        switch section {
        case 0:
            label.text = "NAME"
        case 1:
            label.text = "PHONE NUMBER"
        case 2:
            label.text = "HOME ADDRESS"
        default:
            label.text = "HEADER"
        }
            return label
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3: return Global.MapTempInfo.mapItems.count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell") as! TextInputTableViewCell
            cell.configure(text: "", placeholder: "name")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell") as! TextInputTableViewCell
            cell.configure(text: "", placeholder: "phone number")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell") as! TextInputTableViewCell
            cell.configure(text: "", placeholder: "home address")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId" , for: indexPath)
            print(Global.MapTempInfo.mapItems)
            let name = Global.MapTempInfo.mapItems[indexPath.row]
            cell.textLabel?.text = name
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            
            let name = Global.MapTempInfo.mapItems[indexPath.row]
            
            cell.textLabel?.text = name
            
            cell.textLabel?.text = "\(name)" + (self.dateTime?[indexPath.row])!
            return cell
        }
    }
    
    @IBAction func subPressed(_ sender: Any) {
    let db = Firestore.firestore()
    var i = 0
        
    for time in Global.MapTempInfo.timeStamps {
        let sep = time.split(separator: ",")
        
        guard (sep.isEmpty != true) else {
            let homeViewController =
                storyboard?.instantiateViewController(identifier: "HomeScreen") as? ViewController
            
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()
            return
        }
        
        let t = sep[0].split(separator: "/")
        let reunified = t[0] + "-" + t[1] + "-" + t[2]
        let e = Global.MapTempInfo.coordinates[i].replacingOccurrences(of: ",", with: " * ")
        let encoded = String(e.replacingOccurrences(of: ".", with: ",")) + " *" + sep[1]
        
        db.collection("HotSpots").document("byDates").updateData([reunified: FieldValue.arrayUnion([encoded])])
        print(encoded)
        i+=1
        
    }
        Global.MapTempInfo.coordinates = [""]
        Global.MapTempInfo.mapItems = [""]
        Global.MapTempInfo.timeStamps = [""]
        let homeViewController =
            storyboard?.instantiateViewController(identifier: "HomeScreen") as? ViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        Global.MapTempInfo.mapItems.removeAll()
        Global.MapTempInfo.coordinates.removeAll()
    }
    
    @objc func addNewLocations (){
        print("new Location!")
        performSegue(withIdentifier: "addNew", sender: nil)
    }
    
    @IBAction func unwindToReportPage(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
    }
    
}

