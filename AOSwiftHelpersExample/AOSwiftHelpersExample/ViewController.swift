//
//  ViewController.swift
//  AOSwiftHelpersExample
//
//  Created by Alexander Orlov on 06.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit
import AOSwiftHelpers

class ViewController: UIViewController {
    
    private var cellID = "cellID"
    
    var tableView: UITableView!
    
    var tableData: NSArray = ["Logger test", "Setup view test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AOSwiftHelpers.helper.setupNavigation(navigationCtrl: self.navigationController, navigationItem: self.navigationItem, navigationTitle: "AOSwiftHelpersExample", hideBackButton: true, leftButton: nil, rightButton: nil)
        self.tableView = UITableView(frame: self.view.frame, style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ViewControllerTableCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(self.tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ViewControllerTableCell
        cell.updateCell(title: tableData[indexPath.row] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableData[indexPath.row] as! String) == "Logger test" {
            AOSwiftHelpers.logger.AOLog("This is test log! project in debug")
        } else if (tableData[indexPath.row] as! String) == "Setup view test" {
            self.navigationController?.pushViewController(ViewsExampleController(), animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
