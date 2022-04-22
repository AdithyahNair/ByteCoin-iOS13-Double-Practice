//
//  Extensions.swift
//  ByteCoin
//
//  Created by Adithyah Nair on 22/04/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit


extension ByteCoinViewController: UIPickerViewDataSource {
    
    //MARK: - pickerView DataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return coinManager.currencyArray.count
        
    }
    
}

extension ByteCoinViewController: UIPickerViewDelegate {
    
    //MARK: - pickerView Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return coinManager.currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let currency = coinManager.currencyArray[row]
        
        currencyLabel.text = currency
        
        coinManager.fetchData(currency)
        
    }
    
}

extension ByteCoinViewController: CoinManagerDelegate {
    
    //MARK: - coinManager Delegate Methods
    
    func updateCoin(_ coinModel: CoinModel) {
        
        DispatchQueue.main.async {
            
            self.coinValueLabel.text = coinModel.rateInString
            
        }
        
    }
    
    func updateError(_ error: Error) {
        
        print("Error: \(error)")
        
    }
    
}

extension ByteCoinViewController {
    
    //MARK: - settingDataSourceAndDelegateMethodsToSelf()
    
    func settingDataSourceAndDelegateMethodsToSelf() {
        
        pickerView.dataSource = self
        
        pickerView.delegate = self
        
        coinManager.delegate = self
        
    }
    
}
