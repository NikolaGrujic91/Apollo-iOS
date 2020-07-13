//
//  DaysViewController.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class DaysViewController: UITableViewController
{
    var plan: Plan!
    {
        didSet
        {
            self.setNavigationItem(self.plan.name);
        }
    };
    var locationController: LocationController!;
    
    let baseRed: CGFloat = 255.0;
    let baseGreen: CGFloat = 175.0;
    let baseBlue: CGFloat = 122.0;
    
    let rowHeight: CGFloat = 80;
    
    // MARK: - View life cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.setDynamicCellHeight();
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated);
        self.tableView.reloadData();
    }
    
    // Notifies the view controller that a segue is about to be performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier
        {
            case "showIntervals"?:
                if let row = self.tableView.indexPathForSelectedRow?.row
                {
                    let day = self.plan.days[row];
                    let intervalsViewController = segue.destination as! IntervalsViewController;
                    intervalsViewController.day = day;
                    intervalsViewController.locationController = self.locationController;
                }
            default:
                preconditionFailure("Unexpected segue identifier.");
        }
    }
    
    // MARK: - Helper methods
    
    private func setDynamicCellHeight() -> Void
    {
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.estimatedRowHeight = 65;
    }
    
    private func getStatusBarHeight() -> CGFloat
    {
        var statusBarHeight: CGFloat;
        
        if #available(iOS 13.0, *)
        {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first;
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0;
        }
        else
        {
            statusBarHeight = UIApplication.shared.statusBarFrame.height;
        }
        
        return statusBarHeight;
    }
    
    private func setNavigationItem(_ title: String) -> Void
    {
        self.navigationItem.title = title;
    }
    
    // MARK: - UITableViewDataSource methods
    
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.plan.days.count;
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let index = indexPath.row;
        let day = self.plan.days[index];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell;
        cell.nameLabel.text = day.name;
        cell.caloriesLabel.text = "Calories: \(day.calories) kcal";
        cell.distanceLabel.text = "Distance: \(day.distance) m";
        
        let green: CGFloat = self.baseGreen - CGFloat(index * 3);
        let blue: CGFloat = self.baseBlue - CGFloat(index * 6);
        cell.backgroundColor = UIColor.init(red: (baseRed / 255.0), green: (green / 255.0), blue: (blue / 255.0), alpha: 0.8);
           
        return cell;
    }
    
    // Asks the delegate for the height to use for a row in a specified location.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return self.rowHeight;
    }
}
