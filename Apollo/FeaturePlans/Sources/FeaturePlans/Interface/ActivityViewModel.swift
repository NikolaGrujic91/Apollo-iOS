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
    private(set) var isFinished = false

    private var timeElapsed = 0
    private var totalTime = 0
    private var totalTimeRemaining = 0
    private var bodyMass: Double = 0.0
    private(set) var stats = ActivityStats()
    private(set) var currentInterval = CurrentInterval(0, 0)
    private(set) var day = Day()

    // MARK: - Initializers

    public init() {}

    // MARK: - Functions

    func onAppear(day: Day, bodyMass: Double) {
        activeButton = .start
        stopTimer()
        locationTracker.requestAuthorization()

        self.day = day
        currentInterval = CurrentInterval(0, day.intervals.count)
        self.bodyMass = bodyMass
        timeElapsed = 0
        isFinished = false

        if !day.intervals.isEmpty {
            timeRemaining = day.intervals[currentInterval.get()].seconds
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
            currentInterval.next()

            if currentInterval.isLast() {
                update()
                activeButton = .start
                timeElapsed = 0
                currentInterval.reset()
                isFinished = true
                timeRemaining = day.intervals[currentInterval.get()].seconds
                totalTimeRemaining = totalTime
                locationTracker.stopUpdatingLocation()

                save()
                return
            }

            player.play(.complete)
            timeRemaining = day.intervals[currentInterval.get()].seconds
            startTimer()
        } else {
            timeElapsed += 1
            timeRemaining -= 1
            totalTimeRemaining -= 1
        }
    }

    func progress() -> Double {
        if day.intervals.isEmpty {
            return 1.0
        }

        return ((Double(timeRemaining) * 100.0) / Double(day.intervals[currentInterval.get()].seconds)) / 100.0
    }

    func progressTotal() -> Double {
        if totalTime == 0 {
            return 1.0
        }

        return ((Double(totalTimeRemaining) * 100.0) / Double(totalTime)) / 100.0
    }

    func intervalType() -> IntervalType {
        day.intervalType(currentInterval.get())
    }

    private func save() {
        day.finished = true
        #warning("convert distance to string type and store stats.distanceKilometers")
        day.distance = Int(locationTracker.distanceMeters)
        day.calories = stats.calories
        day.pace = stats.paceFormatted
        service.save()
    }

    private func update() {
        stats.setDistanceKilometersFormatted(locationTracker.distanceKilometers)
        stats.setCalories(locationTracker.distanceKilometers, bodyMass)

        if locationTracker.distanceKilometers > 0 {
            stats.setPace(timeElapsed, locationTracker.distanceKilometers)
        }
    }
}
