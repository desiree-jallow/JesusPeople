//
//  ContactViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI

class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let churchLocation = CLLocationCoordinate2D(latitude: Constants.churchLat, longitude: Constants.churchLong)
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        showDirections()
    }
    
    
    func showDirections() {
        //if phone has an google maps app
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            
            
            if let url = URL(string: "comgooglemaps://?saddr=&daddr=Jesus+People+Chapel+Int'l&directionsmode=driving") {
                
                UIApplication.shared.open(url, options: [:])
            }
            
        }
        else {
            // open with apple maps
            let coordinate = CLLocationCoordinate2DMake(Constants.churchLat,Constants.churchLong)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = Constants.churchName
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
            
        }
        
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@jpcinternational.org"])
            
            present(mail, animated: true)
        } else {
            //show a real failure alert
            print("message failed to send")
        }
            }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func websiteButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "http://www.jpcinternational.org/"), UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let socialVC = segue.destination as! SocialViewController
        if segue.identifier == Constants.facebookSegue {
            
            socialVC.url = "https://www.facebook.com/JesusPeopleChapel"
        } else if segue.identifier == Constants.instagramSegue {
            socialVC.url = "https://www.instagram.com/jesus_people_chapel/"
        }
    }
}
