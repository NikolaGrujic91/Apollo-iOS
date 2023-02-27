//
//  TimerView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import ApolloData
import ApolloLocalization
import ApolloTheme
import SwiftUI

struct TimerView: View {
    @EnvironmentObject private var localization: LocalizationManager
    @EnvironmentObject private var viewModel: TimerViewModel
    var day: Day

    var body: some View {
        VStack {
            InfoView(
                pace: viewModel.paceFormatted,
                distance: viewModel.distanceFormatted
            )
            .frame(maxHeight: 70)
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
                    viewModel.onReceive()
                }
            }
            HStack(spacing: 30) {
                CircleButton(
                    action: viewModel.cancelPressed,
                    text: "cancel".localized(localization.language)
                )
                if viewModel.activeButton == .start {
                    CircleButton(
                        action: viewModel.startPressed,
                        text: "start".localized(localization.language)
                    )
                } else if viewModel.activeButton == .pause {
                    CircleButton(
                        action: viewModel.pausePressed,
                        text: "pause".localized(localization.language)
                    )
                } else if viewModel.activeButton == .resume {
                    CircleButton(
                        action: viewModel.resumePressed,
                        text: "resume".localized(localization.language)
                    )
                }
            }
        }
        .navigationTitle(viewModel.day.name)
        .onAppear {
            viewModel.onAppear(day: day)

            // Prevent screen lock only for timer
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            viewModel.onDissapear()
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(day: previewDay())
            .environmentObject(LocalizationManager())
            .environmentObject(ThemeManager())
            .environmentObject(TimerViewModel())
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
