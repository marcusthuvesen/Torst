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
    @IBOutlet weak var categoryLabel: UILabel!
    
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
        case "blue":
            backgroundView.backgroundColor = .jagHarAldrigBlue
        case "purple":
           backgroundView.backgroundColor = .peklekenPurple
        case "green":
            backgroundView.backgroundColor = .ryggMotRyggGreen
        case "beige":
            backgroundView.backgroundColor = .utmaningarOrange
        case "red":
            backgroundView.backgroundColor = .mixRed
        default:
            backgroundView.backgroundColor = .mixRed
        }
    }
    
    func showCategoryLabel() {
        print("show categorylabel")
        categoryLabel.isHidden = false
    }
    
    func hideCategoryLabel() {
        categoryLabel.isHidden = true
    }
    
    func setCategoryTextOnLabel(categoryText : String) {
        print("show categorylabel \(categoryText)")
        categoryLabel.text = categoryText
    }
    
    func changeStatementUI(statement : String) {
        gameTextView.text = statement
    }
    
    func showRulesIcon() {
        infoBtnOutlet.isHidden = false
    }
    
    func hideRulesIcon() {
        infoBtnOutlet.isHidden = true
    }
    
    func sendToPremiumPopup() {
        presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup", VC: self)
    }
    
    func sendToInfoPopup() {
        presentPopup(UIStoryboardName: "InfoPopup", WithIdentifier: "InfoPopup", VC: self)
    }
    
    @IBAction func infoBtnClicked(_ sender: UIButton) {
        gameWindowViewDelegate.infoBtnActions()
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


