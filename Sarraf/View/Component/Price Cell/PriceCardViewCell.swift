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

        titlePrice.text = "دلار آمریکا"
        titlePrice.font = UIFont.shabnam(size: 14, weight: .bold)
        
        price.text = "۲۸۷۰۰۰ ریال"
        price.font = UIFont.shabnam(size: 21, weight: .bold)
        
        lasChangeTime.text = "18:00:12"
        lasChangeTime.font = UIFont.shabnam(size: 12, weight: .thin)
        
        changeAmount.text = "۲.۰۳٪"
        changeAmount.textColor = UIColor(named: Constant.Color.greenChange)
        changeAmount.font = UIFont.shabnam(size: 12, weight: .medium)
        
        changeStatus.image = UIImage(named: Constant.Image.upArrowGreen)
//        changeStatus.frame = CGRect(x: 10, y: 10, width: 13.15, height: 12)
        
        priceCard.layer.cornerRadius = 8
        
        
    
    }
}
