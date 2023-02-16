//
//  Interval.swift
//  ApolloData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public class Interval: Codable, Identifiable {
    public let id = UUID()
    public var type: String = ""
    public var seconds: Int = 0

    public init() {}

    private enum CodingKeys: CodingKey {
        case type
        case seconds
    }
}
