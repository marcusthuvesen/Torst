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
    
    @IBOutlet weak var mixerBtnOutlet: UIButton!
    @IBOutlet weak var lockImage: UIImageView!
    
    let homeDecisionViewDelegate = HomeDecisionPresenter()
    var alreadyShownAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeDecisionDelegate()
        setupHomeDecisionUI()
        changeUIBasedOnDevice()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        checkIfShouldShowGif()
        homeDecisionViewDelegate.checkIfPaidUserToChangeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showPopupAlert()
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    func showPopupAlert() {
        
        if alreadyShownAlert { return }

        let alert = UIAlertController(title: "Varning", message: "Drick ansvarsfullt. Genom att fortsätta, samtycker du till att du själv ansvarar för eventuella konsekvenser som kan uppstå genom att appen används", preferredStyle: UIAlertController.Style.alert)
      
        alert.addAction(UIAlertAction(title: "Okej", style: UIAlertAction.Style.default, handler: nil))
        
        alert.overrideUserInterfaceStyle = .dark
     
        alreadyShownAlert = true
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupHomeDecisionDelegate(){
        homeDecisionViewDelegate.setHomeDecisionViewDelegate(homeDecisionViewDelegate : self)
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .portrait
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func setupHomeDecisionUI() {
        for button in decisionBtnOutlets {
            button.homeDecisionOutlet_UI()
        }
        for button in decisionButtonImages {
            button.titleLabel?.minimumScaleFactor = 0.5
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.contentMode = .scaleAspectFit
        }
        
        setupGradientLayer()
        checkIfShouldShowGif()
    }
    
    func checkIfShouldShowGif() {
        if GlobalVariables.showMixGif {
            let gif = UIImage.gif(name: "mixerGif")
            mixerBtnOutlet.imageView?.animationImages = gif?.images
            mixerBtnOutlet.imageView?.animationDuration = gif!.duration
            mixerBtnOutlet.imageView?.animationRepeatCount = 1
            mixerBtnOutlet.imageView?.startAnimating()
            
            UIView.animate(withDuration: 1.0, delay: 0.3, options: [], animations: {
                self.mixerBtnOutlet.transform = CGAffineTransform(scaleX: 3, y: 3)
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 1.3, options: [], animations: {
                self.mixerBtnOutlet.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
            
            GlobalVariables.showMixGif = false
        }
    }
    
    func animateClickedBtn(senderTag: Int) {
       
        /*
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
            self.decisionButtonImages[senderTag].transform = CGAffineTransform(scaleX: 3, y: 3)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.4, options: [], animations: {
            self.decisionButtonImages[senderTag].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        */
        
        /*
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
            self.decisionButtonImages[senderTag].transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/8))
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.5, options: [], animations: {
            self.decisionButtonImages[senderTag].transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/8))
        }, completion: nil)
        */
    }
    
    func changeUIBasedOnDevice() {
        let deviceType = UIDevice.modelName
        
        if deviceType.contains("8") || deviceType.contains("7") || deviceType.contains("6") {
            changeUIForIphone678()
        }
        
        if deviceType.contains("iPad") {
            changeUIForIpad()
        }
    }
    
    func changeUIForIpad() {
        for button in decisionBtnOutlets{
            button.titleLabel?.font =  UIFont(name: "AvenirNext-DemiBold", size: 35)
            button.titleEdgeInsets.left = -300
        }
        for button in decisionButtonImages{
            if button.tag == 0 {
                button.imageEdgeInsets.left = 25
                button.imageEdgeInsets.top = 20
                button.imageEdgeInsets.bottom = 25
            }
                
            else if button.tag == 1 {
                button.imageEdgeInsets.left = -19
                button.imageEdgeInsets.top = 5
                button.imageEdgeInsets.bottom = 7
            }
                
            else if button.tag == 2 {
                button.imageEdgeInsets.left = 15
                button.imageEdgeInsets.top = 18
                button.imageEdgeInsets.bottom = 18
            }
                
            else if button.tag == 3 {
                button.imageEdgeInsets.left = -21
            }
                
            else{
                button.imageEdgeInsets.left = -21
                button.imageEdgeInsets.top = 20
            }
        }
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
        let sendToVC = UIStoryboard(name: "GameWindow", bundle: nil).instantiateViewController(withIdentifier: "GameWindow") as! GameWindowView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
    func sendToPremiumPopup() {
        let sendToVC = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup") as! PremiumPopupView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
    func removeLock() {
        lockImage.isHidden = true
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

