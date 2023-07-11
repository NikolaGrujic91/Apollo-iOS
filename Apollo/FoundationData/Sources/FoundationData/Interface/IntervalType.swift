//
//  IntervalType.swift
//  FoundationData
//
//  Created by Nikola Grujic on 08/03/2023.
//

import Foundation
import SwiftUI

public enum IntervalType: String, CaseIterable, Codable {
    case run
    case walk
    case fastRun = "fast run"
    case fastWalk = "fast walk"
}

public extension IntervalType {
    func color() -> Color {
        switch self {
        case .run:
            return Color.orange.opacity(0.4)
        case .walk:
            return Color.gray.opacity(0.4)
        case .fastRun:
            return Color.red.opacity(0.8)
        case .fastWalk:
            return Color.gray.opacity(0.8)
        }
    }
}