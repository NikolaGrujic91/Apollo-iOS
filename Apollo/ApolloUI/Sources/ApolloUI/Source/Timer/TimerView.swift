//
//  TimerView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI
import ApolloData
import ApolloTheme
import ApolloWeight
import ApolloLocation
import ApolloAudio

enum TimerButton {
    case start
    case pause
    case resume
}

struct TimerView: View, WeightRepositoryInjected, LocationTrackerInjected, AudioPlayerInjected {
    var day: Day
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 0
    @State private var currentInterval = 0
    @State private var activeButton: TimerButton = .start
    private var totalIntervals: Int

    public init(day: Day) {
        self.day = day
        totalIntervals = day.intervals.count
    }

    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(
                    lineWidth: 10,
                    progress: 1.0
                )
                TimerText(
                    timeInterval: TimeInterval(timeRemaining),
                    intervalType: day.intervals[currentInterval].type,
                    currentInterval: currentInterval + 1,
                    totalIntervals: totalIntervals,
                    fontSize: 90
                )
                .onReceive(timer) { _ in
                    update()
                }
            }
            HStack(spacing: 30) {
                CircleButton(
                    action: cancelPressed,
                    text: "Cancel"
                )
                if activeButton == .start {
                    CircleButton(
                        action: startPressed,
                        text: "Start"
                    )
                } else if activeButton == .pause {
                    CircleButton(
                        action: pausePressed,
                        text: "Pause"
                    )
                } else if activeButton == .resume {
                    CircleButton(
                        action: resumePressed,
                        text: "Resume"
                    )
                }
            }
        }
        .navigationTitle(day.name)
        .onAppear {
            stopTimer()
            timeRemaining = day.intervals[currentInterval].seconds
            locationTracker.requestAuthorization()
        }
        .onDisappear {
            locationTracker.stopUpdatingLocation()
            locationTracker.clear()
        }
    }

    private func cancelPressed() {
        stopTimer()
        activeButton = .start
        currentInterval = 0
        timeRemaining = day.intervals[currentInterval].seconds
        locationTracker.stopUpdatingLocation()
    }

    private func startPressed() {
        startTimer()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    private func pausePressed() {
        stopTimer()
        activeButton = .resume
        locationTracker.stopUpdatingLocation()
    }

    private func resumePressed() {
        startTimer()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    private func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }

    private func stopTimer() {
        timer.upstream.connect().cancel()
    }

    private func update() {
        if timeRemaining == 3 {
            player.play(.countdown)
        }

        if timeRemaining < 1 {
            stopTimer()
            currentInterval += 1

            if isLastInterval() {
                activeButton = .start
                currentInterval = 0
                timeRemaining = day.intervals[currentInterval].seconds

                locationTracker.stopUpdatingLocation()
                // day.distance = Int(locationTracker.calculateDistance())
                // day.calories = Int(Double(day.distance) / 1000.0 * repository.value * 1.036)
                return
            }

            player.play(.complete)
            timeRemaining = day.intervals[currentInterval].seconds
            startTimer()
        } else {
            timeRemaining -= 1
        }
    }

    private func isLastInterval() -> Bool {
        return currentInterval >= totalIntervals
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(day: previewDay())
            .environmentObject(ThemeManager())
    }

    static func previewDay() -> Day {
        let interval1 = Interval()
        interval1.seconds = 5
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
