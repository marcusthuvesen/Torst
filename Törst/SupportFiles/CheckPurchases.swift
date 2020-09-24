//
//  CheckPurchases.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-06-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import TPInAppReceipt
import SwiftyStoreKit


class CheckPurchase{
    static let shared = CheckPurchase()
    
   
    func checkUserPurchase() {
        GlobalVariables.hasFullAccess = false
        GlobalVariables.partialAccessArrayKeys.removeAll()
        do {

            let receipt = try InAppReceipt.localReceipt()

            let fullAccessPurchase = receipt.purchases(ofProductIdentifier: IAPProduct.fullAccess.rawValue)
            let partialAccessJagHarAldrigPurchase = receipt.purchases(ofProductIdentifier: IAPProduct.partialAccessJagHarAldrig.rawValue)
            let partialAccessPeklekenPurchase = receipt.purchases(ofProductIdentifier: IAPProduct.partialAccessPekleken.rawValue)
            let partialAccessRyggMotRyggPurchase = receipt.purchases(ofProductIdentifier: IAPProduct.partialAccessRyggMotRygg.rawValue)
            let partialAccessUtmaningarPurchase = receipt.purchases(ofProductIdentifier: IAPProduct.partialAccessUtmaningar.rawValue)
            print("fullaccesspurchasecount = \(fullAccessPurchase.count)")
            if fullAccessPurchase.count != 0{
                GlobalVariables.hasFullAccess = true
                print("Has purchase \(fullAccessPurchase)")
            } else {
                GlobalVariables.hasFullAccess = false
            }

            if partialAccessJagHarAldrigPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append(IAPProduct.partialAccessJagHarAldrig.rawValue)
            }

            if partialAccessPeklekenPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append(IAPProduct.partialAccessPekleken.rawValue)
            }

            if partialAccessRyggMotRyggPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append(IAPProduct.partialAccessRyggMotRygg.rawValue)
            }

            if partialAccessUtmaningarPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append(IAPProduct.partialAccessUtmaningar.rawValue)
            }

        } catch {
            print("no Purhase \(error)")

        }
    }
    
}
