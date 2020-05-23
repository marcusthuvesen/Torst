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
    return true
}

class CheckSubscription{
   static let shared = CheckSubscription()
    func checkUserSubscription() -> Bool{
        var hasSubscription = false
        do {
            let receipt = try InAppReceipt.localReceipt()
            
            
            let purchase = receipt.activeAutoRenewableSubscriptionPurchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.1MonthSub", forDate: Date())
            
             let purchase2 = receipt.activeAutoRenewableSubscriptionPurchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.6MonthSub", forDate: Date())
        
            if purchase != nil || purchase2 != nil{
                hasSubscription = true
                print("Has subscription \(purchase)")
            }
            
        } catch {
            print(error)
            if error != nil{
                print("No subscription")
            }
            hasSubscription = false
        }
       return hasSubscription
    }
    
}
