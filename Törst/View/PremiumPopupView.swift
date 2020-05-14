//
//  PremiumPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-14.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumPopupView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
