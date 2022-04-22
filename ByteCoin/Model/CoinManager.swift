//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func updateCoin(_ coinModel: CoinModel)
    
    func updateError(_ error: Error)
    
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    
    let apiKey = "?apikey=143815AB-AA09-4CE5-A232-246FA640DEAB"
    
    let currencyArray = ["AUD", "BRL","CAD","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchData(_ currency: String) {
        
        let urlString = "\(baseURL+currency+apiKey)"
        
        if let url = URL(string: urlString) {
            
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { data, response, error in
                
                if let safeData = data {
                    
                    if let coinModel = parseJSON(safeData) {
                        
                        delegate?.updateCoin(coinModel)
                        
                    } else {
                        
                        if let safeError = error {
                            
                            delegate?.updateError(safeError)
                            
                        }
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(CoinData.self, from: data)
            
            let rate = decodedData.rate
            
            let coinModel = CoinModel(rate: rate)
            
            return coinModel
            
        } catch {
            
            delegate?.updateError(error)
            
            return nil
            
        }
        
    }
    
}
