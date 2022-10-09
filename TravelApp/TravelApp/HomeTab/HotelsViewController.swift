//
//  HotelsViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit

class HotelsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
  prepareView()
        
        
}

    
    @objc func backToHomeVc() {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}







private extension HotelsViewController {
    
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
