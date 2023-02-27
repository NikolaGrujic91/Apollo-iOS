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
    private(set) var timeElapsed = 0
    @Published private(set) var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published private(set) var activeButton: TimerButton = .start
    @Published private(set) var distance: Int = 0
    @Published private(set) var calories: Int = 0
    @Published private(set) var pace: Double = 0.0
    public private(set) var currentInterval = 0
    public private(set) var totalIntervals: Int = 0
    public private(set) var day = Day()
    private var bodyMass: Double = 0.0

    func onAppear(day: Day) {
        activeButton = .start
        stopTimer()
        locationTracker.requestAuthorization()

        self.day = day
        totalIntervals = day.intervals.count
        currentInterval = 0
        bodyMass = weightRepository.bodyMass
        timeElapsed = 0

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
        timeElapsed = 0
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

    func onReceive() {
        if timeRemaining == 3 {
            player.play(.countdown)
        }

        if timeRemaining % 15 == 0 {
            update()
        }

        if timeRemaining < 1 {
            stopTimer()
            currentInterval += 1

            if isLastInterval() {
                activeButton = .start
                timeElapsed = 0
                currentInterval = 0
                timeRemaining = day.intervals[currentInterval].seconds
                locationTracker.stopUpdatingLocation()

                save()
                return
            }

            player.play(.complete)
            timeRemaining = day.intervals[currentInterval].seconds
            startTimer()
        } else {
            timeElapsed += 1
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

    private func save() {
        day.distance = distance
        day.calories = calories
        plansRepository.save()
    }

    private func update() {
        let doubleDistance = locationTracker.calculateDistance()
        distance = Int(doubleDistance)
        calories = Int(Double(distance) / 1000.0 * bodyMass * 1.036)
        pace = (Double(timeElapsed) / doubleDistance) / 60.0
    }
}
