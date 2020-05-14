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
        print("Jag har aldrig")
//        let FetchGameText = FetchGameTexts()
//        FetchGameText.fetchGameTexts(gameType : "JagHarAldrig") { fetchedArray in
//            print("inside completion handler : \(fetchedArray)")
//        }
        
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "JagHarAldrig")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Pekleken() {
        print("Pekleken")
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Pekleken")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_RyggMotRygg() {
        print("Rygg mot rygg")
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "RyggMotRygg")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Utmaningar() {
        print("Utmaningar")
        provideGameTexts.fetchFromFB_OrLoadLocally(gameType : "Utmaningar")
        homeDecisionViewDelegate?.sendToGameWindow()
    }
    
    func fetch_Mix() {
        print("Mix")
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
