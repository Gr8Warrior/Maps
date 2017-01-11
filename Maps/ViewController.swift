//
//  ViewController.swift
//  Maps
//
//  Created by Shailendra Suriyal on 11/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController ,MKMapViewDelegate{

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        annotation.title = "Qutab Minar"
        annotation.subtitle = "Visited tons of times. . ."
        map.addAnnotation(annotation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

