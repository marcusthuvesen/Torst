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
    @IBOutlet weak var gameTextView: UITextView!
    
    public static var gameTextArray = [""]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //print(GameWindowView.gameTextArray)
    }
    
   
    
    func setupUI() {
        infoBtnOutlet.infoOutlet_UI()
        gameTextView.text = GameWindowView.gameTextArray[0]
    }
    
    
    

}
