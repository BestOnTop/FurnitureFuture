//
//  MainViewController.swift
//  FurnitureFuture
//
//  Created by Wojtek on 20/08/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit
import ARKit
import SCLAlertView

class MainViewController: UIViewController, ARSCNViewDelegate {

    
    // Outlets
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var constrait: NSLayoutConstraint!
    
    //Variables
    let configuration = ARWorldTrackingConfiguration()
    var selectedItem: String?
    var ifShowMenu: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Menu Configurartion
        MenuImageView().imageView(img: menuImage)
        ifShowMenu = false
        
        
        // AR Configuration
        self.sceneView.debugOptions = [ ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
        self.sceneView.delegate = self
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func menuPressed(_ sender: Any) {
        if ifShowMenu! {
            UIImageView.animate(withDuration: 3.0, animations: {
                self.constrait.constant += CGFloat(5000)
            })
            
            ifShowMenu = false
        } else {
            UIImageView.animate(withDuration: 3.0, animations: {
                self.constrait.constant -= CGFloat(5000)
            })
            ifShowMenu = true
        }
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        
    }
    
    @IBAction func addFurniturePressed(_ sender: Any) {
        if selectedItem == nil {
            SCLAlertView().showInfo("Any Item Choosen", subTitle: "Choose item to decorate your room in: Menu>Add Furniture>Items")
        } else {
            
        }
    }
}
