//
//  ArticleDetailsViewController.swift
//  TravelApp
//
//  Created by Hakan İşseven on 11.10.2022.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: UIViewController {
    
  
    
    @IBOutlet weak var articleDetailsImage: UIImageView!
    @IBOutlet weak var articleDetailsTag: UILabel!
    @IBOutlet weak var articleDetailsTitle: UILabel!
    @IBOutlet weak var articleDetailsDesc: UILabel!
    
    var articleData: HomeCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        articleDetailsTag.text = articleData?.tag
        articleDetailsTitle.text = articleData?.articleName
        articleDetailsDesc.text = articleData?.desc
        let url = URL.init(string: (articleData?.photoUrl!)!)
        articleDetailsImage.kf.setImage(with: url)

        articleDetailsImage.layer.cornerRadius = 32
        articleDetailsImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        articleDetailsImage.clipsToBounds = true
      
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
                self.dismiss(animated: true)
        
    }
    }

