//
//  TimerView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import FoundationData
import FeatureSettings
import SwiftUI

struct ActivityView: View {
    @EnvironmentObject private var localization: LocalizationViewModel
    @EnvironmentObject private var viewModel: ActivityViewModel
    var day: Day

    var body: some View {
        if viewModel.isFinished {
            InfoView(
                calories: viewModel.calories,
                distance: viewModel.distanceFormatted,
                pace: viewModel.paceFormatted
            )
            .navigationTitle(viewModel.day.name)
            .onDisappear {
                viewModel.onDissapear()
            }
            .toolbar(.hidden, for: .tabBar)
        } else {
            TimerView()
                .navigationTitle(viewModel.day.name)
                .onAppear {
                    viewModel.onAppear(day: day)

                    // Prevent screen lock only for timer
                    UIApplication.shared.isIdleTimerDisabled = true
                }
                .toolbar(.hidden, for: .tabBar)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(day: previewDay())
            .environmentObject(LocalizationViewModel())
            .environmentObject(ThemeViewModel())
            .environmentObject(ActivityViewModel())
    }

    static func previewDay() -> Day {
        let interval1 = Interval()
        interval1.seconds = 10
        interval1.type = .run

        let interval2 = Interval()
        interval2.seconds = 5
        interval2.type = .walk

        let day = Day()
        day.name = "Preview day"
        day.distance = 5000
        day.calories = 500
        day.intervals = [interval1, interval2]

        return day
    }
}
