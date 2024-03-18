//
//  DaysView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 15/02/2023.
//

import SwiftUI

struct DaysView: View {
    // MARK: - Properties

    @Environment(PlansViewModel.self)
    private var viewModel

    @State private var plan = Plan()

    var planID: UUID

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List {
                ForEach(plan.weeks) { week in
                    DisclosureGroup(
                        content: {
                            ForEach(week.days) { day in
                                if day.finished {
                                    VStack(alignment: .center, spacing: 10) {
                                        FinishedDayView(
                                            planId: plan.id,
                                            weekId: week.id,
                                            dayId: day.id
                                        )
                                    }
                                    .frame(maxWidth: .infinity) // Enable alignment center
                                    .contentShape(Rectangle()) // Detect tap on entire button
                                    .padding(.vertical)
                                } else {
                                    NavigationLink(destination: ActivityView(day: day)) {
                                        VStack(alignment: .center, spacing: 10) {
                                            DayView(name: day.name)
                                        }
                                        .frame(maxWidth: .infinity) // Enable alignment center
                                        .contentShape(Rectangle()) // Detect tap on entire button
                                    }
                                    .padding(.vertical)
                                }
                            }
                        },
                        label: {
                            Text(week.name)
                        }
                    )
                }
            }
            .navigationTitle(plan.name)
            .task {
                viewModel.update()
                plan = viewModel.get(planID)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    DaysView(planID: UUID())
        .environment(PlansViewModel())
}
