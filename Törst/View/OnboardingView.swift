//
//  OnboardingView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-08-07.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class OnboardingView: UIViewController {

    @IBOutlet weak var okayOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardingUI()
    }
    
    func onBoardingUI() {
        okayOutlet.layer.cornerRadius = okayOutlet.frame.height/2
        okayOutlet.layer.masksToBounds = true
        okayOutlet.layer.borderWidth = 2
        okayOutlet.layer.borderColor = UIColor.white.cgColor
        
    }
    
    @IBAction func okayBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
