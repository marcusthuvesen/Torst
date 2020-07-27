//
//  GameWindowPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-13.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol GameWindowViewDelegate : NSObjectProtocol{
    func changeStatementUI(statement : String)
    func sendToPremiumPopup()
    func sendToInfoPopup()
    func changeBackgroundColor(colorString : String)
    func showCategoryLabel()
    func hideCategoryLabel()
    func setCategoryTextOnLabel(categoryText : String)
    func hideRulesIcon()
}

class GameWindowPresenter{
    
    weak private var gameWindowViewDelegate : GameWindowViewDelegate?
    var counter = 0
    let gameTextArray = GlobalVariables.gameTextArray
    
    
    func setGameWindowViewDelegate(gameWindowViewDelegate : GameWindowViewDelegate){
        self.gameWindowViewDelegate = gameWindowViewDelegate
        setBackgroundColor()
        setupStatementArray()
        showOrHideCategoryLabel()
    }
    
    func infoBtnActions() {
        self.gameWindowViewDelegate?.sendToInfoPopup()
    }
    
    func setBackgroundColor() {
        switch GlobalVariables.gameType {
        case "JagHarAldrig":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "blue")
        case "Pekleken":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "purple")
        case "RyggMotRygg":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "green")
        case "Utmaningar":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "beige")
        case "Mix":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "red")
        default:
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "red")
        }
    }
    
    func setCategoryColor(text : String) {
        var backgroundColor = ""
        let gameTexts = ProvideGameTexts()
        
        if gameTexts.handuppräckning.contains(text) { backgroundColor = "red"}
        if gameTexts.jagHarAldrig.contains(text) { backgroundColor = "blue"}
        if gameTexts.pekleken.contains(text) { backgroundColor = "purple"}
        if gameTexts.ryggMotRygg.contains(text) { backgroundColor = "green" }
        if gameTexts.utmaningar.contains(text) { backgroundColor = "beige" }
        if gameTexts.kategorier.contains(text) { backgroundColor = "red" }
        
        self.gameWindowViewDelegate?.changeBackgroundColor(colorString: backgroundColor)
    }
    
    func showOrHideCategoryLabel() {
        switch GlobalVariables.gameType {
        case "Mix":
            self.gameWindowViewDelegate?.showCategoryLabel()
        case "JagHarAldrig":
            self.gameWindowViewDelegate?.showCategoryLabel()
        default:
            self.gameWindowViewDelegate?.hideCategoryLabel()
        }
    }
    
    func showCategoryLabel() {
        self.gameWindowViewDelegate?.showCategoryLabel()
    }
    
    func setupStatementArray() {
        //Check if subscriber, if so randomize array and go, else use first 15 always
        setCategoryText(text : self.gameTextArray[counter])
        setCategoryColor(text : self.gameTextArray[counter])
        self.gameWindowViewDelegate?.changeStatementUI(statement : self.gameTextArray[counter])
    }
   
    func previousStatement() {
        if counter != 0 {
            counter -= 1
            setCategoryText(text : self.gameTextArray[counter])
            setCategoryColor(text : self.gameTextArray[counter])
            self.gameWindowViewDelegate?.changeStatementUI(statement : self.gameTextArray[counter])
        }
    }
    
    func nextStatement() {
        //If not purchased only show 15
        
        if (!GlobalVariables.partialAccessArrayKeys.contains(GlobalVariables.currentGameKey) && !GlobalVariables.hasFullAccess) && counter == 14 { self.gameWindowViewDelegate?.sendToPremiumPopup(); return}
        
        if counter < gameTextArray.count - 1 {
            counter += 1
            //If statement is same as in any of the arrays set pre defined category
            setCategoryText(text : self.gameTextArray[counter])
            setCategoryColor(text : self.gameTextArray[counter])
            self.gameWindowViewDelegate?.changeStatementUI(statement : self.gameTextArray[counter])
        } else {
            counter = 0
        }
    }

    
    func setCategoryText(text : String) {
        let gameTexts = ProvideGameTexts()
        var categoryText = ""
        
        if gameTexts.handuppräckning.contains(text) { categoryText = "Handuppräckning" }
        if gameTexts.jagHarAldrig.contains(text) { categoryText = "Jag har aldrig..." }
        if gameTexts.pekleken.contains(text) { categoryText = "Pekleken" }
        if gameTexts.ryggMotRygg.contains(text) { categoryText = "Rygg mot rygg" }
        if gameTexts.utmaningar.contains(text) { categoryText = "Utmaning" }
        if gameTexts.kategorier.contains(text) { categoryText = "Kategorin är..." }
        
        self.gameWindowViewDelegate?.setCategoryTextOnLabel(categoryText: categoryText)
    }
}
