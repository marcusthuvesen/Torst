//
//  PremiumPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-14.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumPopupView: UIViewController {

    
    @IBOutlet var continueToPaymentOutlet: [UIButton]!
    
    @IBOutlet weak var topViewCut: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupPopupUI()
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
