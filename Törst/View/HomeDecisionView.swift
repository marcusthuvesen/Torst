//
//  HomeDecisionView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeDecisionView: UIViewController, HomeDecisionViewDelegate {
    
    @IBOutlet var decisionBtnOutlets: [UIButton]!
    
    let homeDecisionViewDelegate = HomeDecisionPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeDecisionDelegate()
        setupHomeDecisionUI()
    }
    
    func setupHomeDecisionDelegate(){
        homeDecisionViewDelegate.setHomeDecisionViewDelegate(homeDecisionViewDelegate : self)
    }
    
    func setupHomeDecisionUI() {
        for button in decisionBtnOutlets {
            button.homeDecisionOutlet_UI()
        }
    }
    
    func sendToGameWindow() {
        presentPopup(UIStoryboardName: "GameWindow", WithIdentifier: "GameWindow", VC: self)
    }
    
    func sendToPremiumPopup() {
        presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup", VC: self)
    }
    @IBAction func decisionBtnClicked(_ sender: UIButton) {
        homeDecisionViewDelegate.decisionBtnSelected(senderTag: sender.tag)
        
    }
    
}
