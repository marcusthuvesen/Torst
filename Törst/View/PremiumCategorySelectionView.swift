//
//  PremiumCategorySelectionView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-06-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumCategorySelectionView: UIViewController {

    @IBOutlet var categorySelectionOutlet: [UIButton]!
    @IBOutlet weak var categoryBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategorySelection_UI()
    }
    
    func setupCategorySelection_UI() {
        for button in categorySelectionOutlet {
            button.layer.cornerRadius = 25
        }
    }
    
    @IBAction func categoryClicked(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            IAPService.shared.purchase(product: .partialAccessJagHarAldrig)
        case 1:
            IAPService.shared.purchase(product: .partialAccessPekleken)
        case 2:
            IAPService.shared.purchase(product: .partialAccessRyggMotRygg)
        case 3:
            IAPService.shared.purchase(product: .partialAccessUtmaningar)
        default:
            return
        }
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
