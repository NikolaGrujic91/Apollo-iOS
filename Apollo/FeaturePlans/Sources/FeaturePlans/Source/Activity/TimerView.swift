//
//  TimerView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import FoundationLocalization
import SwiftUI

struct TimerView: View {
    // MARK: - Properties

    @Environment(ActivityViewModel.self)
    private var viewModel
    @Environment(LocalizationViewModel.self)
    private var localization

    // MARK: - Body

    var body: some View {
        VStack {
            ZStack {
                FractionProgressView(
                    lineWidth: 8,
                    progress: viewModel.progressTotal(),
                    padding: 10,
                    intervals: viewModel.day.intervals
                )
                CircularProgressView(
                    lineWidth: 12,
                    progress: viewModel.progress(),
                    padding: 30,
                    color: viewModel.intervalType().color()
                )
                TimerText(
                    timeInterval: TimeInterval(viewModel.timeRemaining),
                    color: viewModel.intervalType().color(),
                    intervalType: viewModel.intervalType().rawValue.localized(localization.language),
                    currentInterval: viewModel.currentInterval.getDisplay(),
                    totalIntervals: viewModel.currentInterval.getTotal(),
                    fontSize: 90
                )
                .onReceive(viewModel.timer) { _ in
                    viewModel.onReceive()
                }
            }
            HStack(spacing: 30) {
                if viewModel.activeButton == .start {
                    CircleButton(
                        action: viewModel.startPressed,
                        imageName: "play.fill"
                    )
                } else if viewModel.activeButton == .pause {
                    CircleButton(
                        action: viewModel.pausePressed,
                        imageName: "pause.fill"
                    )
                } else if viewModel.activeButton == .resume {
                    CircleButton(
                        action: viewModel.resumePressed,
                        imageName: "play.fill"
                    )
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    TimerView()
        .environment(ActivityViewModel())
        .environment(LocalizationViewModel())
}
