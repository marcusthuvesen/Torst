//
//  Button_UI.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func infoOutlet_UI() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func homeDecisionOutlet_UI() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }
    
    func premiumContinueBtn_UI() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.white.cgColor
    }
}

extension UIView {
    func topCutView_UI() {
       self.layer.cornerRadius = 75
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}
