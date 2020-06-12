//
//  PremiumPopupPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-06-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation


protocol PremiumPopupViewDelegate : NSObjectProtocol{
    
}

class PremiumPopupPresenter{
    weak private var premiumPopupViewDelegate : PremiumPopupViewDelegate?
    
    func setPremiumPopupViewDelegate(premiumPopupViewDelegate : PremiumPopupViewDelegate){
        self.premiumPopupViewDelegate = premiumPopupViewDelegate
    }
    
    deinit {
        CheckPurchase.shared.checkUserPurchase()
    }
    
    func fullAccessClickedActions() {
        IAPService.shared.purchase(product: .fullAccess)
    }
   
}
