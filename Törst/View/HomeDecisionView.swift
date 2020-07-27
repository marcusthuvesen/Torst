//
//  HomeDecisionView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SwiftGifOrigin

class HomeDecisionView: UIViewController, HomeDecisionViewDelegate {
    
    @IBOutlet var decisionBtnOutlets: [UIButton]!
    @IBOutlet var decisionButtonImages: [UIButton]!
    @IBOutlet weak var torstTitleLabel: UILabel!
    @IBOutlet weak var titleLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var mixerBtnOutlet: UIButton!
    
    let homeDecisionViewDelegate = HomeDecisionPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeDecisionDelegate()
        setupHomeDecisionUI()
        changeUIBasedOnDevice()
        titleLabelAnimation()
    }
    
    func setupHomeDecisionDelegate(){
        homeDecisionViewDelegate.setHomeDecisionViewDelegate(homeDecisionViewDelegate : self)
    }
    
    func setupHomeDecisionUI() {
        //titleLeftConstraint.constant = self.view.bounds.width
        for button in decisionBtnOutlets {
            button.homeDecisionOutlet_UI()
        }
        for button in decisionButtonImages {
            button.titleLabel?.minimumScaleFactor = 0.5
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.contentMode = .scaleAspectFit
        }
        
         let gif = UIImage.gif(name: "mixerGif")
               mixerBtnOutlet.imageView?.animationImages = gif?.images
               mixerBtnOutlet.imageView?.animationDuration = gif!.duration
               mixerBtnOutlet.imageView?.animationRepeatCount = 1
               mixerBtnOutlet.imageView?.startAnimating()
       
        setupGradientLayer()
    }
    
    func titleLabelAnimation() {
//        let center = self.view.bounds.width/2 + torstTitleLabel.frame.width/2
//        let left = CGAffineTransform(translationX: -center, y: 0)

        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.torstTitleLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.mixerBtnOutlet.transform = CGAffineTransform(scaleX: 3, y: 3)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {
            self.torstTitleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.mixerBtnOutlet.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        
    }
    
    
    func changeUIBasedOnDevice() {
        let screenBounds = UIScreen.main.bounds
        let width = screenBounds.width
        let height = screenBounds.height
        
        let deviceType = UIDevice.modelName
        
        print("ModelName: \(deviceType)")
        
        if deviceType.contains("8") || deviceType.contains("7") || deviceType.contains("6"){
            print("ModelName 6,7,8")
            changeUIForIphone678()
        }
            
        print("width & height: \(width) \(height)")
    }
    
    func changeUIForIphone678() {
        for button in decisionButtonImages{
            if button.tag == 0 {
                button.imageEdgeInsets.left = 8
                button.imageEdgeInsets.top = 8
                button.imageEdgeInsets.bottom = 8
            }
            
            else if button.tag == 1 {
                button.imageEdgeInsets.left = -10
                button.imageEdgeInsets.top = 0
                button.imageEdgeInsets.bottom = 0
            }
            
            else if button.tag == 2 {
                button.imageEdgeInsets.left = 3
                button.imageEdgeInsets.top = 6
                button.imageEdgeInsets.bottom = 6
            }
            
            else if button.tag == 3 {
                button.imageEdgeInsets.left = -9
            }
            
            else{
                button.imageEdgeInsets.left = -9
                button.imageEdgeInsets.top = 8
            }
            
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
    
    @IBAction func settingsBtnClicked(_ sender: UIButton) {
        presentPopup(UIStoryboardName: "SettingsPopup", WithIdentifier: "SettingsPopup", VC: self)
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

