//
//  HomeDecisionView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeDecisionView: UIViewController, HomeDecisionViewDelegate {
    
    @IBOutlet var decisionBtnOutlets: [UIButton]!
    
    let homeDecisionViewDelegate = HomeDecisionPresenter()
    //var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeDecisionDelegate()
//        ref = Database.database().reference()
//        ref.child("users").setValue(["username": "Erik"])
    }
    
    func setupHomeDecisionDelegate(){
        homeDecisionViewDelegate.setHomeDecisionViewDelegate(homeDecisionViewDelegate : self)
    }
    
    @IBAction func decisionBtnClicked(_ sender: UIButton) {
        homeDecisionViewDelegate.decisionBtnSelected(senderTag: sender.tag)
        FetchGameTexts.init()
    }
    
}
