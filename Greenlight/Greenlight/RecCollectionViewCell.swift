//
//  RecCollectionViewCell.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit


struct Recommendations: Equatable{
    var name: String
    var doRec: Bool
    var reason: String
    var temp: String = "20.9"
    var humidity: String = "82.00"
    var ph: String = "6.50"
    var nitrogen: String = "90"
    var phosphorous: String = "42"
    var potassium: String = "43"
    
    init(_ productName: String, rec: Bool){
        name = productName
        doRec = rec
        reason = "Best Crop"
    }
    
    static func ==(lhs: Recommendations, rhs: Recommendations) -> Bool {
        return lhs.name == rhs.name
    }
}


class RecCollectionViewCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupView(_ rec: Recommendations){
        let productLabel = setBoldText(rec.name)
        productLabel.font = UIFont(name: "Poppins-Bold", size: 50)
        productLabel.textAlignment = .center
        self.layer.borderWidth = 5

        let reasonLabel = setBoldText(rec.reason)
        reasonLabel.font = UIFont(name: "Poppins-Bold", size: 20)

        reasonLabel.textAlignment = .center
        
        let recLabel = setBoldText("We Recommend")
        recLabel.font = UIFont(name: "Poppins-Bold", size: 20)
        let recImage = UIImageView()
        recImage.translatesAutoresizingMaskIntoConstraints = false
        if(rec.doRec){
            recImage.image = UIImage(named: "tick")
            self.layer.borderColor = UIBorderGreen.cgColor
        }else{
            recImage.image = UIImage(named: "cross")
            recLabel.text = "Do Not Recommend"
            self.layer.borderColor = UIRed.cgColor
        }
        
        contentView.addSubview(productLabel)
        contentView.addSubview(reasonLabel)
        contentView.addSubview(recLabel)
        contentView.addSubview(recImage)
        
        NSLayoutConstraint.activate([
            recLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            recLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            productLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            productLabel.heightAnchor.constraint(equalToConstant: 50),
            productLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 115),
            
            reasonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            reasonLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            reasonLabel.heightAnchor.constraint(equalToConstant: 50),
            reasonLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 0),
            
            recImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            recImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            recImage.widthAnchor.constraint(equalToConstant: 140),
            recImage.heightAnchor.constraint(equalToConstant: 168)
        ])
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
