//
//  LoginViewController.swift
//  FurnitureFuture
//
//  Created by Wojtek on 17/07/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // ViewModel Class
    let loginCreateViewModel = LoginCreateViewModel()
    
    
    
    
    //Outlets
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// Actions
    
    @IBAction func backButton(_ sender: Any) {
        loginCreateViewModel.viewControllerDismissing(vc: self)
    }
    
    
    // Login Buttons
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    @IBAction func lgoinByFacebookTapped(_ sender: Any) {
    }
}
