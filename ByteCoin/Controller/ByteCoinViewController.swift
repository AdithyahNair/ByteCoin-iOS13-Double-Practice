//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ByteCoinViewController: UIViewController {
    
    var coinManager = CoinManager()

    @IBOutlet weak var coinValueLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        settingDataSourceAndDelegateMethodsToSelf()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let currency = coinManager.currencyArray[0]
        
        currencyLabel.text = currency
        
        coinManager.fetchData(currency)
        
    }
    
}






