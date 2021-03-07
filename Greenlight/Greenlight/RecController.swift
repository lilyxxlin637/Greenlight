//
//  RecController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit

protocol UpdateProtocol{
    func updateFarmLabel()
}


var allCrops:[Recommendations] = [Recommendations("Corn",rec:false), Recommendations("Grape",rec:false), Recommendations("Apple", rec:false)]

class RecController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UpdateProtocol{
    
    func updateFarmLabel() {
        recCollectionView.reloadData()
    }
    
    

    private var recCollectionView: UICollectionView!
    
    private var navBar: UIView!
    private var farmButton: UIButton!
    private var visibleProduct: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupCollectionView()
        visibleProduct = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recCollectionView.reloadData()
    }
    
    func setupNavigation(){
        navBar = UIView()
        navBar.backgroundColor = UIGreen
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let title = setBoldText("Land Overview")
        
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
    
    private func setupCollectionView(){
        farmButton = UIButton()
        farmButton.setTitle("Check My Farm", for: .normal)
        farmButton.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 20)
        farmButton.contentHorizontalAlignment = .right
        farmButton.setTitleColor(.black, for: .normal)
        farmButton.isHidden = true
        farmButton.translatesAutoresizingMaskIntoConstraints = false
        farmButton.addTarget(self, action: #selector(pressedFarm), for: .touchUpInside)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width - 40, height: 400)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        self.recCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        recCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recCollectionView.backgroundColor = .white
        recCollectionView.register(RecCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        recCollectionView.isPagingEnabled = true
        recCollectionView.showsHorizontalScrollIndicator = false
        
        
        recCollectionView.dataSource = self
        recCollectionView.delegate = self
        
        view.addSubview(farmButton)
        view.addSubview(recCollectionView)
        
        NSLayoutConstraint.activate([
            farmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            farmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            farmButton.bottomAnchor.constraint(equalTo: recCollectionView.topAnchor, constant: -8),
            farmButton.heightAnchor.constraint(equalToConstant: 28),
            
            recCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recCollectionView.heightAnchor.constraint(equalToConstant: 400),
            recCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
      
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allCrops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecCollectionViewCell
        cell.setupView(indexPath.item)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductController()
        vc.productId = indexPath.item
        vc.setupFullView()
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        visibleProduct = indexPath.row
//        print("visible product: \(visibleProduct)")
//        if allCrops[visibleProduct].doRec{
//            print("in \(indexPath)")
//            farmButton.setTitle("Check My \(allCrops[visibleProduct].name) Farm", for: .normal)
//            farmButton.isHidden = false
//        }else{
//            farmButton.isHidden = true
//        }
//    }
    
    @objc private func pressedFarm(_ sender: Any){
        print(visibleProduct as Any)
        let vc = FarmController()
        vc.productId = visibleProduct
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
