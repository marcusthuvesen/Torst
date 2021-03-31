//
//  SettingsPopupPresenter.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-06-09.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//
import Foundation
import UIKit

protocol SettingsPopupViewDelegate : NSObjectProtocol{
    func presentTermsAndConditions()
    func presentPrivacyPolicy()
    func presentPremiumPopup()
    func presentAlertPopup()
}

class SettingsPopupPresenter{
    weak private var settingsPopupViewDelegate : SettingsPopupViewDelegate?
    let provideGameTexts = ProvideGameTexts()
    
    func setSettingsPopupViewDelegate(settingsPopupViewDelegate : SettingsPopupViewDelegate){
        self.settingsPopupViewDelegate = settingsPopupViewDelegate
    }
    
    func settingsBtnActions(senderTag: Int) {
        switch senderTag {
        case 0:
            settingsPopupViewDelegate?.presentTermsAndConditions()
        case 1:
            settingsPopupViewDelegate?.presentPrivacyPolicy()
        case 2:
            IAPService.shared.restorePurchases()
            settingsPopupViewDelegate?.presentAlertPopup()
        case 3:
            settingsPopupViewDelegate?.presentPremiumPopup()
        default:
          print("0")
          settingsPopupViewDelegate?.presentPrivacyPolicy()
        }
    }
}
