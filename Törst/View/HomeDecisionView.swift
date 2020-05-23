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
        setupGradientLayer()
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
    
    func setupGradientLayer() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.premiumBlue.cgColor, UIColor.premiumPurple.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.view.layer.sublayers?.first?.frame = self.view.bounds
    }
    
}
