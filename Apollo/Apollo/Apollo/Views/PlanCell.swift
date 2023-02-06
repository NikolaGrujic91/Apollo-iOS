//
//  PlanCell.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class PlanCell: UITableViewCell
{
    @IBOutlet var nameLabel: UILabel!;
    @IBOutlet var imageBackground: UIImageView!;
    
    // MARK: - Initializers
    
    override func awakeFromNib()
    {
        super.awakeFromNib();
        self.setRespondToUserSettingsChanges();
    }
    
    // MARK: - Helper methods
    
    private func setRespondToUserSettingsChanges() -> Void
    {
        self.nameLabel.adjustsFontForContentSizeCategory = true;
    }
}
