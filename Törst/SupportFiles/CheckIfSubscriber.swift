//
//  CheckIfSubscriber.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-14.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import TPInAppReceipt

func isSubscriber() -> Bool {
    return false
}

class CheckSubscription{
   static let shared = CheckSubscription()
    func checkUserSubscription() -> (Bool, Bool) {
        
        var hasFullAccess = false
        var hasPartialAccess = false
        
        do {
            let receipt = try InAppReceipt.localReceipt()
            let fullAccessPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.FullAccess")
             let partialAccessPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.PartialAccess")
        
            if fullAccessPurchase.count != 0 {
                hasFullAccess = true
                print("Has purchase \(fullAccessPurchase)")
            }
            
            if partialAccessPurchase.count != 0 {
                hasPartialAccess = true
                print("Has purchase \(partialAccessPurchase)")
                //Find out what category was chosen from Firebase
                
            }
            
        } catch {
            
            print("no Purhase \(error)")
            hasFullAccess = false
            hasPartialAccess = false
            
        }
       return (hasPartialAccess, hasFullAccess)
    }
    
    func fetchCategoryChosen() {
        
    }
    
    
}
