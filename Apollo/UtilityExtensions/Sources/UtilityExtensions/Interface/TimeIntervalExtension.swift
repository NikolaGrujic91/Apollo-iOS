//
//  TimeIntervalExtension.swift
//  UtilityExtensions
//
//  Created by Nikola Grujic on 14/03/2023.
//

import Foundation

public extension TimeInterval {
    func format() -> String {
        let hours = Int(self) / 3600
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60

        if hours == 0 {
            return String(format: "%02i:%02i", minutes, seconds)
        } else {
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
    }
}
