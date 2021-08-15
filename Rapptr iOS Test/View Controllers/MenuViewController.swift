//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var animationButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coding Tasks"
        setupUI()
    }
    
    // MARK: - Actions
    @IBAction func didPressChatButton(_ sender: Any) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
    
    // MARK: - Functions
    private func setupUI() {
        let cRadius: CGFloat = 8.0
        chatButton.layer.cornerRadius = cRadius
        loginButton.layer.cornerRadius = cRadius
        animationButton.layer.cornerRadius = cRadius
        
        chatButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        chatButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 38, bottom: 0, right: 0)
        
        loginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        loginButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 38, bottom: 0, right: 0)
        
        animationButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        animationButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 38, bottom: 0, right: 0)
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "HeaderColor")
        navigationController?.navigationBar.tintColor = UIColor.white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
    }
}
