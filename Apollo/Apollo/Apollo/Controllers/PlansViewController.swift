//
//  PlansViewController.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit
import ApolloData

class PlansViewController: UITableViewController, PlansRepositoryInjected {
    let rowHeight: CGFloat = 120

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDynamicCellHeight()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // Notifies the view controller that a segue is about to be performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.setBackButton()

        switch segue.identifier {
        case "showPlan"?:
            if let row = self.tableView.indexPathForSelectedRow?.row {
                let plan = repository.plans[row]
                let daysViewController = segue.destination as! DaysViewController
                daysViewController.plan = plan
            }
        case "enterWeight"?:
            let weightViewController = segue.destination as! WeightViewController
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

    // MARK: - Helper methods

    private func setDynamicCellHeight() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 120
    }

    private func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat

        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

    private func getImage(index: Int) -> UIImage {
        switch index {
        case 0: return UIImage(named: "Plan1")!
        case 1: return UIImage(named: "Plan2")!
        case 3: return UIImage(named: "Plan3")!
        case 4: return UIImage(named: "Plan4")!
        case 5: return UIImage(named: "Plan5")!
        case 6: return UIImage(named: "Plan6")!
        default: return UIImage(named: "Plan1")!
        }
    }

    private func setBackButton() {
        let backItem = UIBarButtonItem()
        backItem.title = "Home"
        self.navigationItem.backBarButtonItem = backItem
    }

    // MARK: - UITableViewDataSource methods

    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.plans.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath) as! PlanCell

        let index = indexPath.row
        let plan = repository.plans[index]

        cell.nameLabel.text = plan.name
        cell.imageBackground.image = self.getImage(index: index)

        return cell
    }

    // Asks the delegate for the height to use for a row in a specified location.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.rowHeight
    }
}
