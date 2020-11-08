//
//  PriceCardViewCell.swift
//  Sarraf
//
//  Created by Hossein Akbari on 8/8/1399 AP.
//

import UIKit

class PriceCardViewCell: UICollectionViewCell {
    
    static let identifier = "PriceCardCell"
    
    @IBOutlet weak var priceCard: UIView!
    @IBOutlet weak var titlePrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var lasChangeTime: UILabel!
    @IBOutlet weak var changeStatus: UIImageView!
    @IBOutlet weak var changeAmount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titlePrice.font = UIFont.shabnam(size: 14, weight: .bold)
        price.font = UIFont.shabnam(size: 21, weight: .bold)
        lasChangeTime.font = UIFont.shabnam(size: 12, weight: .thin)
        changeAmount.font = UIFont.shabnam(size: 12, weight: .medium)
        priceCard.layer.cornerRadius = 8
    }
}
