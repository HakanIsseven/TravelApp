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
        //Making Bar button and bar tittle for navigation bar.
    }
}

private extension FlightListViewController {
    
    func setupUI() {
        flightTableView2.delegate = self
        flightTableView2.dataSource = self
        
        registerCell()
        prepareView()
    }
    func registerCell() {
        flightTableView2.register(.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
}

extension FlightListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let detailsVc = FlightDetailsViewController()
        
        detailsVc.flightData = self.flights[indexPath.row]
        detailsVc.modalPresentationStyle = .fullScreen
        self.present(detailsVc, animated: true)
        // Create a new FlightCellViewModel object to the new ViewController and open that vc
    }

}

extension FlightListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flightTableView2.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.tableViewMainLabel.text = flights[indexPath.row].callSign
        cell.tableViewSecondLabel.text = flights[indexPath.row].flightNumber
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
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
