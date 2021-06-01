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
    let churchLocation = CLLocationCoordinate2D(latitude: 29.64248322842516, longitude: -95.55533326012839)
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
        annotation.title = "Jesus People Chapel International"
        mapView.addAnnotation(annotation)
        mapView.setCenter(churchLocation, animated: true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
