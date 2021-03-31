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
    func sendToGameWindow()
    func sendToPremiumPopup()
    func removeLock()
    func animateClickedBtn(senderTag : Int)
}

class HomeDecisionPresenter{
    weak private var homeDecisionViewDelegate : HomeDecisionViewDelegate?
    static let provideGameTexts = ProvideGameTexts()
    
    func setHomeDecisionViewDelegate(homeDecisionViewDelegate : HomeDecisionViewDelegate){
        self.homeDecisionViewDelegate = homeDecisionViewDelegate
        checkIfPaidUserToChangeUI()
        HomeDecisionPresenter.provideGameTexts.fetchFromFB()
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
        HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "JagHarAldrig")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessJagHarAldrig.rawValue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    func fetch_Pekleken() {
        HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Pekleken")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessPekleken.rawValue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    func fetch_RyggMotRygg() {
        HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "RyggMotRygg")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessRyggMotRygg.rawValue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.homeDecisionViewDelegate?.sendToGameWindow()
        }
    }
    
    func fetch_Utmaningar() {
        HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Utmaningar")
        checkIfNeedsToBeSorted(accessKey: IAPProduct.partialAccessUtmaningar.rawValue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.homeDecisionViewDelegate?.sendToGameWindow()
        }
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
            HomeDecisionPresenter.provideGameTexts.setGameText(gameType: "Mix")
            GlobalVariables.gameTextArray.shuffle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.homeDecisionViewDelegate?.sendToGameWindow()
            }
        }
    }
    
    
    
}



