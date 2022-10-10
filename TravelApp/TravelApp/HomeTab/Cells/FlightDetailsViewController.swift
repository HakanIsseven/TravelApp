//
//  FlightDetailsViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 11.10.2022.
//

import UIKit

class FlightDetailsViewController: UIViewController {
    
    @IBOutlet weak var flightDepartureLabel: UILabel!
    @IBOutlet weak var flightArrivalLabel: UILabel!
    @IBOutlet weak var flightAirlineLabel: UILabel!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var flightDetailsImage: UIImageView!
    var flightData: FlightCellViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        flightDepartureLabel.text = "Departure: \(flightData?.departureAirpot ?? "")"
        flightArrivalLabel.text = "Arrival: \(flightData?.arrivalAirport ?? "")"
flightNumberLabel.text = "Flight Number:\(flightData?.flightNumber ?? "")"
flightAirlineLabel.text = "Airline: \(flightData?.callSign ?? "")"
 
        flightDetailsImage.layer.cornerRadius = 32
        flightDetailsImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        flightDetailsImage.clipsToBounds = true

    }

    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func addBookmarkTapped(_ sender: Any) {
    }
    
    


}
