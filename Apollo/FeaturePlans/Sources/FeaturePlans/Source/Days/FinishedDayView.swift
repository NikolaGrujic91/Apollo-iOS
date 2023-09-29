//
//  FinishedDayView.swift
//
//
//  Created by Nikola Grujic on 13/03/2023.
//

import FoundationData
import SwiftUI

struct FinishedDayView: View {
    @Environment(PlansViewModel.self)
    private var viewModel 
    @State private var day = Day()
    let planId: UUID
    let weekId: UUID
    let dayId: UUID

    init(planId: UUID, weekId: UUID, dayId: UUID) {
        self.planId = planId
        self.weekId = weekId
        self.dayId = dayId
    }

    var body: some View {
        DisclosureGroup(content: {
            HStack {
                VStack(alignment: .center) {
                    Image(systemName: "ruler")
                        .frame(height: 20)
                        .foregroundColor(.gray)
                    Text("\(day.distance)")
                        .font(.system(size: 10))
                        .padding(.vertical)
                    Text("m")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                Divider()
                    .padding()
                VStack(alignment: .center) {
                    Image(systemName: "speedometer")
                        .frame(height: 20)
                        .foregroundColor(.gray)
                    Text("\(day.pace)")
                        .font(.system(size: 10))
                        .padding(.vertical)
                    Text("/km")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                Divider()
                    .padding()
                VStack(alignment: .center) {
                    Image(systemName: "flame")
                        .frame(height: 20)
                        .foregroundColor(.gray)
                    Text("\(day.calories)")
                        .font(.system(size: 10))
                        .padding(.vertical)
                    Text("kcal")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                Divider()
                    .padding()
                VStack(alignment: .center) {
                    ZStack {
                        NavigationLink(destination: ActivityView(day: day)) {
                            EmptyView()
                        }
                        Image(systemName: "figure.run")
                            .frame(height: 20)
                            .foregroundColor(.accentColor)
                    }
                    Text("Run again")
                        .font(.system(size: 10))
                }
                Spacer()
            }
            .background(.gray.opacity(0.1))
            .cornerRadius(5)
        }, label: {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .frame(height: 20)
                    .foregroundColor(.accentColor)
                Text(day.name)
                    .foregroundColor(.accentColor)
                Spacer()
            }
        })
        .onAppear {
            day = viewModel.getDay(planId, weekId, dayId)
        }
    }
}

struct FinishedView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedDayView(
            planId: UUID(),
            weekId: UUID(),
            dayId: UUID()
        )
    }
}
