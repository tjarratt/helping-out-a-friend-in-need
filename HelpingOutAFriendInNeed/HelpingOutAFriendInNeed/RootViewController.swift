//
//  RootViewController.swift
//  HelpingOutAFriendInNeed
//
//  Created by Tim Jarratt on 2/3/18.
//  Copyright © 2018 General Linear Group. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController, UISearchResultsUpdating {

    var resultSearchController: UISearchController!

    override init(style: UITableViewStyle) {
        super.init(style: style)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "my-reuse-id")

        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.placeholder = "Type to search"
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
    }

    // MARK: TableViewDatasource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my-reuse-id", for: indexPath)

        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "tap me and I explode"
        case 1:
            cell.textLabel?.text = "tap me for enlightenment"
        default:
            cell.textLabel?.text = "This case doesn't exist ¯\\_(ツ)_/¯"
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // MARK : UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let controllerToPresent = UIViewController()
            self.resultSearchController.present(controllerToPresent, animated: true) {
                NSLog("The app has probably ALREADY blown up...")
            }
        case 1:
            let controllerToPresent = UIViewController()
            self.present(controllerToPresent, animated: true) {
                NSLog("The app should not have blown up!")
            }
        default:
            NSLog("well this is embarassing")
        }
    }

    // MARK: Search Results
    func updateSearchResults(for searchController: UISearchController) {

    }
}

