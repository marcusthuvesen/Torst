//
//  GameWindowView.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-11.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import UIKit


class GameWindowView: UIViewController, GameWindowViewDelegate {
    
    
    @IBOutlet weak var infoBtnOutlet: UIButton!
    @IBOutlet weak var gameTextView: UITextView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    let gameWindowViewDelegate = GameWindowPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGameWindowDelegate()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    func setupGameWindowDelegate(){
        gameWindowViewDelegate.setGameWindowViewDelegate(gameWindowViewDelegate : self)
    }
    
    func setupUI() {
        infoBtnOutlet.infoOutlet_UI()
        gameTextView.centerText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sendToOnboarding()
    }
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("250")
        textViewHeightConstraint.constant = 250
    }
    
    func sendToOnboarding() {
        let numberOfTimes = UserDefaults.standard.integer(forKey: "numberOfTimes")
        
        if numberOfTimes != 1 { return } else {
            print("print \(numberOfTimes)")
            sendToOnboardingView()
            UserDefaults.standard.set(numberOfTimes+1, forKey: "numberOfTimes")
        }
    }
    
    func sendToOnboardingView() {
        let sendToVC = UIStoryboard(name: "GameWindow", bundle: nil).instantiateViewController(withIdentifier: "OnboardingView") as! OnboardingView
        sendToVC.modalPresentationStyle = .overCurrentContext
        self.present(sendToVC, animated: true)
    }
    
    
    func changeBackgroundColor(colorString : String) {
        switch colorString {
        case "blue":
            backgroundView.backgroundColor = .jagHarAldrigBlue
        case "purple":
            backgroundView.backgroundColor = .peklekenPurple
        case "green":
            backgroundView.backgroundColor = .ryggMotRyggGreen
        case "beige":
            backgroundView.backgroundColor = .utmaningarOrange
        case "red":
            backgroundView.backgroundColor = .mixRed
        default:
            backgroundView.backgroundColor = .mixRed
        }
    }
    
    func showCategoryLabel() {
        categoryLabel.isHidden = false
    }
    
    func hideCategoryLabel() {
        categoryLabel.isHidden = true
    }
    
    func setCategoryTextOnLabel(categoryText : String) {
        categoryLabel.text = categoryText
    }
    
    func animateTextLabel() {
        UIView.animate(withDuration: 0.08, delay: 0.0, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.2, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.08, delay: 0.08, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.08, delay: 0.16, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.05, y: 1.0 )
        }, completion: nil)
        
        UIView.animate(withDuration: 0.08, delay: 0.24, options: [], animations: {
            self.gameTextView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    func changeStatementUI(statement : String) {
        gameTextView.text = statement
    }
    
    func showRulesIcon() {
        infoBtnOutlet.isHidden = false
    }
    
    func hideRulesIcon() {
        infoBtnOutlet.isHidden = true
    }
    
    func sendToPremiumPopup() {
        let sendToVC = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup") as! PremiumPopupView
        sendToVC.modalPresentationStyle = .currentContext
        self.present(sendToVC, animated: true)
    }
    
    func sendToInfoPopup() {
        presentPopup(UIStoryboardName: "InfoPopup", WithIdentifier: "InfoPopup", VC: self)
    }
    
    @IBAction func infoBtnClicked(_ sender: UIButton) {
        gameWindowViewDelegate.infoBtnActions()
    }
    
    @IBAction func previousStatement(_ sender: UIButton) {
        gameWindowViewDelegate.previousStatement()
    }
    
    @IBAction func nextStatement(_ sender: UIButton) {
        gameWindowViewDelegate.nextStatement()
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
    
}


