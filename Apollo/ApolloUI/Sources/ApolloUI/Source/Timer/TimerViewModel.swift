//
//  TimerViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 18/02/2023.
//

import Foundation
import ApolloData
import ApolloWeight
import ApolloLocation
import ApolloAudio

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

    public func onAppear(day: Day) {
        activeButton = .start
        stopTimer()
        locationTracker.requestAuthorization()

        self.day = day
        totalIntervals = day.intervals.count

        if !day.intervals.isEmpty {
            timeRemaining = day.intervals[currentInterval].seconds
        }
    }

    public func onDissapear() {
        stopTimer()
        locationTracker.stopUpdatingLocation()
        locationTracker.clear()
    }

    public func cancelPressed() {
        stopTimer()
        activeButton = .start
        currentInterval = 0
        timeRemaining = day.intervals[currentInterval].seconds
        locationTracker.stopUpdatingLocation()
    }

    public func startPressed() {
        startTimer()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    public func pausePressed() {
        stopTimer()
        activeButton = .resume
        locationTracker.stopUpdatingLocation()
    }

    public func resumePressed() {
        startTimer()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    public func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }

    public func stopTimer() {
        timer.upstream.connect().cancel()
    }

    public func update() {
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
                day.calories = Int(Double(day.distance) / 1000.0 * weightRepository.value * 1.036)
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
        return currentInterval >= totalIntervals
    }

    public func progress() -> Double {
        if day.intervals.isEmpty {
            return 1.0
        }

        return ((Double(timeRemaining) * 100.0) / Double(day.intervals[currentInterval].seconds)) / 100.0
    }

    public func intervalType() -> String {
        if day.intervals.isEmpty {
            return ""
        }

        return day.intervals[currentInterval].type
    }
}
