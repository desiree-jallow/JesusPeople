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
    
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var directionImageView: UIImageView!
    @IBOutlet weak var websiteImageView: UIImageView!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var instaImageView: UIImageView!
    @IBOutlet weak var facebookImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let region = MKCoordinateRegion(center: churchLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        annotation.coordinate = churchLocation
        annotation.title = Constants.churchName
        mapView.addAnnotation(annotation)
        mapView.setCenter(churchLocation, animated: true)
        
        phoneImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(sendCall)))
        directionImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDirections)))
        websiteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(openWebsite)))
        instaImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showInstagram)))
        facebookImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showFacebook)))
        emailImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:    #selector(sendEmail)))
        
    }
    
    @IBAction func callButtonPressed(_ sender: UIButton) {
        sendCall()
    }
    
    @IBAction func directionsButtonPressed(_ sender: UIButton) {
        showDirections()
    }
    
   
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        sendEmail()
            }
    
    
    @IBAction func websiteButtonPressed(_ sender: UIButton) {
        openWebsite()
    }
    
    
    @objc func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@jpcinternational.org"])
            
            present(mail, animated: true)
        } else {
            //show a real failure alert
            let alert = UIAlertController(title: "", message: "This device can not send emails", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @objc func sendCall() {
        if let url = URL(string: "tel://\(Constants.churchPhone)"), UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url)
        }
    }
    
    @objc func showDirections() {
        //if phone has a google maps app
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
    
    @objc func openWebsite() {
        if let url = URL(string: "http://www.jpcinternational.org/"), UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url)
        }
    }
    
    @objc func showFacebook() {
            performSegue(withIdentifier: Constants.facebookSegue, sender: self)
    }
    
    @objc func showInstagram() {
        performSegue(withIdentifier: Constants.instagramSegue, sender: self)
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
