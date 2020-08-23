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

            let fullAccessPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.FullAccess")
            let partialAccessJagHarAldrigPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.PartialAccess.JagHarAldrig")
            let partialAccessPeklekenPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.PartialAccess.Pekleken")
            let partialAccessRyggMotRyggPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.PartialAccess.RyggMotRygg")
            let partialAccessUtmaningarPurchase = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Torst.PartialAccess.Utmaningar")
            print("fullaccesspurchasecount = \(fullAccessPurchase.count)")
            if fullAccessPurchase.count != 0{
                GlobalVariables.hasFullAccess = true
                print("Has purchase \(fullAccessPurchase)")
            } else {
                GlobalVariables.hasFullAccess = false
            }

            if partialAccessJagHarAldrigPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append("se.marcusthuvesen.Torst.PartialAccess.JagHarAldrig")
            }

            if partialAccessPeklekenPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append("se.marcusthuvesen.Torst.PartialAccess.Pekleken")
            }

            if partialAccessRyggMotRyggPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append("se.marcusthuvesen.Torst.PartialAccess.RyggMotRygg")
            }

            if partialAccessUtmaningarPurchase.count != 0 {
                GlobalVariables.partialAccessArrayKeys.append("se.marcusthuvesen.Torst.PartialAccess.Utmaningar")
            }

        } catch {
            print("no Purhase \(error)")

        }
    }
    
}
