//
//  SearchViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    
    
    @IBOutlet weak var hotelSearchButton: UIButton!
    @IBOutlet weak var flightSearchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupSearchTextField()
        
    }
    
    
    @IBAction func hotelSearchButtonTapped(_ sender: Any) {
        
        hotelSearchButton.setImage(UIImage(named: "Hotel selected"), for: .normal)
        flightSearchButton.setImage(UIImage(named: "Flights Not Selected"), for: .normal)
        
    }
    
        
    @IBAction func flightSearchButtonTapped(_ sender: Any) {
        flightSearchButton.setImage(UIImage(named: "Flight Selected"), for: .normal)
        hotelSearchButton.setImage(UIImage(named: "Hotel not selected"), for: .normal)
    }
    
    
        
    }
    
 

    


private extension SearchViewController {
    
    
    func addRightImageTo(txtField: UITextField, andImage img: UIImage) {
        let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        rightImageView.image = img
        txtField.rightView = rightImageView
        txtField.rightViewMode = .always
}
    
    func setupSearchTextField() {
        
        
        let searchImage = UIImage(named: "Vector")
        addRightImageTo(txtField: searchTextField, andImage: searchImage!)
        
        
    }
    

}
