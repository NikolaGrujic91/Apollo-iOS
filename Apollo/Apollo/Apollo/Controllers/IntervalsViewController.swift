//
//  IntervalsViewController.swift
//  Apollo
//
//  Created by Nikola Grujic on 08/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit
import ApolloWeight
import ApolloLocation
import ApolloAudio


class IntervalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WeightRepositoryInjected, LocationTrackerInjected, AudioPlayerInjected {
    var day: Day! {
        didSet {
            self.setNavigationItem(self.day.name)
        }
    }

    var timer: Timer! = Timer()
    var seconds: Int! = 0
    var currentIntervalSeconds: Int! = 0
    var currentIntervalIndex: Int! = 0
    var isTimerRunning: Bool! = false
    var resumeTapped: Bool! = false

    let walkTextColor: UIColor! = UIColor.init(red: (145.0 / 255.0), green: (145.0 / 255.0), blue: (145.0 / 255.0), alpha: 1.0)
    let runTextColor: UIColor! = UIColor.init(red: (255.0 / 255.0), green: (147.0 / 255.0), blue: (0 / 255.0), alpha: 1.0)

    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var intervalTypeLabel: UILabel!
    @IBOutlet var intervalsCountLabel: UILabel!
    @IBOutlet var intervalsTableView: UITableView!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pauseButton.isEnabled = false
        self.resetButton.isEnabled = false
        self.intervalsCountLabel.text = "0 / \(self.day.intervals.count)"
        self.intervalTypeLabel.text = " "
        self.setDynamicCellHeight()
        locationTracker.requestAuthorization()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.intervalsTableView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationTracker.stopUpdatingLocation()
        locationTracker.clear()
    }

    // MARK: - Action methods

    @IBAction func startButtonPressed(_ sender: UIButton) {
        if self.isTimerRunning {
            return
        }
        
        locationTracker.startUpdatingLocation()
        self.setCurrentInterval()
        self.runTimer()
        self.startButton.isEnabled = false
        self.resetButton.isEnabled = true
    }

    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        if self.resumeTapped {
            self.resume()
        } else {
            self.pause()
        }
    }

    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.timer.invalidate()
        self.seconds = self.currentIntervalSeconds
        self.timerLabel.text = self.formatTimeString(time: TimeInterval(self.seconds))

        self.isTimerRunning = false
        self.resumeTapped = false
        self.pauseButton.isEnabled = false
        self.pauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        self.startButton.isEnabled = true
        self.resetButton.isEnabled = false
    }

    // MARK: - Helper methods

    internal func pause() {
        self.timer.invalidate()
        self.resumeTapped = true
        self.pauseButton.setImage(UIImage(systemName: "playpause"), for: .normal)
        locationTracker.stopUpdatingLocation()
    }

    internal func resume() {
        self.runTimer()
        self.resumeTapped = false
        self.pauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        locationTracker.startUpdatingLocation()
    }

    private func setDynamicCellHeight() {
        self.intervalsTableView.rowHeight = UITableView.automaticDimension
        self.intervalsTableView.estimatedRowHeight = 65
    }

    private func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat

        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }

        return statusBarHeight
    }

    private func setNavigationItem(_ title: String) {
        self.navigationItem.title = title
    }

    private func runTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: (#selector(self.updateTimer)),
                                          userInfo: nil,
                                          repeats: true)
        self.isTimerRunning = true
        self.pauseButton.isEnabled = true
    }

    @objc func updateTimer() {
        if self.seconds < 1 {
            self.timer.invalidate()
            self.currentIntervalIndex += 1

            if self.isLastInterval() {
                self.intervalTypeLabel.text = "FINISHED"
                self.startButton.isEnabled = false
                self.pauseButton.isEnabled = false
                self.resetButton.isEnabled = false

                locationTracker.stopUpdatingLocation()
                self.day.distance = Int(locationTracker.calculateDistance())
                self.day.calories = Int(Double(self.day.distance) / 1000.0 * repository.value * 1.036)

                return
            }

            player.play(.complete)
            self.setCurrentInterval()
            self.runTimer()
        } else {
            if self.seconds == 3 {
                player.play(.countdown)
            }

            self.seconds -= 1
            self.timerLabel.text = self.formatTimeString(time: TimeInterval(self.seconds))
        }
    }

    private func formatTimeString(time: TimeInterval) -> String {
        //let hours = Int(time) / 3600;
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        //return String(format:"%02i:%02i:%02i", hours, minutes, seconds);
        return String(format:"%02i:%02i", minutes, seconds)
    }

    private func setCurrentInterval() {
        if self.currentIntervalIndex >= self.day.intervals.count {
            self.currentIntervalIndex = self.day.intervals.count - 1
        }

        self.intervalsCountLabel.text = "\(self.currentIntervalIndex + 1) / \(self.day.intervals.count)"
        self.intervalTypeLabel.text = self.day.intervals[self.currentIntervalIndex].type.uppercased()
        self.currentIntervalSeconds = self.day.intervals[self.currentIntervalIndex].seconds
        self.seconds = self.currentIntervalSeconds
    }

    private func isLastInterval() -> Bool {
        return self.currentIntervalIndex >= self.day.intervals.count
    }

    // MARK: - UITableViewDataSource methods

    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.day.intervals.count
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntervalCell", for: indexPath) as! IntervalCell

        let index = indexPath.row
        let interval = self.day.intervals[index]

        cell.intervalLabel.text = self.formatTimeString(time: TimeInterval(interval.seconds))
        cell.runLabel.text = interval.type.firstUppercased
        cell.runLabel.textColor = interval.type == "walk" ? self.walkTextColor : self.runTextColor
        cell.runLabel.font = UIFont.boldSystemFont(ofSize: cell.runLabel.font.pointSize)

        return cell
    }
}
