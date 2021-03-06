//
//  ViewController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import UIKit
import CoreLocation
import Alamofire


class nkpController: UIViewController, UITextFieldDelegate {
    var navBar: UIView!
    
    var phfield: UITextField!
    var pfield: UITextField!
    var nfield: UITextField!
    var kfield: UITextField!
    var tempField: UITextField!
    var humField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigation()
        setupText()
        setupButton()
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
        let tempLabel = setRegText("Temperature:")
        let humLabel = setRegText("Temperature:")
        let phlabel = setRegText("Land PH:")
        let nlabel = setRegText("Nitrogen:")
        let plabel = setRegText("Phosphorous:")
        let klabel = setRegText("Potassium:")
    
        tempField = setTextfield("C")
        humField = setTextfield("%")
        phfield = setTextfield("PH")
        nfield = setTextfield("N")
        pfield = setTextfield("P")
        kfield = setTextfield("K")
        
        let autoFill = UIButton()
        autoFill.setTitle("Autofill Sensor Data", for: .normal)
        autoFill.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 20)
        autoFill.contentHorizontalAlignment = .right
        autoFill.setTitleColor(.black, for: .normal)
        autoFill.addTarget(self, action: #selector(pressedAutoFill), for: .touchUpInside)
        autoFill.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        view.addSubview(autoFill)
        
        NSLayoutConstraint.activate([
            
            tempLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tempLabel.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 120),
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
            tempField.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 120),
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
            
            autoFill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            autoFill.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoFill.topAnchor.constraint(equalTo: kfield.bottomAnchor, constant: 20),
            autoFill.heightAnchor.constraint(equalToConstant: 28),
            
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
        let button = setGreenButton("Finish")
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 267),
            button.heightAnchor.constraint(equalToConstant: 51),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        
        ])
        
        button.addTarget(self, action: #selector(pressedFinished), for: .touchUpInside)
    }
    
    @objc private func pressedFinished(_ sender: Any){
        let vc = RecController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        print("\(GlobalTemp), \(GlobalHum), \(GlobalPH), \(GlobalP), \(GlobalN), \(GlobalK)")

        postAlarmo()

    }
    
    @objc private func pressedAutoFill(_ sender: Any){
        tempField.text = "24.3"
        humField.text = "22.0"
        phfield.text = "6.5"
        pfield.text = "42"
        nfield.text = "9.0"
        kfield.text = "43"
        
        GlobalTemp = 24.3
        GlobalHum = 22.0
        GlobalPH = 6.5
        GlobalP = 42
        GlobalN = 9.0
        GlobalK = 43
        print("\(GlobalTemp), \(GlobalHum), \(GlobalPH), \(GlobalP), \(GlobalN), \(GlobalK)")

    }
    

    @objc func doneButtonAction(){
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text ?? "No test"
        
        if(textField.placeholder == "C"){
            GlobalPH = Double(text) ?? 24.3
        }
        if(textField.placeholder == "%"){
            GlobalPH = Double(text) ?? 22.0
        }
        
        if(textField.placeholder == "PH"){
            GlobalPH = Double(text) ?? 6.5
        }
        if(textField.placeholder == "N"){
            GlobalN = Double(text) ?? 9.0
        }
        if(textField.placeholder == "P"){
            GlobalP = Double(text) ?? 42
        }
        if(textField.placeholder == "K"){
            GlobalK = Double(text) ?? 43
        }
    }
    
    
    func postAlarmo(){
        let parameters: [String: Any] = [
            "latitude": GlobalLatitude,
            "longitude": GlobalLongtitude,
            "temperature": GlobalTemp,
            "humidity": GlobalHum,
            "ph": GlobalPH,
            "nitrogen": GlobalN,
            "phosphorous": GlobalP,
            "potassium": GlobalK,
        ]
        
        let url = "http://cornell-greenlight-backend.azurewebsites.net/api/recommend-crop"
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate()
            .responseString { response in
                switch response.result {
                case .success:
                    debugPrint(response)
                    break
                case .failure(let error):
                    debugPrint(error)
                    
                }
            }
    }
    

}
