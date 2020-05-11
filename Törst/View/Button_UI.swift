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
}
