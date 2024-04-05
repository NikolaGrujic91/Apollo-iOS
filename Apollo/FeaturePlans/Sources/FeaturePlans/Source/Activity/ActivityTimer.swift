//
//  ActivityTimer.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 31/03/2024.
//

import Combine
import Foundation
import FoundationLogger

enum ActivityTimerState: String {
    case started
    case stopped
}

@MainActor
class ActivityTimer: LoggerInjected {
    // MARK: - Properties

    private var cancellable: AnyCancellable?
    private var onTick: () -> Void
    private(set) var state: ActivityTimerState = .stopped {
        didSet {
            logger.logInfo("Activity timer state: \(state.rawValue)")
        }
    }

    // MARK: - Initializers

    init(onTick: @escaping () -> Void) {
        self.onTick = onTick
    }

    // MARK: - Functions

    func start() {
        if .started == state {
            return
        }

        state = .started
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.onTick()
            }
    }

    func stop() {
        if .stopped == state {
            return
        }

        state = .stopped
        cancellable?.cancel()
    }
}
