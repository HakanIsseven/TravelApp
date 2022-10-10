//
//  TableViewCell.swift
//  TravelApp
//
//  Created by Hakan İşseven on 9.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tableViewBackImage: UIImageView!
    @IBOutlet weak var tableViewMainLabel: UILabel!
    @IBOutlet weak var tableViewSecondLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         let bottomSpace: CGFloat = 14.0 
         self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
    
}
