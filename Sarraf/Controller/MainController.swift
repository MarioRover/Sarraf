//
//  MainController.swift
//  Sarraf
//
//  Created by Hossein Akbari on 8/7/1399 AP.
//

import UIKit

class MainController: UIViewController {

    
    var currencyState = [CurrencyModel]()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate   = self
        collectionView.dataSource = self
        CurrencyService.shared.delegate = self
        
        collectionView.register(UINib(nibName: Constant.Cell.priceCard , bundle: nil), forCellWithReuseIdentifier: PriceCardViewCell.identifier)
        //
        titleLabel.text = "نرخ ارزها"
        titleLabel.tintColor = .white
        titleLabel.font = UIFont.shabnam(size: 24, weight: .bold)
        
        CurrencyService.shared.getList()
    }
    
}

// MARK: - CollectionView

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // FIXME: - Cell width is not responsive in small screen device
        return CGSize(width: 175, height: 133)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currencyState.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriceCardViewCell.identifier, for: indexPath) as! PriceCardViewCell

        if let safeCurrenctState = currencyState.count > 0 ? currencyState : nil {
            let currencyItem = safeCurrenctState[indexPath.row]
            
            cell.titlePrice.text = currencyItem.title
            cell.price.text      = "\(currencyItem.currentPrice) \(currencyItem.toCurrency)"
            cell.lasChangeTime.text = currencyItem.updateTime
            cell.changeAmount.text = "%\(currencyItem.percentChange)"
            
            if currencyItem.status == "high" {
                cell.changeStatus.image = UIImage(named: Constant.Image.upArrowGreen)
                cell.changeAmount.textColor = UIColor(named: Constant.Color.greenChange)
            } else if currencyItem.status == "low" {
                cell.changeStatus.image = UIImage(named: Constant.Image.downArrowRed)
                cell.changeAmount.textColor = UIColor(named: Constant.Color.redChange)
            }
            
        } else {
            print("There is problem")
        }
        
        
        return cell
    }
}

// MARK: - CurrencyServiceDelegate

extension MainController: CurrencyServiceDelegate {
    func didUpdateCurrencyList(_ currencyService: CurrencyService, currencyList: [CurrencyModel]) {
        
        if currencyList.count > 0 {
            DispatchQueue.main.async {
                self.currencyState = currencyList
                self.collectionView.reloadData()
            }
        } else {
            print("There is problem")
        }
        
    }
}
