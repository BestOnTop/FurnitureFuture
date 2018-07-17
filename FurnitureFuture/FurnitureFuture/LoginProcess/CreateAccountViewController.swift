//
//  CreateAccountViewController.swift
//  FurnitureFuture
//
//  Created by Wojtek on 17/07/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    // ViewModel Class
    let loginCreateViewModel = LoginCreateViewModel()
    
    
    // Outlets
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        loginCreateViewModel.viewControllerDismissing(vc: self)
    }
    
    
    
    // Buttons for creating an account
    @IBAction func createAccountTapped(_ sender: Any) {
    }
    
    
    @IBAction func createByFacebookTapped(_ sender: Any) {
    }
}
