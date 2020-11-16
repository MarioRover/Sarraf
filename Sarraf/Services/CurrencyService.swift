//
//  CurrencyService.swift
//  Sarraf
//
//  Created by Hossein Akbari on 8/13/1399 AP.
//

import Foundation
import Alamofire

protocol CurrencyServiceDelegate {
    func didUpdateCurrencyList(_ currencyService: CurrencyService,currencyList: [CurrencyModel])
}


class CurrencyService {
    
    static let shared = CurrencyService()
    var delegate: CurrencyServiceDelegate?
    
    func getList(responseType : String) {
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        var request = URLRequest(url: URL(string: "https://call.tgju.org/ajax.json")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        // Fetch Request
        AF.request(request)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        print("⛔️ \("There is error")")
                        return
                    }
                    
                    do {
                        let currencyStruct = try JSONDecoder().decode(CurrencyStruct.self, from: data)
                        let result = CurrencyResponse(currencyStruct: currencyStruct , responseType: responseType)
                        self.delegate?.didUpdateCurrencyList(self, currencyList: result.currencyStats)
                        
                    } catch {
                        print(error)
                        
                    }
                case .failure:
                    print("⛔️ \(response.result)")
                }
        }
    }
    
}
