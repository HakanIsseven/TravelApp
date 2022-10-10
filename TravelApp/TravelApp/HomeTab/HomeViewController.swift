//
//  ViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 30.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var topPickArticlesCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }



}

private extension HomeViewController {
    
    func setupUI() {
        topPickArticlesCollectionView.delegate = self
        topPickArticlesCollectionView.dataSource = self
        
        
        registerCell()
    }
    func registerCell() {
        topPickArticlesCollectionView.register(.init(nibName: "TopArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopArticlesCollectionViewCell")
    }
    
}



extension HomeViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopArticlesCollectionViewCell", for: indexPath) as! TopArticlesCollectionViewCell
        
        cell.layer.cornerRadius = 6
        
        
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: (topPickArticlesCollectionView.frame.width * 0.64), height: topPickArticlesCollectionView.frame.height)
        
        
    }
    
    
    
}


