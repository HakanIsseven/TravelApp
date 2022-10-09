//
//  FlightViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit

class FlightViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
    prepareView()
        
        }
        
            
    
    @objc func backToHomeVc() {
        
        navigationController?.popToRootViewController(animated: true)
    }


    
    
    
        }

        
        
        
        
        


private extension FlightViewController {
    
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



//
//
//if let navigationBar = self.navigationController?.navigationBar {
//    let firstFrame = CGRect(x: 80, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
//
//    let firstLabel = UILabel(frame: firstFrame)
//    firstLabel.text = "Flights"
//    firstLabel.font = UIFont (name: "SourceSansPro-Bold", size: 20)
//    navigationBar.addSubview(firstLabel)



//
//
//let back = UIImage(named: "back arrow")
//let backView = UIImageView(image: back)
//backView.isUserInteractionEnabled = true
//let tap = UITapGestureRecognizer(target: self, action: #selector(backToHomeVc))
//backView.addGestureRecognizer(tap)
//let backItem = UIBarButtonItem(customView: backView)
//navigationItem.leftBarButtonItem = backItem
//
//self.navigationItem.title = "Flights"
//let a = UINavigationBarAppearance()
//a.titlePositionAdjustment = .init(
//   horizontal: -CGFloat.greatestFiniteMagnitude,
//   vertical: 0
//)
//navigationItem.scrollEdgeAppearance = a
//navigationItem.compactAppearance = a
//navigationItem.standardAppearance = a
//
//




