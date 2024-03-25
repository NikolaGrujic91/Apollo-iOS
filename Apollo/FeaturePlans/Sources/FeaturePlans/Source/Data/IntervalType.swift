//
//  IntervalType.swift
//  FoundationData
//
//  Created by Nikola Grujic on 08/03/2023.
//

import SwiftUI

public enum IntervalType: String, CaseIterable, Codable {
    case run
    case walk
    case fastRun
    case fastWalk
}

public extension IntervalType {
    func color() -> Color {
        switch self {
        case .run:
            Color.orange.opacity(0.4)
        case .walk:
            Color.gray.opacity(0.4)
        case .fastRun:
            Color.red.opacity(0.8)
        case .fastWalk:
            Color.gray.opacity(0.8)
        }
    }
}
