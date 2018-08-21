//
//  MenuImageView.swift
//  FurnitureFuture
//
//  Created by Wojtek on 21/08/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit

class MenuImageView {
    func imageView(img: UIImageView) {
        img.layer.cornerRadius = 25.0
        img.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
}
