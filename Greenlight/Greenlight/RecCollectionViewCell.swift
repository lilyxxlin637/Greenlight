//
//  RecCollectionViewCell.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit


//latitude
//longtitude


//location overview


class RecCollectionViewCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func prepareForReuse() {
        let theSubviews: Array = self.contentView.subviews
        for view in theSubviews
        {
            view.removeFromSuperview()
        }
    }
    
    func setupView(_ recID: Int){
        print("id:\(recID)")
        let rec = allCrops[recID]
        print(rec)

        let productLabel = setBoldText(rec.name)
        productLabel.font = UIFont(name: "Poppins-Bold", size: 50)
        productLabel.textAlignment = .center
        self.layer.borderWidth = 5

        let reasonLabel = setBoldText(rec.reason)
        reasonLabel.font = UIFont(name: "Poppins-Bold", size: 20)

        reasonLabel.textAlignment = .center
        
        let recLabel = setBoldText("I want to plant")
        recLabel.font = UIFont(name: "Poppins-Bold", size: 20)
        let recImage = UIImageView()
        recImage.translatesAutoresizingMaskIntoConstraints = false
        if(rec.doRec){
            recImage.image = UIImage(named: "tick")
            self.layer.borderColor = UIBorderGreen.cgColor
        }else{
            recImage.image = UIImage(named: "cross")
            recImage.isHidden = true
            self.layer.borderColor = UIGrey.cgColor
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
