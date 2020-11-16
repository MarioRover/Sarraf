//
//  Change.swift
//  Sarraf
//
//  Created by Hossein Akbari on 8/26/1399 AP.
//

import UIKit

class ChangeController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "تبدیل نرخ"
        titleLabel.tintColor = .white
        titleLabel.font = UIFont.shabnam(size: 24, weight: .bold)
        
    }
}

