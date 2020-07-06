//
//  PremiumPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-14.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumPopupView: UIViewController, PremiumPopupViewDelegate{
    
    
    @IBOutlet var continueToPaymentOutlet: [UIButton]!
    @IBOutlet weak var topViewCut: UIView!
    
    let premiumPopupViewDelegate = PremiumPopupPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPopupUI()
        setupPremiumPopupDelegate()
    }
    
    func setupPremiumPopupDelegate() {
        premiumPopupViewDelegate.setPremiumPopupViewDelegate(premiumPopupViewDelegate : self)
    }
    
    func setupPopupUI() {
        for button in continueToPaymentOutlet {
            button.premiumContinueBtn_UI()
        }
        topViewCut.topCutView_UI()
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
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func partialAccessClicked(_ sender: Any) {
        presentPopup(UIStoryboardName: "PremiumCategorySelection", WithIdentifier: "PremiumCategorySelection", VC: self)
    }
    
    @IBAction func termsConditionsClicked(_ sender: Any) {
        presentTermsAndConditions()
    }
    
    @IBAction func privacyPolicyClicked(_ sender: Any) {
        presentPrivacyPolicy()
    }
    
    @IBAction func restorePurchasesClicked(_ sender: Any) {
        IAPService.shared.restorePurchases()
        presentAlertPopup()
    }
    
    func presentAlertPopup() {
               let alert = UIAlertController(title: "Återställer", message: "Vi har nu återställt dina köp", preferredStyle: UIAlertController.Style.alert)

               alert.addAction(UIAlertAction(title: "Okej", style: UIAlertAction.Style.default, handler: nil))

               self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func fullAccessClicked(_ sender: Any) {
        premiumPopupViewDelegate.fullAccessClickedActions()
    }
    
}
