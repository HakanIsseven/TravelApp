//
//  HotelDetailsViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 11.10.2022.
//

import UIKit
import Kingfisher

class HotelDetailsViewController: UIViewController {
    

    @IBOutlet weak var hotelDetailsImage: UIImageView!
    @IBOutlet weak var hotelDetailsName: UILabel!
    @IBOutlet weak var hotelDetailsCity: UILabel!
    @IBOutlet weak var hotelDetailsStar: UILabel!
    
    var hotelsData: HotelCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        hotelDetailsName.text = "Hotel Name: \(hotelsData?.name ?? "")"
        hotelDetailsCity.text = "Hotel City: \(hotelsData?.city ?? "")"
        hotelDetailsStar.text = "Hotel Star: \(hotelsData?.star ?? "")"
        let url = URL.init(string: (hotelsData?.photo)!)
        hotelDetailsImage.kf.setImage(with: url)
        
        hotelDetailsImage.layer.cornerRadius = 32
        hotelDetailsImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        hotelDetailsImage.clipsToBounds = true


    }


    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func addBookmarkButtonTapped(_ sender: Any) {
    }
    
    
    
    
}
