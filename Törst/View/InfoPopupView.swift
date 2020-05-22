//
//  InfoPopupView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-19.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

class InfoPopupView: UIViewController {

    @IBOutlet weak var infoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupPopupUI()
    }
    
    func setupPopupUI() {
        infoImage.infoImage_UI()
    }
    
    @IBAction func closePopupAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
