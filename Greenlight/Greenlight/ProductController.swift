//
//  ProductController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit

class ProductController: UIViewController{
    var navBar: UIView!
    var productId: Int!
    private var product: Recommendations!
    var plantButton: UIButton!
    var removeButton: UIButton!
    var plant: UIImageView!
    var question: UIImageView!
    var delegate: UpdateProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    func setupFullView(){
        product = allCrops[productId]
        setupNavigation()
        setupText()
        setupButton()
        setupView()
    }
    
    private func setupView(){
        if (allCrops[productId].doRec){
            plantButton.isHidden = true
            removeButton.isHidden = false
            plant.isHidden = false
            question.isHidden = true
            navBar.backgroundColor = UIBorderGreen
        }else{
            plantButton.isHidden = false
            removeButton.isHidden = true
            plant.isHidden = true
            question.isHidden = false
            navBar.backgroundColor = UIBorderGreen
        }
        self.delegate?.updateFarmLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupView()
    }
    
    
    func setupNavigation(){
        navBar = UIView()
        navBar.backgroundColor = UIBorderGreen
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let title = setBoldText(product.name)
        title.textColor = .white
        
        navBar.addSubview(title)
        view.addSubview(navBar)
        
        NSLayoutConstraint.activate([
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 90),
            
            title.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 50),
            title.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -15),
        ])
    }
    
    func setupText(){
        let label = setRegText("Temperature: \nHumidity: \nLand PH: \nNitrogen: \nPhosphorous: \nPotassium:")
        label.textAlignment = .left
        
        let content = setRegText("\(product.temp)C\n\(product.humidity)%\n\(product.ph)\n\(product.nitrogen)\n\(product.phosphorous)\n\(product.potassium)")
        content.textAlignment = .right
        
        let image = UIImageView()
        image.image = UIImage(named: "ground")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        plant = UIImageView()
        plant.image = UIImage(named: "crop")
        plant.translatesAutoresizingMaskIntoConstraints = false
        question = UIImageView()
        question.image = UIImage(named: "question")
        question.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(content)
        view.addSubview(image)
        view.addSubview(plant)
        view.addSubview(question)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            label.widthAnchor.constraint(equalToConstant: 175),
            label.heightAnchor.constraint(equalToConstant: 184),
            
            content.topAnchor.constraint(equalTo: label.topAnchor),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            content.widthAnchor.constraint(equalToConstant: 100),
            content.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            plant.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            plant.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plant.widthAnchor.constraint(equalToConstant: 228),
            plant.heightAnchor.constraint(equalToConstant: 205),
            
            question.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            question.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            question.widthAnchor.constraint(equalToConstant: 228),
            question.heightAnchor.constraint(equalToConstant: 205),
            
            image.topAnchor.constraint(equalTo: plant.bottomAnchor, constant: 0),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 194),
            image.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func setupButton(){
        plantButton = setGreenButton("Plant this crop!")
        plantButton.setTitleColor(.white, for: .normal)
        removeButton = setGreenButton("Remove this crop")
        removeButton.setTitleColor(.white, for: .normal)

        plantButton.backgroundColor = UIBorderGreen
        removeButton.backgroundColor = UIBorderGreen

        
        view.addSubview(removeButton)
        view.addSubview(plantButton)
        
        NSLayoutConstraint.activate([
            plantButton.widthAnchor.constraint(equalToConstant: 267),
            plantButton.heightAnchor.constraint(equalToConstant: 51),
            plantButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plantButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
            removeButton.widthAnchor.constraint(equalToConstant: 267),
            removeButton.heightAnchor.constraint(equalToConstant: 51),
            removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        
        ])
        
        plantButton.addTarget(self, action: #selector(pressedPlant), for: .touchUpInside)
        
        removeButton.addTarget(self, action: #selector(pressedRemove), for: .touchUpInside)
    }
    
    @objc private func pressedPlant(_ sender: Any){
        allCrops[productId].doRec = true
        setupView()
        delegate?.updateFarmLabel()
    }
    
    @objc private func pressedRemove(_ sender: Any){
        allCrops[productId].doRec = false
        setupView()
        delegate?.updateFarmLabel()
    }
    
}
