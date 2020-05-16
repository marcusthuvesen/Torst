//
//  GameWindowView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class GameWindowView: UIViewController, GameWindowViewDelegate {
    
    
    @IBOutlet weak var infoBtnOutlet: UIButton!
    @IBOutlet weak var gameTextView: UITextView!
    @IBOutlet var backgroundView: UIView!
    
    let gameWindowViewDelegate = GameWindowPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGameWindowDelegate()
    }
    
    func setupGameWindowDelegate(){
        gameWindowViewDelegate.setGameWindowViewDelegate(gameWindowViewDelegate : self)
    }
    
    func setupUI() {
        infoBtnOutlet.infoOutlet_UI()
        gameTextView.centerText()
    }
    
    func changeBackgroundColor(colorString : String) {
        switch colorString {
        case "green":
            backgroundView.backgroundColor = .jagHarAldrigGreen
        case "beige":
           backgroundView.backgroundColor = .peklekenBeige
        case "red":
            backgroundView.backgroundColor = .ryggMotRyggRed
        case "pink":
            backgroundView.backgroundColor = .utmaningarPink
        case "purple":
            backgroundView.backgroundColor = .mixPurple
        default:
            backgroundView.backgroundColor = .utmaningarPink
        }
    }
    
    
    func changeStatementUI(statement : String) {
        gameTextView.text = statement
    }
    
    func sendToPopup() {
        presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup", VC: self)
    }
    
    @IBAction func previousStatement(_ sender: UIButton) {
        gameWindowViewDelegate.previousStatement()
    }
    
    @IBAction func nextStatement(_ sender: UIButton) {
        gameWindowViewDelegate.nextStatement()
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


