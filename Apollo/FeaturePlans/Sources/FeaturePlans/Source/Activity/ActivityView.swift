//
//  ActivityView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import FeatureWeight
import FoundationLocalization
import SwiftUI

@MainActor
struct ActivityView: View {
    // MARK: - Properties

    @Environment(ActivityViewModel.self)
    private var viewModel
    @Environment(WeightViewModel.self)
    private var weightViewModel
    @Environment(LocalizationViewModel.self)
    private var localization

    var day: Day

    // MARK: - Subviews

    @ViewBuilder private var activityView: some View {
        if viewModel.isFinished {
            InfoView(
                calories: viewModel.stats.calories,
                distance: viewModel.stats.distanceKilometers,
                pace: viewModel.stats.paceFormatted
            )
            .onDisappear {
                viewModel.onDissapear()
            }
        } else {
            TimerView()
                .onAppear {
                    viewModel.onAppear(day: day, bodyMass: Double(weightViewModel.bodyMass) ?? 0.0)
                    // Prevent screen lock only for timer
                    UIApplication.shared.isIdleTimerDisabled = true
                }
        }
    }

    // MARK: - Body

    var body: some View {
        activityView
            .navigationTitle(viewModel.day.fullName(localization.language))
            .toolbar(.hidden, for: .tabBar)
    }
}

// MARK: - Preview

#Preview {
    func previewDay() -> Day {
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

    return ActivityView(day: previewDay())
        .environment(ActivityViewModel())
        .environment(WeightViewModel())
        .environment(LocalizationViewModel())
}
