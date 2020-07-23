//
//  mapViewController.swift
//  CSTracing
//
//  Created by Hubert Lachaîne on 2020-07-20.
//  Copyright © 2020 Hubert Lachaîne. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class mapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var Map: MKMapView!
    
    @IBOutlet weak var recenterButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var locationManager: CLLocationManager!
    var userRegion: CLLocation!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {

        let location = locations.last! as CLLocation
        userRegion = location
        manager.stopUpdatingLocation()

        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))

        self.Map.setRegion(region, animated: true)
    }
    

    @IBAction func recenterPressed(_ sender: Any) {
        let center = CLLocationCoordinate2D(latitude: userRegion.coordinate.latitude, longitude: userRegion.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))

        self.Map.setRegion(region, animated: true)
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        let db = Firestore.firestore()
        let docRef = db.collection("HotSpots").document("byDates")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dateLocations = document.data()
                print(dateLocations!)
                //userinfo = dateLocations
                //Constants.UserInfo.tier = userInfo!["tier"] as! String
                
            } else {
                print("Document does not exist")
            }
        }
        
//        var location = CLLocationCoordinate2DMake(<#T##latitude: CLLocationDegrees##CLLocationDegrees#>, <#T##longitude: CLLocationDegrees##CLLocationDegrees#>)
//
//        var annotation = MKPointAnnotation()
//        annotation.coordinate.latitude = location.latitude
//        annotation.coordinate.longitude = location.longitude
//        annotation.title = "Confirmed Case"
//        annotation.subtitle = "time"
        
    }
}

