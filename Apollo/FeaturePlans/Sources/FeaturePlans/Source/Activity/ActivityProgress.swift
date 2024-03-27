//
//  ActivityProgress.swift
//  
//
//  Created by Nikola Grujic on 27/03/2024.
//

import Observation

@Observable
@MainActor
final class ActivityProgress {
    private var intervalTime = 0
    private(set) var intervalTimeRemaining = 0
    private var totalTime = 0
    private(set) var totalTimeElapsed = 0
    private var totalTimeRemaining = 0

    func set(_ intervalTime: Int, _ totalTime: Int) {
        setIntervalTime(intervalTime)
        self.totalTime = totalTime
        totalTimeRemaining = self.totalTime
        totalTimeElapsed = 0
    }

    func setIntervalTime(_ intervalTime: Int) {
        self.intervalTime = intervalTime
        intervalTimeRemaining = self.intervalTime
    }

    func update() {
        if isFinished() {
            return
        }

        totalTimeElapsed += 1
        intervalTimeRemaining -= 1
        totalTimeRemaining -= 1
    }

    func progressInterval() -> Double {
        if intervalTime == 0 || isFinished() {
            return 0.0
        }

        return ((Double(intervalTimeRemaining) * 100.0) / Double(intervalTime)) / 100.0
    }

    func progressTotal() -> Double {
        if totalTime == 0 || isFinished() {
            return 0.0
        }

        return ((Double(totalTimeRemaining) * 100.0) / Double(totalTime)) / 100.0
    }

    private func isFinished() -> Bool {
        totalTimeElapsed == totalTime
    }
}
