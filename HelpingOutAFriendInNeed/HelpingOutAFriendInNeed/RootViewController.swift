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
        cell.textLabel?.text = "tap me"

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // MARK : UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("definitely got here")
    }

    // MARK: Search Results
    func updateSearchResults(for searchController: UISearchController) {

    }
}

