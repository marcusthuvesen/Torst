//
//  InfoPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-19.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

class InfoPopupView: UIViewController, InfoPopupViewDelegate {
    
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoBackgroundView: UIView!
    @IBOutlet weak var rulesTextView: UITextView!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var infoImgBgView: UIView!
    
    
    let infoPopupViewDelegate = InfoPopupPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopupUI()
        setupInfoPopupDelegate()
    }
    
    func setupInfoPopupDelegate(){
        infoPopupViewDelegate.setInfoPopupViewDelegate(infoPopupViewDelegate : self)
    }
    
    func setupPopupUI() {
        infoImgBgView.infoImgBgImage_UI()
        infoBackgroundView.infoBackgroundView_UI()
    }
    
    func setRulesImageToUI(rulesImgString : String) {
        infoImage.image = UIImage(named: rulesImgString)
        infoImage.contentMode = .scaleAspectFit
    }
    
    func setRulesTextToTextView(rulesText: String) {
        rulesTextView.text = rulesText
    }
    
    func setRulesLabelTextToLabel(rulesLabelText: String) {
        rulesLabel.text = rulesLabelText
    }
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}


