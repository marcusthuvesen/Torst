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
    }
    
    func setupHomeDecisionDelegate(){
        homeDecisionViewDelegate.setHomeDecisionViewDelegate(homeDecisionViewDelegate : self)
    }
    
    func sendToGameWindow() {
        presentPopup(UIStoryboardName: "GameWindow", WithIdentifier: "GameWindow", VC: self)
    }
    
    @IBAction func decisionBtnClicked(_ sender: UIButton) {
        homeDecisionViewDelegate.decisionBtnSelected(senderTag: sender.tag)
        
    }
    
}
