//
//  DaysView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 15/02/2023.
//

import SwiftUI
import ApolloData

struct DaysView: View {
    var plan: Plan

    var body: some View {
        NavigationStack {
            List {
                ForEach(plan.days) { day in
                    NavigationLink(destination: TimerView(day: day)) {
                        VStack(alignment: .center, spacing: 10) {
                            Text("\(day.name)")
                            Text("\(day.distance) m")
                            Text("\(day.calories) kcal")
                        }
                        .frame(maxWidth: .infinity) // Enable alignment center
                        .contentShape(Rectangle()) // Detect tap on entire button
                    }
                }
            }
            .navigationTitle(plan.name)
        }
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(plan: previewPlan())
    }

    static func previewPlan() -> Plan {
        let day = Day()
        day.name = "Preview day"
        day.distance = 5000
        day.calories = 500

        let plan = Plan()
        plan.name = "Preview plan"
        plan.days.append(day)

        return plan
    }
}
