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

    private(set) var activeButton: TimerButton = .start
    private(set) var isFinished = false

    private var bodyMass: Double = 0.0
    private var timer: ActivityTimer?
    private(set) var progress = ActivityProgress()
    private(set) var stats = ActivityStats()
    private(set) var currentInterval = CurrentInterval(0, 0)
    private(set) var day = Day()

    // MARK: - Initializers

    public init() {
        timer = ActivityTimer(onTick: self.onReceive)
    }

    // MARK: - Functions

    func onAppear(day: Day, bodyMass: Double) {
        activeButton = .start
        timer?.stop()
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
        timer?.stop()
        locationTracker.stopUpdatingLocation()
        locationTracker.clear()
    }

    func startPressed() {
        timer?.start()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    func pausePressed() {
        timer?.stop()
        activeButton = .resume
        locationTracker.stopUpdatingLocation()
    }

    func resumePressed() {
        timer?.start()
        activeButton = .pause
        locationTracker.startUpdatingLocation()
    }

    func onReceive() {
        if progress.intervalTimeRemaining == 3 {
            player.play(.countdown)
        }

        if progress.intervalTimeRemaining < 1 {
            timer?.stop()
            currentInterval.next()

            if currentInterval.isLast() {
                handleLastIntervalCompletion()
            } else {
                handleNextIntervalContinuation()
            }
        } else {
            progress.update()
        }
    }

    private func handleLastIntervalCompletion() {
        updateStats()
        activeButton = .start
        currentInterval.reset()
        progress.set(day.intervals[currentInterval.get()].seconds, day.totalTime())
        isFinished = true
        locationTracker.stopUpdatingLocation()
        saveStats()
    }

    private func handleNextIntervalContinuation() {
        player.play(.complete)
        progress.setIntervalTime(day.intervals[currentInterval.get()].seconds)
        timer?.start()
    }

    func intervalType() -> IntervalType {
        day.intervalType(currentInterval.get())
    }

    private func saveStats() {
        day.finished = true
        day.distance = stats.distanceKilometers
        day.calories = stats.calories
        day.pace = stats.paceFormatted
        service.save()
    }

    private func updateStats() {
        stats.setDistanceKilometersFormatted(locationTracker.distanceKilometers)
        stats.setCalories(locationTracker.distanceKilometers, bodyMass)

        if locationTracker.distanceKilometers > 0 {
            stats.setPace(progress.totalTimeElapsed, locationTracker.distanceKilometers)
        }
    }
}
