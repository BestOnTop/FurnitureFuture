//
//  LoginViewController.swift
//  FurnitureFuture
//
//  Created by Wojtek on 17/07/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SCLAlertView

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate, UITextFieldDelegate {
    // ViewModel Class
    let loginCreateViewModel = LoginCreateViewModel()
    
    
    
    
    
    //Outlets
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var facebookButton: FBSDKLoginButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mailTextField.delegate = self
        passwordTextField.delegate = self
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dissmisKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        facebookButton.readPermissions = ["public_profile", "email"]
        facebookButton.delegate = self
        // Do any additional setup after loading the view.
    }
    
// Actions
    
    @IBAction func backButton(_ sender: Any) {
        loginCreateViewModel.viewControllerDismissing(vc: self)
    }
    
    
    // Login Buttons
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            SCLAlertView().showError("ERROR!", subTitle: error.localizedDescription)
        } else if result.isCancelled {
        } else {
            SCLAlertView().showSuccess("Success!", subTitle: "You Are Successfully Loged in!")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
    
    
    // hide Keyboard 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    @objc func dissmisKeyboard() {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}
