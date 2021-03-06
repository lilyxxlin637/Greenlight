//
//  PublicVars.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit

var SelectedCrop = [Recommendations]()
var GlobalTemp = 0.0
var GlobalHum = 0.0
var GlobalLatitude = 0.0
var GlobalLongtitude = 0.0
var GlobalPH = 0.0
var GlobalN = 0.0
var GlobalP = 0.0
var GlobalK = 0.0

let UIGreen = UIColor(red: 0.907, green: 0.958, blue: 0.843, alpha: 1)
let UIBorderGreen = UIColor(red: 0.475, green: 0.788, blue: 0.71, alpha: 1)
let UIRed = UIColor(red: 0.82, green: 0.443, blue: 0.431, alpha: 1)

let UIRefFont = UIFont(name: "Poppins-Regular", size: 20)
let UISemiFont = UIFont(name: "Poppins-SemiBold", size: 30)
let UIMedFont = UIFont(name: "Poppins-Medium", size: 20)

func setBoldText(_ text: String) -> UILabel{
    let title = UILabel()
    title.text = text
    title.font = UISemiFont
    title.translatesAutoresizingMaskIntoConstraints = false
    title.numberOfLines = 0
    return title
}

func setRegText(_ text: String) -> UILabel{
    let title = UILabel()
    title.text = text
    title.font = UIRefFont
    title.translatesAutoresizingMaskIntoConstraints = false
    title.numberOfLines = 0
    return title
}

func setGreenButton(_ title: String) -> UIButton{
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIGreen
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIMedFont
    return button
}

func setTextfield(_ placeholder: String) -> UITextField{
    let field = UITextField()
    field.translatesAutoresizingMaskIntoConstraints = false
    field.placeholder = placeholder
    field.textAlignment = .right
    field.font = UIRefFont
    field.keyboardType = .decimalPad
    return field
}



