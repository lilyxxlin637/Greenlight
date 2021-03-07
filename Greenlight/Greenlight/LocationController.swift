//
//  ViewController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import UIKit
import CoreLocation
import Alamofire


class LocationController: UIViewController, CLLocationManagerDelegate {
    var  locationManager = CLLocationManager()
    var navBar: UIView!
    var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        setupNavigation()
        setupText()
        setupButton()
        setupNextButton()
    }
    
    func enableLocationManager() {
        locationManager.startUpdatingLocation()
    }
    
    func disableLocationManager() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        GlobalLatitude = locations[0].coordinate.latitude
        GlobalLongtitude = locations[0].coordinate.longitude
        
        if(GlobalLongtitude != 0){
            print("stopped location")
            print("lltitude: \(GlobalLongtitude), \(GlobalLatitude)")
            locationManager.stopUpdatingLocation()
            postAlarmo()
        }
    }
    
    func setupNavigation(){
        navBar = UIView()
        navBar.backgroundColor = UIGreen
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let title = setBoldText("Setup")
        
        navBar.addSubview(title)
        view.addSubview(navBar)
        
        NSLayoutConstraint.activate([
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 120),
            
            title.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 50),
            title.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -15)
        
        ])
    }
    
    func setupText(){
        let label = setRegText("Start looking for crop recommendations. \nEnable locations trackers to allow for weather and ground analysis!")
        label.textAlignment = .center
        
        let image = UIImageView()
        image.image = UIImage(named: "light")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 264),
            label.heightAnchor.constraint(equalToConstant: 150),
            
            image.topAnchor.constraint(equalTo: label.bottomAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 274),
            image.heightAnchor.constraint(equalToConstant: 311)
            
        ])
    }
    
    func setupButton(){
        let button = setGreenButton("Enable")
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 267),
            button.heightAnchor.constraint(equalToConstant: 51),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
        button.addTarget(self, action: #selector(pressedEnable), for: .touchUpInside)
    }
    
    @objc private func pressedEnable(_ sender: UIButton){
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                locationManager.requestAlwaysAuthorization()
                locationManager.startUpdatingLocation()
                nextButton.isHidden = false
                sender.isHidden = true
             default:
                let vc = RecController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                }
        } else {
            print("Location services are not enabled")
        }
    }
    
    func setupNextButton(){
        nextButton = setGreenButton("Continue")
        nextButton.isHidden = true
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 267),
            nextButton.heightAnchor.constraint(equalToConstant: 51),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        
        ])
        
        nextButton.addTarget(self, action: #selector(pressedEnable), for: .touchUpInside)
    }
    
    @objc private func pressedNext(_ sender: Any){
        let vc = RecController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

    



}


//let parameters: [String: AnyObject] = [
//    "IdQuiz" : 102,
//    "IdUser" : "iosclient",
//    "User" : "iosclient",
//    "List": [
//        [
//            "IdQuestion" : 5,
//            "IdProposition": 2,
//            "Time" : 32
//        ],
//        [
//            "IdQuestion" : 4,
//            "IdProposition": 3,
//            "Time" : 9
//        ]
//    ]
//]
//
//Alamofire.request(.POST, "http://myserver.com", parameters: parameters, encoding: .JSON)
//    .responseJSON { request, response, JSON, error in
//        print(response)
//        print(JSON)
//        print(error)
//    }
