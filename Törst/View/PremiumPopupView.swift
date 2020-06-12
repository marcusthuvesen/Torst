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
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
