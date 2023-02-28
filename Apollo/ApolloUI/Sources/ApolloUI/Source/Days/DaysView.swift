//
//  DaysView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 15/02/2023.
//

import ApolloData
import ApolloTheme
import SwiftUI

struct DaysView: View {
    @EnvironmentObject private var viewModel: PlansViewModel
    @State private var plan = Plan()
    var planID: UUID

    var body: some View {
        NavigationStack {
            List {
                ForEach(plan.days) { day in
                    NavigationLink(destination: TimerView(day: day)) {
                        VStack(alignment: .center, spacing: 10) {
                            DayView(
                                name: day.name,
                                distance: day.distance,
                                calories: day.calories,
                                pace: day.pace
                            )
                        }
                        .frame(maxWidth: .infinity) // Enable alignment center
                        .contentShape(Rectangle()) // Detect tap on entire button
                    }
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

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(planID: UUID())
            .environmentObject(ThemeManager())
            .environmentObject(TimerViewModel())
    }
}
