//
//  ItemsViewController.swift
//  FurnitureFuture
//
//  Created by Wojtek on 21/08/2018.
//  Copyright © 2018 Wojtek. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class ItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // Variables
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.35)
        
        tableViewData = [cellData(opened: false, title: "Living Room", sectionData: ["Cell1", "Cell2", "Cell3"]),
        cellData(opened: false, title: "Kitchen", sectionData: ["Cell1", "Cell2", "Cell3"]),
        cellData(opened: false, title: "Bed Room", sectionData: ["Cell1", "Cell2", "Cell3"]),
        cellData(opened: false, title: "Child Romm", sectionData: ["Cell1", "Cell2", "Cell3"]),
        cellData(opened: false, title: "Toilet", sectionData: ["Cell1", "Cell2", "Cell3"]),
        cellData(opened: false, title: "Hall", sectionData: ["Cell1", "Cell2", "Cell3"]),
        cellData(opened: false, title: "Office", sectionData: ["Cell1", "Cell2", "Cell3"])]

        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.35)
            cell.textLabel?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.35)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.35)
            cell.textLabel?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.35)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .right)
        } else {
            tableViewData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .left)
        }
    }
}
