//
//  DayCell.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!

    // MARK: - Initializers

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setRespondToUserSettingsChanges()
    }

    // MARK: - Helper methods

    private func setRespondToUserSettingsChanges() {
        self.nameLabel.adjustsFontForContentSizeCategory = true
        self.caloriesLabel.adjustsFontForContentSizeCategory = true
        self.distanceLabel.adjustsFontForContentSizeCategory = true
    }
}
