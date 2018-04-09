//
//  ViewController.swift
//  Maps
//
//  Created by Shailendra Suriyal on 11/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation
class ViewController: UIViewController ,MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let latitude : CLLocationDegrees = 28.5244
        let longitude : CLLocationDegrees = 77.1855
        
        //Zoom in level of the map
        let latDelta : CLLocationDegrees = 0.05
        let lonDelta : CLLocationDegrees = 0.05
        
        //span combination of lat delta and lon delta
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //region = combinaton of location and span
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation :MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Qutab Minar(New Delhi)"
        annotation.subtitle = "Just to remind, Visited tons of times. . ."
        map.addAnnotation(annotation)
        
        let uiLPGR = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecogmizer:)));
        uiLPGR.minimumPressDuration = 1
        map.addGestureRecognizer(uiLPGR)
        
        
    }
    func longPress(gestureRecogmizer : UILongPressGestureRecognizer ) {
        
        let touchPoint = gestureRecogmizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: map)
        let userAnnotation : MKPointAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = coordinate
        userAnnotation.title = "Added Place "
        userAnnotation.subtitle = "\(coordinate.latitude), \(coordinate.longitude)"
        map.addAnnotation(userAnnotation)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let userLocation : CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let userAnnotation : MKPointAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = coordinate
        userAnnotation.title = "My Place "
        userAnnotation.subtitle = "\(coordinate.latitude), \(coordinate.longitude)"
        map.addAnnotation(userAnnotation)
        
        map.userTrackingMode = MKUserTrackingMode.follow

    }
    
}

