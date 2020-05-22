//
//  OpenNewView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-13.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

func presentPopup(UIStoryboardName : String, WithIdentifier : String, VC: UIViewController?){
    if VC != nil{
        if UIStoryboardName == "GameWindow" {
            let sendToVC = UIStoryboard(name: UIStoryboardName, bundle: nil).instantiateViewController(withIdentifier: WithIdentifier) as! GameWindowView
            sendToVC.modalPresentationStyle = .overCurrentContext
            VC!.present(sendToVC, animated: true)
        }
        if UIStoryboardName == "PremiumPopup" {
            let sendToVC = UIStoryboard(name: UIStoryboardName, bundle: nil).instantiateViewController(withIdentifier: WithIdentifier) as! PremiumPopupView
            sendToVC.modalPresentationStyle = .overCurrentContext
            VC!.present(sendToVC, animated: true)
        }
        if UIStoryboardName == "InfoPopup" {
            let sendToVC = UIStoryboard(name: UIStoryboardName, bundle: nil).instantiateViewController(withIdentifier: WithIdentifier) as! InfoPopupView
            sendToVC.modalPresentationStyle = .overCurrentContext
            VC!.present(sendToVC, animated: true)
        }
        
    }
    
}
