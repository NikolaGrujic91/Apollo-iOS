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
                ForEach(plan.weeks) { week in
                    DisclosureGroup(
                        content: {
                            ForEach(week.days) { day in
                                if day.finished {
                                    VStack(alignment: .center, spacing: 10) {
                                        FinishedDayView(day: day)
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

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(planID: UUID())
            .environmentObject(ThemeManager())
            .environmentObject(ActivityViewModel())
            .environmentObject(PlansViewModel())
    }
}
