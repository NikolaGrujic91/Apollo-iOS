//
//  IntervalCell.swift
//  Apollo
//
//  Created by Nikola Grujic on 08/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class IntervalCell: UITableViewCell
{
    @IBOutlet var intervalLabel: UILabel!;
    @IBOutlet var runLabel: UILabel!;
    
    // MARK: - Initializers
    
    override func awakeFromNib()
    {
        super.awakeFromNib();
        self.setRespondToUserSettingsChanges();
        self.setDynamicType();
    }
    
    // MARK: - Helper methods
    
    private func setRespondToUserSettingsChanges() -> Void
    {
        self.intervalLabel.adjustsFontForContentSizeCategory = true;
        self.runLabel.adjustsFontForContentSizeCategory = true;
    }
    
    private func setDynamicType() -> Void
    {
        self.intervalLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body);
        self.runLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body);
    }
}
