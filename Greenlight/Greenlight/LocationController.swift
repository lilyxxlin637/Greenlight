//
//  ViewController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import UIKit
import CoreLocation



class LocationController: UIViewController, CLLocationManagerDelegate {
    var  locationManager = CLLocationManager()
    var navBar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        setupNavigation()
        setupText()
        setupButton()
    }
    
    func enableLocationManager() {
        locationManager.startUpdatingLocation()
    }
    
    func disableLocationManager() {
        locationManager.stopUpdatingLocation()
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
        let label = setRegText("Start looking for crop recommendations. \nEnable locations trackers to allow for weather and group analysis!")
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
    
    @objc private func pressedEnable(_ sender: Any){
        let vc = RecController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    



}

