//
//  GameWindowView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class GameWindowView: UIViewController {
    
    @IBOutlet weak var infoBtnOutlet: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
   
    
    func setupUI() {
        infoBtnOutlet.infoOutlet_UI()
    }
    

}
