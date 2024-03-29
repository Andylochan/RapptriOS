//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     * 2) Take email and password input from the user
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     * 4) Calculate how long the API call took in milliseconds
     * 5) If the response is an error display the error in a UIAlertController
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    private var client: LoginClient?
    
    // MARK: - Outlets
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        loginButton.isEnabled = false;
        loginButton.layer.opacity = 0.6
        userTextfield.addTarget(self, action:  #selector(textFieldDidChange(_:)),  for:.editingChanged )
        passwordTextfield.addTarget(self, action:  #selector(textFieldDidChange(_:)),  for:.editingChanged )
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        LoginClient.shared.login(email: userTextfield.text ?? "", password: passwordTextfield.text ?? "") { (response, message)  in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Login Complete", message: "\(message)\n Request took \(response) ms", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.navigationController?.popToRootViewController(animated: true)
                }))
                self.present(alert, animated: true)
            }
        } error: { (error) in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: (String(describing: error)), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    // MARK: - Functions
    @objc func textFieldDidChange(_ sender: UITextField) {
        if userTextfield.text == "" || passwordTextfield.text == "" {
            loginButton.isEnabled = false;
            loginButton.layer.opacity = 0.6
        } else {
            loginButton.isEnabled = true;
            loginButton.layer.opacity = 1.0
        }
    }
}
