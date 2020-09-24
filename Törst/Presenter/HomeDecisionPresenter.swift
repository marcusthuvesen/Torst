//
//  HomeDecisionPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol HomeDecisionViewDelegate : NSObjectProtocol{
    //func decisionBtnSelected(sender : UIButton)
    func sendToGameWindow()
    func sendToPremiumPopup()
    func removeLock()
}

class HomeDecisionPresenter{
    weak private var homeDecisionViewDelegate : HomeDecisionViewDelegate?
    let provideGameTexts = ProvideGameTexts()
    
    func setHomeDecisionViewDelegate(homeDecisionViewDelegate : HomeDecisionViewDelegate){
        self.homeDecisionViewDelegate = homeDecisionViewDelegate
        checkIfPaidUserToChangeUI()
    }
    
    func checkIfPaidUserToChangeUI() {
        if GlobalVariables.hasFullAccess {
            self.homeDecisionViewDelegate?.removeLock()
        }
    }
    
    func decisionBtnSelected(senderTag : Int) {
        
        switch senderTag {
        case 0:
            fetch_JagHarAldrig()
            GlobalVariables.currentGameKey = IAPProduct.partialAccessJagHarAldrig.rawValue
        case 1:
            fetch_Pekleken()
            GlobalVariables.currentGameKey = IAPProduct.partialAccessPekleken.rawValue
        case 2:
            fetch_RyggMotRygg()
            GlobalVariables.currentGameKey = IAPProduct.partialAccessRyggMotRygg.rawValue
        case 3:
            fetch_Utmaningar()
            GlobalVariables.currentGameKey = IAPProduct.partialAccessUtmaningar.rawValue
        case 4:
            fetch_Mix()
            GlobalVariables.currentGameKey = ""
        default:
            fetch_JagHarAldrig()
        }
    }
    
    func fetch_JagHarAldrig() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "JagHarAldrig")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessJagHarAldrig.rawValue)
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Pekleken() {
        
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Pekleken")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessPekleken.rawValue)
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_RyggMotRygg() {
        
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "RyggMotRygg")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessRyggMotRygg.rawValue)
        homeDecisionViewDelegate?.sendToGameWindow()
        
    }
    
    func fetch_Utmaningar() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Utmaningar")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessUtmaningar.rawValue)
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func checkIfNeedsToBeSorted(accessKey : String) {
        if GlobalVariables.partialAccessArrayKeys.contains(accessKey) || GlobalVariables.hasFullAccess {
            GlobalVariables.gameTextArray.shuffle()
            dump(GlobalVariables.gameTextArray)
        }
    }
    
    func fetch_Mix() {
        if !GlobalVariables.hasFullAccess { self.homeDecisionViewDelegate?.sendToPremiumPopup() }
        else {
            provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Mix")
            GlobalVariables.gameTextArray.shuffle()
            homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    
    
}







//import Foundation
//import UIKit
//
//protocol HomeDecisionViewDelegate : NSObjectProtocol{
//    //func decisionBtnSelected(sender : UIButton)
//}
//
//class HomeDecisionPresenter{
//    weak private var homeDecisionViewDelegate : HomeDecisionViewDelegate?
//
//    func setHomeDecisionViewDelegate(homeDecisionViewDelegate : HomeDecisionViewDelegate){
//        self.homeDecisionViewDelegate = homeDecisionViewDelegate
//    }
//
//
//}
