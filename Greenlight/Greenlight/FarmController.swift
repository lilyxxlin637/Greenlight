//
//  FarmController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit


class FarmController: UIViewController{
    var navBar: UIView!
    var product: Recommendations!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigation()
    }

    
    
    func setupNavigation(){
        navBar = UIView()
        navBar.backgroundColor = UIGreen
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let title = setBoldText("My \(product.name) Farm")
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
    
}
