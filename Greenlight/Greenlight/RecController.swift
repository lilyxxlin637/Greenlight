//
//  RecController.swift
//  Greenlight
//
//  Created by Lily Lin on 3/6/21.
//

import Foundation
import UIKit

class RecController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    private var recommendations:[Recommendations] = [Recommendations(true), Recommendations(false)]
    private var recCollectionView: UICollectionView!
    
    private var navBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupCollectionView()
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
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width - 40, height: 400)
        
        self.recCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        recCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recCollectionView.backgroundColor = .white
        recCollectionView.register(RecCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        recCollectionView.dataSource = self
        recCollectionView.delegate = self
        
        view.addSubview(recCollectionView)
        
        NSLayoutConstraint.activate([
            recCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recCollectionView.heightAnchor.constraint(equalToConstant: 400),
            recCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recommendations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecCollectionViewCell
        cell.setupView(recommendations[indexPath.row])        
        return cell
        
    }
    
}
