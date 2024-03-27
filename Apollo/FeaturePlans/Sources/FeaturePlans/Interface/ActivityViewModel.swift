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

    private(set) var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private(set) var activeButton: TimerButton = .start
    private(set) var isFinished = false

    private var bodyMass: Double = 0.0
    private(set) var progress = ActivityProgress()
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
        isFinished = false

        if !day.intervals.isEmpty {
            progress.set(day.intervals[currentInterval.get()].seconds, day.totalTime())
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
        if progress.intervalTimeRemaining == 3 {
            player.play(.countdown)
        }

        if progress.intervalTimeRemaining < 1 {
            stopTimer()
            currentInterval.next()

            if currentInterval.isLast() {
                update()
                activeButton = .start
                currentInterval.reset()
                progress.set(day.intervals[currentInterval.get()].seconds, day.totalTime())
                isFinished = true
                locationTracker.stopUpdatingLocation()

                save()
                return
            }

            player.play(.complete)
            progress.setIntervalTime(day.intervals[currentInterval.get()].seconds)
            startTimer()
        } else {
            progress.update()
        }
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
            stats.setPace(progress.totalTimeElapsed, locationTracker.distanceKilometers)
        }
    }
}
