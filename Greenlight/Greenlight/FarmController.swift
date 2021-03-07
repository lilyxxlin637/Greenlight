//
//  FarmController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit


class FarmController: UIViewController, UITextFieldDelegate{
    var navBar: UIView!
    var productId: Int!
    private var product: Recommendations!
    var fillButton: UIButton!
    var autoFillButton: UIButton!
    
    var phfield: UITextField!
    var pfield: UITextField!
    var nfield: UITextField!
    var kfield: UITextField!
    var tempField: UITextField!
    var humField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        product = allCrops[productId]
        setupNavigation()
        setupText()
        setupButton()
    }

    
    
    func setupNavigation(){
        navBar = UIView()
        navBar.backgroundColor = UIGreen
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let title = setBoldText("My \(product.name) farm")
        title.textColor = .black
        
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "left_arrow"), for: .normal)
        backButton.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        navBar.addSubview(title)
        navBar.addSubview(backButton)
        view.addSubview(navBar)
        
        NSLayoutConstraint.activate([
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 120),
            
            backButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20),
            backButton.centerYAnchor.constraint(equalTo: title.centerYAnchor, constant: 0),
            backButton.widthAnchor.constraint(equalToConstant: 9),
            backButton.heightAnchor.constraint(equalToConstant: 18),
            
            title.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 50),
            title.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -15),
        ])
    }
    
    @objc private func pressedBack(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupText(){
        let tempLabel = setRegText("Temperature:")
        let humLabel = setRegText("Temperature:")
        let phlabel = setRegText("Land PH:")
        let nlabel = setRegText("Nitrogen:")
        let plabel = setRegText("Phosphorous:")
        let klabel = setRegText("Potassium:")
    
        tempField = setTextfield("C")
        tempField.text = "\(Globaltemp_current)C"
        humField = setTextfield("%")
        humField.text = "\(Globalhumidity_yr_avg)%"
        phfield = setTextfield("PH")
        nfield = setTextfield("N")
        pfield = setTextfield("P")
        kfield = setTextfield("K")
        
        autoFillButton = UIButton()
        autoFillButton.setTitle("Adjust PH and Nitrogen!", for: .normal)
        autoFillButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 20)
        autoFillButton.contentHorizontalAlignment = .right
        autoFillButton.setTitleColor(UIRed, for: .normal)
//        autoFillButton.addTarget(self, action: #selector(pressedAutoFill), for: .touchUpInside)
        autoFillButton.translatesAutoresizingMaskIntoConstraints = false
        
        autoFillButton.isHidden = true
        
        view.addSubview(tempLabel)
        view.addSubview(humLabel)
        view.addSubview(phlabel)
        view.addSubview(nlabel)
        view.addSubview(plabel)
        view.addSubview(klabel)
        
        view.addSubview(tempField)
        view.addSubview(humField)
        view.addSubview(phfield)
        view.addSubview(nfield)
        view.addSubview(pfield)
        view.addSubview(kfield)
        
        view.addSubview(autoFillButton)
        
        NSLayoutConstraint.activate([
            
            tempLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tempLabel.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 130),
            tempLabel.widthAnchor.constraint(equalToConstant: 180),
            tempLabel.heightAnchor.constraint(equalToConstant: 27),
            
            humLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            humLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5),
            humLabel.widthAnchor.constraint(equalToConstant: 180),
            humLabel.heightAnchor.constraint(equalToConstant: 27),
            
            phlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            phlabel.topAnchor.constraint(equalTo: humLabel.bottomAnchor, constant: 5),
            phlabel.widthAnchor.constraint(equalToConstant: 180),
            phlabel.heightAnchor.constraint(equalToConstant: 27),
            
            nlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nlabel.topAnchor.constraint(equalTo: phlabel.bottomAnchor, constant: 5),
            nlabel.widthAnchor.constraint(equalToConstant: 180),
            nlabel.heightAnchor.constraint(equalToConstant: 27),
            
            plabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            plabel.topAnchor.constraint(equalTo: nlabel.bottomAnchor, constant: 5),
            plabel.widthAnchor.constraint(equalToConstant: 180),
            plabel.heightAnchor.constraint(equalToConstant: 27),
            
            klabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            klabel.topAnchor.constraint(equalTo: plabel.bottomAnchor, constant: 5),
            klabel.widthAnchor.constraint(equalToConstant: 180),
            klabel.heightAnchor.constraint(equalToConstant: 27),
            
            
            
            tempField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            tempField.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 130),
            tempField.widthAnchor.constraint(equalToConstant: 100),
            tempField.heightAnchor.constraint(equalToConstant: 27),
            
            humField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            humField.topAnchor.constraint(equalTo: tempField.bottomAnchor, constant: 5),
            humField.widthAnchor.constraint(equalToConstant: 100),
            humField.heightAnchor.constraint(equalToConstant: 27),
            
            phfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            phfield.topAnchor.constraint(equalTo: humField.bottomAnchor, constant: 5),
            phfield.widthAnchor.constraint(equalToConstant: 100),
            phfield.heightAnchor.constraint(equalToConstant: 27),
            
            nfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nfield.topAnchor.constraint(equalTo: phfield.bottomAnchor, constant: 5),
            nfield.widthAnchor.constraint(equalToConstant: 100),
            nfield.heightAnchor.constraint(equalToConstant: 27),
            
            pfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            pfield.topAnchor.constraint(equalTo: nfield.bottomAnchor, constant: 5),
            pfield.widthAnchor.constraint(equalToConstant: 100),
            pfield.heightAnchor.constraint(equalToConstant: 27),
            
            kfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            kfield.topAnchor.constraint(equalTo: pfield.bottomAnchor, constant: 5),
            kfield.widthAnchor.constraint(equalToConstant: 100),
            kfield.heightAnchor.constraint(equalToConstant: 27),
            
            autoFillButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            autoFillButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoFillButton.topAnchor.constraint(equalTo: kfield.bottomAnchor, constant: 20),
            autoFillButton.heightAnchor.constraint(equalToConstant: 28),
            
        ])
        
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        tempField.inputAccessoryView = doneToolbar
        humField.inputAccessoryView = doneToolbar
        phfield.inputAccessoryView = doneToolbar
        pfield.inputAccessoryView = doneToolbar
        nfield.inputAccessoryView = doneToolbar
        kfield.inputAccessoryView = doneToolbar

    }
    
    func setupButton(){
        fillButton = setGreenButton("Autofill Sensor Data")
        fillButton.setTitleColor(.black, for: .normal)
        fillButton.addTarget(self, action: #selector(pressedAutoFill), for: .touchUpInside)
        fillButton.backgroundColor = UIGreen
        
        view.addSubview(fillButton)
        
        NSLayoutConstraint.activate([
            fillButton.widthAnchor.constraint(equalToConstant: 267),
            fillButton.heightAnchor.constraint(equalToConstant: 51),
            fillButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fillButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),

        ])
        
    }
    
    @objc func doneButtonAction(){
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .black
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //check for range
        textField.textColor = UIRed
    }

    
    
    @objc private func pressedAutoFill(_ sender: Any){
        phfield.text = "7.5"
        pfield.text = "133.2"
        nfield.text = "40.97"
        kfield.text = "198.2"
        
//
//        GlobalPH = 6.5
//        GlobalP = 42
//        GlobalN = 9.0
//        GlobalK = 43
//        print("\(GlobalTemp), \(GlobalHum), \(GlobalPH), \(GlobalP), \(GlobalN), \(GlobalK)")
        
        autoFillButton.isHidden = false

    }
}
