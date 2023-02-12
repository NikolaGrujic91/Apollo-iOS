//
//  Plan.swift
//  ApolloData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public class Plan: Codable, Identifiable {
    public let id = UUID()
    public var name: String = ""
    public var days: [Day] = []

    private enum CodingKeys: CodingKey {
        case name
        case days
    }
}
