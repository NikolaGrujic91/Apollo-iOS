//
//  TimerText.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI
import UtilityExtensions

struct TimerText: View {
    // MARK: - Properties

    let timeInterval: TimeInterval
    let color: Color
    let intervalType: String
    let currentInterval: Int
    let totalIntervals: Int
    let fontSize: CGFloat

    // MARK: - Body

    var body: some View {
        VStack(spacing: 10) {
            Text(timeInterval.format())
                .font(.system(size: fontSize))
                .fontWeight(.bold)
            Text(intervalType)
                .font(.system(size: fontSize / 2))
                .fontWeight(.bold)
                .foregroundColor(color)
        }
    }
}

// MARK: - Preview

#Preview {
    TimerText(
        timeInterval: TimeInterval(90), // 90 seconds
        color: .orange,
        intervalType: "run",
        currentInterval: 1,
        totalIntervals: 10,
        fontSize: 100
    )
}
