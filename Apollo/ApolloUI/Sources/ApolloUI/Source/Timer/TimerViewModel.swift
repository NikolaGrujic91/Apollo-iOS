//
//  TimerViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 18/02/2023.
//

import ApolloAudio
import ApolloData
import ApolloLocation
import ApolloWeight
import Foundation

enum TimerButton {
    case start
    case pause
    case resume
}

final class TimerViewModel: ObservableObject, PlansRepositoryInjected, WeightRepositoryInjected, LocationTrackerInjected, AudioPlayerInjected {
    @Published private(set) var timeRemaining = 0
    @Published private(set) var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published private(set) var activeButton: TimerButton = .start
    public private(set) var currentInterval = 0
    public private(set) var totalIntervals: Int = 0
    public private(set) var day = Day()

    func onAppear(day: Day) {
        activeButton = .start
        stopTimer()
        locationTracker.requestAuthorization()

        self.day = day
        totalIntervals = day.intervals.count

        if !day.intervals.isEmpty {
            timeRemaining = day.intervals[currentInterval].seconds
        }
    }

    func onDissapear() {
        stopTimer()
        locationTracker.stopUpdatingLocation()
        locationTracker.clear()
    }

    func cancelPressed() {
        stopTimer()
        activeButton = .start
        currentInterval = 0
        if !day.intervals.isEmpty {
            timeRemaining = day.intervals[currentInterval].seconds
        }
        locationTracker.stopUpdatingLocation()
    }

    func startPressed() {
        startTimer()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    func pausePressed() {
        stopTimer()
        activeButton = .resume
        locationTracker.stopUpdatingLocation()
    }

    func resumePressed() {
        startTimer()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }

    func stopTimer() {
        timer.upstream.connect().cancel()
    }

    func update() {
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
                day.distance = Int(locationTracker.calculateDistance())
                day.calories = Int(Double(day.distance) / 1000.0 * weightRepository.bodyMass * 1.036)
                plansRepository.save()

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
        currentInterval >= totalIntervals
    }

    func progress() -> Double {
        if day.intervals.isEmpty {
            return 1.0
        }

        return ((Double(timeRemaining) * 100.0) / Double(day.intervals[currentInterval].seconds)) / 100.0
    }

    func intervalType() -> String {
        if day.intervals.isEmpty {
            return ""
        }

        return day.intervals[currentInterval].type
    }
}
