//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Adithyah Nair on 22/04/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

struct CoinModel {
    
    let rate: Double
    
    var rateInString: String {
        
        return String(format: "%0.3f", rate)
        
    }
    
}
