//
//  MapViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var getAddress:String?

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func searchCoordinate(location:String) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = location
        request.region = mapView.region
        
        let locationSearch = MKLocalSearch(request: request)
        locationSearch.start { (result, error) in
            if error != nil {
                return
            } else  {
                for i in result!.mapItems {
                    self.inputMarker(coordinate: CLLocationCoordinate2D(latitude: i.placemark.coordinate.latitude, longitude: i.placemark.coordinate.longitude))
                }
            }
        }
        
    }
    
    func  inputMarker(coordinate:CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 30000, 30000)
        mapView.addAnnotation(annotation)
    }
}
