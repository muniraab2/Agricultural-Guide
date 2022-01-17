//
//  MapVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 10/05/1443 AH.
//

import UIKit
import MapKit
import CoreLocation

// used UIViewController for map View

class MapVC: UIViewController , CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManger = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //localized for title in Arabic
        
        self.title = "Saudi Green Initiative".localized
        self.hideKeyboardWhenTappedAround()
    }
    
    //override func to desiredAccuracy and delegate and athorization and start updating for location
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
    }
    
    //func for did updated location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        print("location")
        if let location = locations.first {
            locationManger.startUpdatingLocation()
            
            render(location)
        }
    }
    
    //func reder location in latitude and logited
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        // for user to pin location in any place
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
    }
    
    // IBAction to recived and show alert
    
    @IBAction func alertReceived(_ sender: Any) {
        
        let alert = UIAlertController(title: "Your Message Submit , Thanks".localized, message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK".localized, style: .cancel))
        present(alert, animated: true)
        
    }
    
    
}
