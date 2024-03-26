//
//  ActivityViewModel.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 18/02/2023.
//

import Foundation
import FoundationAudio
import FoundationLocation
import Observation

enum TimerButton {
    case start
    case pause
    case resume
}

@Observable
@MainActor
public final class ActivityViewModel: PlansServiceInjected, LocationTrackerInjected, AudioPlayerInjected {
    // MARK: - Properties

    private(set) var timeRemaining = 0
    private(set) var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private(set) var activeButton: TimerButton = .start
    private(set) var distanceFormatted: String = "0.00"
    private(set) var paceFormatted: String = "00:00"
    private(set) var isFinished = false

    private var timeElapsed = 0
    private var totalTime = 0
    private var totalTimeRemaining = 0
    private var pace: Double = 0.0
    private var bodyMass: Double = 0.0
    private(set) var calories: Int = 0
    private(set) var currentInterval = 0
    private(set) var totalIntervals: Int = 0
    private(set) var day = Day()

    // MARK: - Initializers

    public init() {}

    // MARK: - Functions

    func onAppear(day: Day, bodyMass: Double) {
        activeButton = .start
        stopTimer()
        locationTracker.requestAuthorization()

        self.day = day
        totalIntervals = day.intervals.count
        currentInterval = 0
        self.bodyMass = bodyMass
        timeElapsed = 0
        distanceFormatted = "0.00"
        paceFormatted = "00:00"
        isFinished = false

        if !day.intervals.isEmpty {
            timeRemaining = day.intervals[currentInterval].seconds
            totalTime = day.totalTime()
            totalTimeRemaining = totalTime
            day.calculateFractions()
        }
    }

    func onDissapear() {
        isFinished = false
        stopTimer()
        locationTracker.stopUpdatingLocation()
        locationTracker.clear()
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

        if timeRemaining < 1 {
            stopTimer()
            currentInterval += 1

            if isLastInterval() {
                update()
                activeButton = .start
                timeElapsed = 0
                currentInterval = 0
                isFinished = true
                timeRemaining = day.intervals[currentInterval].seconds
                totalTimeRemaining = totalTime
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
            totalTimeRemaining -= 1
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

    func progressTotal() -> Double {
        if totalTime == 0 {
            return 1.0
        }

        return ((Double(totalTimeRemaining) * 100.0) / Double(totalTime)) / 100.0
    }

    func intervalType() -> IntervalType {
        day.intervalType(currentInterval)
    }

    private func save() {
        day.finished = true
        day.distance = Int(locationTracker.distanceMeters)
        day.calories = calories
        day.pace = paceFormatted
        service.save()
    }

    private func update() {
        distanceFormatted = String(format: "%.2f", locationTracker.distanceKilometers)
        calories = Int(locationTracker.distanceKilometers * bodyMass * 1.036)

        if locationTracker.distanceKilometers > 0 {
            pace = Double(timeElapsed) / locationTracker.distanceKilometers
            paceFormatted = String(format: "%02i:%02i", Int(pace) / 60 % 60, Int(pace) % 60)
        }
    }
}
