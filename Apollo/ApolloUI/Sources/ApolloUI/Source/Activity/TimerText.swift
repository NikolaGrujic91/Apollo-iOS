//
//  TimerText.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct TimerText: View {
    let timeInterval: TimeInterval
    let intervalType: String
    let currentInterval: Int
    let totalIntervals: Int
    let fontSize: CGFloat

    var body: some View {
        VStack(spacing: 10) {
            Text(formatTimeString(time: timeInterval))
                .font(.system(size: fontSize))
                .fontWeight(.bold)
            Text(intervalType)
                .font(.system(size: fontSize / 2))
                .fontWeight(.bold)
            Text("\(currentInterval) \\ \(totalIntervals)")
                .font(.system(size: fontSize / 2))
                .fontWeight(.bold)
        }
    }

    private func formatTimeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60

        if hours == 0 {
            return String(format: "%02i:%02i", minutes, seconds)
        } else {
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
    }
}

struct TimerTextView_Previews: PreviewProvider {
    static var previews: some View {
        TimerText(
            timeInterval: TimeInterval(90), // 90 seconds
            intervalType: "Run",
            currentInterval: 1,
            totalIntervals: 10,
            fontSize: 100
        )
    }
}
