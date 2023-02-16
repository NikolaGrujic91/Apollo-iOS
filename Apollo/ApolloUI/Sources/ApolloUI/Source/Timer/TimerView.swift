//
//  TimerView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI
import ApolloData
import ApolloTheme

struct TimerView: View {
    var day: Day

    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(
                    lineWidth: 10,
                    progress: 0.25
                )
                TimerText(
                    timeInterval: TimeInterval(90),
                    intervalType: "Run",
                    currentInterval: 1,
                    totalIntervals: 10,
                    fontSize: 90
                )
            }
            HStack(spacing: 30) {
                CircleButton(
                    action: { print("Pressed1") },
                    text: "Cancel"
                )
                CircleButton(
                    action: { print("Pressed1") },
                    text: "Start" // Start, Pause, Resume
                )
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(day: previewDay())
            .environmentObject(ThemeManager())
    }

    static func previewDay() -> Day {
        let interval1 = Interval()
        interval1.seconds = 90
        interval1.type = "Run"

        let interval2 = Interval()
        interval2.seconds = 60
        interval2.type = "Walk"

        let day = Day()
        day.name = "Preview day"
        day.distance = 5000
        day.calories = 500
        day.intervals = [interval1, interval2]

        return day
    }
}
