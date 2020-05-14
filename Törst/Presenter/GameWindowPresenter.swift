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
        setupStatementArray()
    }
    
    func setupPreStatementText() {
        switch GlobalVariables.gameType {
        case "JagHarAldrig":
           preGameText = "Jag har aldrig... \n"
        case "Pekleken":
            preGameText = "Vem "
        case "RyggMotRygg":
            preGameText = "Vem "
        default:
           preGameText = ""
        }
    }
    
    func setupStatementArray() {
        //Check if subscriber, if so randomize array and go, else use first 15 always
        
        self.gameWindowViewDelegate?.changeStatementUI(statement : preGameText + self.gameTextArray[counter])
    }
    
    func nextStatement() {
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
