
//  SettingsPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-29.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

class SettingsPopupView: UIViewController, SettingsPopupViewDelegate{
    
    @IBOutlet var settingsOutlets: [UIButton]!
    @IBOutlet weak var settingsBgView: UIView!
    
    let settingsPopupViewDelegate = SettingsPopupPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettings_UI()
        setupSettingsPopupDelegate()
    }
    
    func setupSettings_UI() {
        for button in settingsOutlets {
            button.layer.cornerRadius = 25
            button.backgroundColor = .premiumBlue
        }
        settingsBgView.infoBackgroundView_UI()
    }
    
    func setupSettingsPopupDelegate() {
        settingsPopupViewDelegate.setSettingsPopupViewDelegate(settingsPopupViewDelegate : self)
    }
    
    func presentAlertPopup() {
        // create the alert
        let alert = UIAlertController(title: "Återställer", message: "Vi har nu återställt dina köp", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Okej", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentPremiumPopup() {
        let sendToVC = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup") as! PremiumPopupView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
        //presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup", VC: self)
    }
    
    func presentTermsAndConditions() {
        openUrl(urlStr: "https://torst.flycricket.io/terms.html")
    }
    
    func presentPrivacyPolicy() {
        openUrl(urlStr: "https://torst.flycricket.io/privacy.html")
    }
    
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    
    @IBAction func settingsBtnAction(_ sender: UIButton) {
        settingsPopupViewDelegate.settingsBtnActions(senderTag: sender.tag)
    }
    
    @IBAction func dismissPopupBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
