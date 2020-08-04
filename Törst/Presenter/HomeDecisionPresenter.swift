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
     //   if GlobalVariables.hasFullAccess {
            self.homeDecisionViewDelegate?.removeLock()
       // }
    }
    
    func decisionBtnSelected(senderTag : Int) {
        
        switch senderTag {
        case 0:
            fetch_JagHarAldrig()
            GlobalVariables.currentGameKey = "se.marcusthuvesen.Torst.PartialAccess.JagHarAldrig"
        case 1:
            fetch_Pekleken()
            GlobalVariables.currentGameKey = "se.marcusthuvesen.Torst.PartialAccess.Pekleken"
        case 2:
            fetch_RyggMotRygg()
            GlobalVariables.currentGameKey = "se.marcusthuvesen.Torst.PartialAccess.RyggMotRygg"
        case 3:
            fetch_Utmaningar()
            GlobalVariables.currentGameKey = "se.marcusthuvesen.Torst.PartialAccess.Utmaningar"
        case 4:
            fetch_Mix()
            GlobalVariables.currentGameKey = ""
        default:
            fetch_JagHarAldrig()
        }
        
    }
    
    func fetch_JagHarAldrig() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "JagHarAldrig")
        homeDecisionViewDelegate?.sendToGameWindow()
        checkIfNeedsToBeSorted(accessKey: "se.marcusthuvesen.Torst.PartialAccess.JagHarAldrig")
    }
    
    func fetch_Pekleken() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Pekleken")
        homeDecisionViewDelegate?.sendToGameWindow()
        checkIfNeedsToBeSorted(accessKey: "se.marcusthuvesen.Torst.PartialAccess.Pekleken")
    }
    
    func fetch_RyggMotRygg() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "RyggMotRygg")
        homeDecisionViewDelegate?.sendToGameWindow()
        checkIfNeedsToBeSorted(accessKey: "se.marcusthuvesen.Torst.PartialAccess.RyggMotRygg")
    }
    
    func fetch_Utmaningar() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Utmaningar")
        homeDecisionViewDelegate?.sendToGameWindow()
        checkIfNeedsToBeSorted(accessKey: "se.marcusthuvesen.Torst.PartialAccess.Utmaningar")
    }
    
    func checkIfNeedsToBeSorted(accessKey : String) {
       // if GlobalVariables.partialAccessArrayKeys.contains(accessKey) || GlobalVariables.hasFullAccess {
            GlobalVariables.gameTextArray.shuffle()
            
      //  }
    }
    
    func fetch_Mix() {
       // if !GlobalVariables.hasFullAccess { self.homeDecisionViewDelegate?.sendToPremiumPopup() }
       // else {
            provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Mix")
            homeDecisionViewDelegate?.sendToGameWindow()
      //  }
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
