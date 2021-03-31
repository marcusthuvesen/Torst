//
//  RateUsPopUpView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2021-03-31.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class RateUsPopUpView: UIViewController {
    
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var sendFeedbackOutlet: UIButton!
    @IBOutlet var starsOutletCollection: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopupUI()
        sortOutlets()
    }
    
    func sortOutlets() {
        starsOutletCollection.sort { $0.tag < $1.tag }
    }
    
    func setupPopupUI() {
        popupView.layer.cornerRadius = 25
        sendFeedbackOutlet.layer.cornerRadius = sendFeedbackOutlet.frame.height / 2
    }
    
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendFeedbackClicked(_ sender: UIButton) {
        if starsOutletCollection[4].image(for: .normal) == UIImage(named: "fullStar") {
            SKStoreReviewController.requestReview()
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func starsClicked(_ sender: UIButton) {
        
        print(sender.tag)
        
        for i in 0 ... starsOutletCollection.count-1 {
            starsOutletCollection[i].setImage(UIImage.init(named: "emptyStar"), for: .normal)
            
        }
        
        for i in 0 ... sender.tag {
            starsOutletCollection[i].setImage(UIImage.init(named: "fullStar"), for: .normal)
            
        }
       
    }
    
    
    
    
    
}


