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
    
    //This is the view controller file for the HotSpot map which highlights with pins various locations that were visited by covid19 patient
    
    private enum AnnotationReuseID: String {
        case pin
    }
    
    @IBOutlet weak var Map: MKMapView!
    
    @IBOutlet weak var recenterButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var locationManager: CLLocationManager!
    var userRegion: CLLocation!
    let db = Firestore.firestore()
    var userlocation: CLLocationCoordinate2D!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //SETUP FOR BUTTONS
        Utilities.stylePremiumButton(recenterButton)
        
        
        //Setup for annotations on the map
        Map.delegate = self
        
        Map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: AnnotationReuseID.pin.rawValue)
        Map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        print("date")
        let t = selectedDate.split(separator: "/")
        let reunified = t[0] + "-" + t[1] + "-" + t[2]
        print(reunified)
        FirebaseInfoQuery(date: reunified)
        
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
        //Function to get the user's position

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
        //Function that listen to changes on the datepicker in order to update the map accordingly
        
        var dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        
        var selectedDate = dateFormatlet.string(from: datePicker.date)
        print(selectedDate)
        print("date")
        let t = selletedDate.split(separator: "/")
        let reunified = t[0] + "-" + t[1] + "-" + t[2]
        print(reunified)
        FirebaseInfoQuery(date: reunified)
        
    }
    func markerUpdate(places: [String]?){
        //Function that updates all the annotations on the map in order to show the selected date confirmed locations
        Map.removeAnnotations(Map.annotations)
        guard (places != nil) else {
            return
        }
        
        for elem in places! {
            print(elem)
            let part = elem.split(separator: "*")
            
            var lat = part[0].replacingOccurrences(of: ",", with: ".")
            var lon = part[1].replacingOccurrences(of: ",", with: ".")
            print(lat)
            print(lon)
            print(part[2])
            lat = lat.trimmingCharacters(in: .whitespacesAndNewlines)
            lon = lon.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let Latitude = Double(lat)
            let Longitude = Double(lon)

            let annotation = MKPointAnnotation()
            annotation.title = String(part[2])
            annotation.coordinate = CLLocationCoordinate2D(latitude: Latitude!, longitude: Longitude!)
            print(Latitude)
            print(Longitude)
            print(part[2])
            
            Map.addAnnotation(annotation)
            
        }
    }
    func FirebaseInfoQuery(date: String){
        //Function used to request the data from the cloud database and display it onto the map for the user
        let docRef = db.collection("HotSpots").document("byDates")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dateLocations = document.data()
                
                let dates = dateLocations![date] as? [String]
                self.markerUpdate(places: dates)
            } else {
                print("Document does not exist")
            }
        }
    }
}

extension mapViewController: MKMapViewDelegate {
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("Failed to load the map: \(error)")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? PlaceAnnotation else { return nil }
        
        // Annotation views should be dequeued from a reuse queue to be efficent.
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: AnnotationReuseID.pin.rawValue, for: annotation) as? MKMarkerAnnotationView
        view?.canShowCallout = true
        view?.clusteringIdentifier = "Confirmed Cases"
        
        // If the annotation has a URL, add an extra Info button to the annotation so users can open the URL.
        if annotation.url != nil {
            let infoButton = UIButton(type: .detailDisclosure)
            view?.rightCalloutAccessoryView = infoButton
        }
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? PlaceAnnotation else { return }
        if let url = annotation.url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

