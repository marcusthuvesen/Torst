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
}

class GameWindowPresenter{
    
    weak private var gameWindowViewDelegate : GameWindowViewDelegate?
    var counter = 0
    let gameTextArray = GlobalVariables.gameTextArray
    var preGameText = ""
    
    func setGameWindowViewDelegate(gameWindowViewDelegate : GameWindowViewDelegate){
        print("setup delegate")
        self.gameWindowViewDelegate = gameWindowViewDelegate
        setupPreStatementText()
        setBackgroundColor()
        setupStatementArray()
    }
    
    func setupPreStatementText() {
        
    }
    
    func infoBtnActions() {
        self.gameWindowViewDelegate?.sendToInfoPopup()
    }
    
    func setBackgroundColor() {
        switch GlobalVariables.gameType {
        case "JagHarAldrig":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "green")
        case "Pekleken":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "beige")
        case "RyggMotRygg":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "red")
        case "Utmaningar":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "pink")
        case "Mix":
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "purple")
        default:
            gameWindowViewDelegate?.changeBackgroundColor(colorString: "purple")
        }
    }
    
    func setupStatementArray() {
        //Check if subscriber, if so randomize array and go, else use first 15 always
        
        self.gameWindowViewDelegate?.changeStatementUI(statement : preGameText + self.gameTextArray[counter])
    }
    
    func nextStatement() {
        //If not subscriber only show 15
        if !isSubscriber() && counter == 14 { self.gameWindowViewDelegate?.sendToPremiumPopup(); return}
        
        if counter < gameTextArray.count - 1 {
            counter += 1
            self.gameWindowViewDelegate?.changeStatementUI(statement : preGameText + self.gameTextArray[counter])
        } else {
            counter = 0
        }
    }
    
    func previousStatement() {
        if counter != 0 {
            counter -= 1
            self.gameWindowViewDelegate?.changeStatementUI(statement : preGameText + self.gameTextArray[counter])
        }
    }
}
