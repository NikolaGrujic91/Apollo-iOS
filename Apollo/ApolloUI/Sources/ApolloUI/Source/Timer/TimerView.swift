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
    @StateObject private var viewModel = TimerViewModel()
    var day: Day

    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(
                    lineWidth: 10,
                    progress: viewModel.progress()
                )
                TimerText(
                    timeInterval: TimeInterval(viewModel.timeRemaining),
                    intervalType: viewModel.intervalType(),
                    currentInterval: viewModel.currentInterval + 1,
                    totalIntervals: viewModel.totalIntervals,
                    fontSize: 90
                )
                .onReceive(viewModel.timer) { _ in
                    viewModel.update()
                }
            }
            HStack(spacing: 30) {
                CircleButton(
                    action: viewModel.cancelPressed,
                    text: "Cancel"
                )
                if viewModel.activeButton == .start {
                    CircleButton(
                        action: viewModel.startPressed,
                        text: "Start"
                    )
                } else if viewModel.activeButton == .pause {
                    CircleButton(
                        action: viewModel.pausePressed,
                        text: "Pause"
                    )
                } else if viewModel.activeButton == .resume {
                    CircleButton(
                        action: viewModel.resumePressed,
                        text: "Resume"
                    )
                }
            }
        }
        .navigationTitle(viewModel.day.name)
        .onAppear {
            viewModel.onAppear(day: day)
        }
        .onDisappear {
            viewModel.onDissapear()
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
        interval1.seconds = 10
        interval1.type = "Run"

        let interval2 = Interval()
        interval2.seconds = 5
        interval2.type = "Walk"

        let day = Day()
        day.name = "Preview day"
        day.distance = 5000
        day.calories = 500
        day.intervals = [interval1, interval2]

        return day
    }
}
