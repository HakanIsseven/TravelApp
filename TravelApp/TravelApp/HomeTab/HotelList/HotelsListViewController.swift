//
//  HotelsViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit
import Kingfisher

class HotelsListViewController: UIViewController {


    @IBOutlet weak var hotelTableView: UITableView!
    private let viewModel = HotelListViewModel()
    private var hotels: [HotelCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  prepareView()
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        
        
}

    @objc func backToHomeVc() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}





extension HotelsListViewController: UITableViewDelegate {
    

}

extension HotelsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hotelTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.tableViewMainLabel.text = hotels[indexPath.row].name
        cell.tableViewSecondLabel.text = hotels[indexPath.row].city
        let url = URL.init(string: hotels[indexPath.row].photo!)
        cell.tableViewBackImage.kf.setImage(with: url)
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true


        return cell
    }
    
}







private extension HotelsListViewController {
    
    func setupUI() {
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        
        registerCell()
    }
    func registerCell() {
        hotelTableView.register(.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
}

extension HotelsListViewController: HotelListViewModelViewProtocol {
 
    
    
    func didCellItemFetch(_ hotels: [HotelCellViewModel]) {
        self.hotels = hotels
        DispatchQueue.main.async {
            self.hotelTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
}



private extension HotelsListViewController {
    func prepareView() {
              
        let back = UIImage(named: "back arrow")
        let backView = UIImageView(image: back)
        backView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(backToHomeVc))
        backView.addGestureRecognizer(tap)
        let backItem = UIBarButtonItem(customView: backView)
        navigationItem.leftBarButtonItem = backItem
        
        self.navigationItem.title = "Hotels"
        let a = UINavigationBarAppearance()
        a.titlePositionAdjustment = .init(
           horizontal: -CGFloat.greatestFiniteMagnitude,
           vertical: 0
        )
        navigationItem.scrollEdgeAppearance = a
        navigationItem.compactAppearance = a
        navigationItem.standardAppearance = a
    }
}
