//
//  CollectionViewCell.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topLabel: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var collectionViewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
