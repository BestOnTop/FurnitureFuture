//
//  CreateAccountViewController.swift
//  FurnitureFuture
//
//  Created by Wojtek on 17/07/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SCLAlertView
import FirebaseAuth

class CreateAccountViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate {
    
    // ViewModel Class
    let loginCreateViewModel = LoginCreateViewModel()
    
    
    // Outlets
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var facebookButton: FBSDKLoginButton!
    
    
    // Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dissmisKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        facebookButton.readPermissions = ["public_profile", "email"]
        facebookButton.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        loginCreateViewModel.viewControllerDismissing(vc: self)
    }
    
    
    
    // Buttons for creating an account
    @IBAction func createAccountTapped(_ sender: Any) {
        loginCreateViewModel.createByFirebase(mail: mailTextField.text!, password: passwordTextField.text!, repassword: repeatPasswordTextField.text!, vc: self)
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            SCLAlertView().showError("ERROR!", subTitle: error.localizedDescription)
        } else if result.isCancelled {
        } else {
            let credentials = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            Auth.auth().signInAndRetrieveData(with: credentials) { (authResult, error) in
                if let error = error {
                    SCLAlertView().showError("ERROR!", subTitle: error.localizedDescription)
                } else {
                     self.performSegue(withIdentifier: "SignUp", sender: nil)
                }
            }
           
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    // hide Keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
        return true
    }
    
    @objc func dissmisKeyboard() {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
}
