//
//  LoginCreateViewModel.swift
//  FurnitureFuture
//
//  Created by Wojtek on 17/07/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit

class LoginCreateViewModel {
    // dismissing View Controller
    func viewControllerDismissing(vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
}
