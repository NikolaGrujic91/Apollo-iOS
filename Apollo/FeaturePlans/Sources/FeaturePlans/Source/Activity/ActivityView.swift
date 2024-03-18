//
//  ActivityView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import FeatureWeight
import SwiftUI

struct ActivityView: View {
    // MARK: - Properties

    @Environment(ActivityViewModel.self)
    private var viewModel
    @Environment(WeightViewModel.self)
    private var weightViewModel

    var day: Day

    // MARK: - Body

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
                    viewModel.onAppear(day: day, bodyMass: Double(weightViewModel.bodyMass) ?? 0.0)

                    // Prevent screen lock only for timer
                    UIApplication.shared.isIdleTimerDisabled = true
                }
                .toolbar(.hidden, for: .tabBar)
        }
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
}
