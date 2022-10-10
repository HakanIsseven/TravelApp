//
//  ViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 30.09.2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet weak var topPickArticlesCollectionView: UICollectionView!
    private let viewModel = HomeViewModel()
    private var articles: [HomeCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


    @IBAction func flightsButtonTapped(_ sender: Any) {

        let flightVc = self.storyboard?.instantiateViewController(withIdentifier: "FlightListViewController") as! FlightListViewController
        navigationController?.pushViewController(flightVc, animated: true)


    }
    
    @IBAction func hotelsButtonTapped(_ sender: Any) {
        
        let hotelsVc = self.storyboard?.instantiateViewController(withIdentifier: "HotelsListViewController") as! HotelsListViewController
        navigationController?.pushViewController(hotelsVc, animated: true)

        
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
        return articles.count  }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopArticlesCollectionViewCell", for: indexPath) as! TopArticlesCollectionViewCell
        
        cell.collectionViewCellHeaderLabel.text =  articles[indexPath.row].articleName
        cell.collectionViewCellTagLabel.text = articles[indexPath.row].tag
        let url = URL.init(string: articles[indexPath.row].photoUrl!)
        cell.collectionViewCellImage.kf.setImage(with: url)
    

        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        
        
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        let detailsVc = ArticleDetailsViewController()
        detailsVc.articleData = self.articles[indexPath.row]
        

        detailsVc.modalPresentationStyle = .fullScreen
        self.present(detailsVc, animated: true)
        
        
        
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: (topPickArticlesCollectionView.frame.width * 0.64), height: topPickArticlesCollectionView.frame.height)
        
        
    }
    
    
    
}


extension HomeViewController: HomeViewModelViewProtocol {
 
    
    
    func didCellItemFetch(_ articles: [HomeCellViewModel]) {
        self.articles = articles
        DispatchQueue.main.async {
            self.topPickArticlesCollectionView.reloadData()
        }
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
}


