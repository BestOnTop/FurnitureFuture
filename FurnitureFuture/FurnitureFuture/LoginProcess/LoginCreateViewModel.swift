//
//  LoginCreateViewModel.swift
//  FurnitureFuture
//
//  Created by Wojtek on 17/07/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit
import SCLAlertView

class LoginCreateViewModel {
    // dismissing View Controller
    func viewControllerDismissing(vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
    
    
    
    // create account Frebase
    func createByFirebase( mail: String, password: String, repassword: String, vc: UIViewController) {
        if password == repassword {
            
            Auth.auth().createUser(withEmail: mail, password: password) { (user, error) in
                
                if error != nil {
                    _ = SCLAlertView().showError("Error!", subTitle:"\(String(describing: error!.localizedDescription))", closeButtonTitle:"OK")
                } else {
                    let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
                    let alert = SCLAlertView(appearance: appearance)
                    
                    _ = alert.addButton("Yes") {
                        vc.performSegue(withIdentifier: "SignUp", sender: nil)
                    }
                    _ = alert.addButton("No") {
                        vc.performSegue(withIdentifier: "SignUp", sender: nil)
                    }
                    
                    alert.showSuccess("Congratulations!", subTitle: "Your Profile is Done! \n Would you like to stay loged in?")
                    
                }
            }
            
        } else {
            _ = SCLAlertView().showError("Error!", subTitle: "the passwords have to be the same!", closeButtonTitle:"OK")
        }
    }
    
    // Log in by Firebase
    
    func logInByFirebase(mail: String, password: String, vc: UIViewController) {
        
        Auth.auth().signIn(withEmail: mail, password: password) { (user, error) in
            if error != nil {
                _ = SCLAlertView().showError("Error!", subTitle:"\(error!.localizedDescription)", closeButtonTitle:"OK")
            } else {
                    vc.performSegue(withIdentifier: "LogIn", sender: nil)
            }
        }
    }
}
