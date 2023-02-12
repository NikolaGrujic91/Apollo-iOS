//
//  Day.swift
//  ApolloData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public class Day: Codable, Identifiable {
    public let id = UUID()
    public var name: String = ""
    public var calories: Int = 0
    public var distance: Int = 0
    public var intervals: [Interval] = []

    private enum CodingKeys: CodingKey {
        case name
        case calories
        case distance
        case intervals
    }
}
