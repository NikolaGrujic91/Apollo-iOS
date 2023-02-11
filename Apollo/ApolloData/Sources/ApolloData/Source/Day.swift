//
//  Day.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

class Day: Codable {
    var name: String
    var calories: Int
    var distance: Int
    var intervals: [Interval]
}
