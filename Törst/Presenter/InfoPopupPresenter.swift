//
//  InfoPopupPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-23.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol InfoPopupViewDelegate : NSObjectProtocol{
    //func decisionBtnSelected(sender : UIButton)
    func setRulesTextToTextView(rulesText : String)
    func setRulesLabelTextToLabel(rulesLabelText : String)
    func setRulesImageToUI(rulesImgString : String)
}

class InfoPopupPresenter{
    weak private var infoPopupViewDelegate : InfoPopupViewDelegate?
    let provideGameTexts = ProvideGameTexts()
    
    func setInfoPopupViewDelegate(infoPopupViewDelegate : InfoPopupViewDelegate){
        self.infoPopupViewDelegate = infoPopupViewDelegate
        setupRulesText()
        setupRulesImages()
    }
    
    func setupRulesImages() {
        var rulesImageString = ""
        switch GlobalVariables.gameType {
        case "JagHarAldrig":
            rulesImageString = "drinks"
        case "Pekleken":
            rulesImageString = "Hand"
        case "RyggMotRygg":
            rulesImageString = "chairs2"
        case "Utmaningar":
            rulesImageString = "Arms"
        case "Mix":
            rulesImageString = "mix"
        default:
            rulesImageString = "drinks"
        }
        
        self.infoPopupViewDelegate?.setRulesImageToUI(rulesImgString : rulesImageString)
    }
    
    func setupRulesText() {
        
        let provideRules = ProvideGameRules()
        var rulesText = ""
        var rulesLabelText = ""
        
        switch GlobalVariables.gameType {
        case "JagHarAldrig":
            rulesText = provideRules.jagHarAldrigRules()
            rulesLabelText = "Jag har aldrig"
        case "Pekleken":
            rulesText = provideRules.peklekenRules()
            rulesLabelText = "Pekleken"
        case "RyggMotRygg":
            rulesText = provideRules.ryggMotRyggRules()
            rulesLabelText = "Rygg mot rygg"
        case "Utmaningar":
            rulesText = provideRules.utmaningarRules()
            rulesLabelText = "Utmaningar"
        case "Mix":
            rulesText = provideRules.mixRules()
            rulesLabelText = "Mix"
        default:
            rulesText = provideRules.mixRules()
            rulesLabelText = "Mix"
        }
        self.infoPopupViewDelegate?.setRulesTextToTextView(rulesText: rulesText)
        self.infoPopupViewDelegate?.setRulesLabelTextToLabel(rulesLabelText: rulesLabelText)
    }
}
