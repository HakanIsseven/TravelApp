//
//  FlightViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit

class FlightListViewController: UIViewController {

    
    @IBOutlet weak var flightTableView2: UITableView!
    
    private let viewModel = FlightListViewModel()
    private var flights: [FlightCellViewModel] = []
    
    
    
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

        
        





private extension FlightListViewController {

    func prepareView() {



        let back = UIImage(named: "back arrow")
        let backView = UIImageView(image: back)
        backView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(backToHomeVc))
        backView.addGestureRecognizer(tap)
        let backItem = UIBarButtonItem(customView: backView)
        navigationItem.leftBarButtonItem = backItem

        self.navigationItem.title = "Flights"
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

private extension FlightListViewController {
    
    func setupUI() {
        flightTableView2.delegate = self
        flightTableView2.dataSource = self
        
        registerCell()
    }
    func registerCell() {
        flightTableView2.register(.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
}

extension FlightListViewController: UITableViewDelegate {
    

}

extension FlightListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flightTableView2.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.tableViewMainLabel.text = flights[indexPath.row].arrival
        cell.tableViewSecondLabel.text = flights[indexPath.row].departure


        return cell
    }
    
}


extension FlightListViewController: FlightListViewModelViewProtocol {
 
    
    
    func didCellItemFetch(_ flights: [FlightCellViewModel]) {
        self.flights = flights
        DispatchQueue.main.async {
            self.flightTableView2.reloadData()
        }
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
}
