//
//  ContactViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit
import MapKit
import CoreLocation

class ContactViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let churchLocation = CLLocationCoordinate2D(latitude: Constants.churchLat, longitude: Constants.churchLong)
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //link to apple maps for address
        
        //open phone
        
        //open email
        //coordinates 29.64248322842516, -95.55533326012839
        
        let region = MKCoordinateRegion(center: churchLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        annotation.coordinate = churchLocation
        annotation.title = Constants.churchName
        mapView.addAnnotation(annotation)
        mapView.setCenter(churchLocation, animated: true)
        
        
    }
    
    @IBAction func callButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "tel://\(Constants.churchPhone)"), UIApplication.shared.canOpenURL(url) {
             
                UIApplication.shared.open(url)
            }
    }
    
    @IBAction func directionsButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func websiteButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func instagramButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
    }
}
