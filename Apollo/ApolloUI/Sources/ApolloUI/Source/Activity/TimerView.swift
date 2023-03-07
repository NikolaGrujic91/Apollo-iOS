//
//  TimerView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import ApolloLocalization
import ApolloTheme
import SwiftUI

struct TimerView: View {
    @EnvironmentObject private var localization: LocalizationManager
    @EnvironmentObject private var viewModel: ActivityViewModel

    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(
                    innerLineWidth: 10,
                    innerProgress: viewModel.progress(),
                    innerPadding: 20,
                    outerLineWidth: 5,
                    outerProgress: viewModel.progressTotal(),
                    outerPadding: 5
                )
                TimerText(
                    timeInterval: TimeInterval(viewModel.timeRemaining),
                    intervalType: viewModel.intervalType(),
                    currentInterval: viewModel.currentInterval + 1,
                    totalIntervals: viewModel.totalIntervals,
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
                        text: "start".localized(localization.language)
                    )
                } else if viewModel.activeButton == .pause {
                    CircleButton(
                        action: viewModel.pausePressed,
                        text: "pause".localized(localization.language)
                    )
                } else if viewModel.activeButton == .resume {
                    CircleButton(
                        action: viewModel.resumePressed,
                        text: "resume".localized(localization.language)
                    )
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(LocalizationManager())
            .environmentObject(ThemeManager())
            .environmentObject(ActivityViewModel())
    }
}
