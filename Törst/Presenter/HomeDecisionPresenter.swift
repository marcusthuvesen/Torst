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
}

class HomeDecisionPresenter{
    weak private var homeDecisionViewDelegate : HomeDecisionViewDelegate?
    let provideGameTexts = ProvideGameTexts()
    
    func setHomeDecisionViewDelegate(homeDecisionViewDelegate : HomeDecisionViewDelegate){
        self.homeDecisionViewDelegate = homeDecisionViewDelegate
    }
    
    func decisionBtnSelected(senderTag : Int) {
        
        switch senderTag {
        case 0:
            fetch_JagHarAldrig()
        case 1:
            fetch_Pekleken()
        case 2:
            fetch_RyggMotRygg()
        case 3:
            fetch_Utmaningar()
        case 4:
            fetch_Mix()
        default:
            fetch_JagHarAldrig()
        }
        
    }
    
    func fetch_JagHarAldrig() {
//        let FetchGameText = FetchGameTexts()
//        FetchGameText.fetchGameTexts(gameType : "JagHarAldrig") { fetchedArray in
//            print("inside completion handler : \(fetchedArray)")
//        }
        
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "JagHarAldrig")
//        for i in 0 ... GlobalVariables.gameTextArray.count - 1{
//            let originalText = GlobalVariables.gameTextArray[i]
//            print(originalText)
//            GlobalVariables.gameTextArray.remove(at: i)
//            GlobalVariables.gameTextArray.insert("Jag har aldrig...\n" + originalText, at: i)
//            print(GlobalVariables.gameTextArray[i])
//        }
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Pekleken() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Pekleken")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_RyggMotRygg() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "RyggMotRygg")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Utmaningar() {
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Utmaningar")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Mix() {
        if !isSubscriber() { self.homeDecisionViewDelegate?.sendToPremiumPopup() }
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
