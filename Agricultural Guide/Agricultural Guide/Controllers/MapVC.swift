//
//  MapVC.swift
//  Agricultural Guide
//
//  Created by Munira abdullah on 10/05/1443 AH.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController , CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManger = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManger.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
    }
    
    @IBAction func alertReceived(_ sender: Any) {
        
        let alert = UIAlertController(title: "Your Message Received , Thanks", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
        
    }
    
    
}
