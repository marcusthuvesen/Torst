//
//  View_UI.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-22.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func topCutView_UI() {
       self.layer.cornerRadius = 75
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func infoBackgroundView_UI() {
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
    
    func infoImgBgImage_UI() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.layer.masksToBounds = true
    }
    
    
}
