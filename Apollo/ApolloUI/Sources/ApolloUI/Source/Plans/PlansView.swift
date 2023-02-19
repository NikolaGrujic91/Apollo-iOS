//
//  PlansView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 15/02/2023.
//

import SwiftUI
import ApolloData
import ApolloImages

struct PlansView: View, PlansRepositoryInjected, PlanImageInjected {
    @State private var plans: [Plan] = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(plans) { plan in
                    NavigationLink(destination: DaysView(plan: plan)) {
                        VStack(alignment: .center) {
                            Text("\(plan.name)")
                            Image(uiImage: getImage(plan.name))
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 200)
                                .accessibilityHidden(true)
                        }
                        .frame(maxWidth: .infinity) // Enable alignment center
                        .contentShape(Rectangle()) // Detect tap on entire button
                    }
                }
            }
            .task {
                await plansRepository.load()
                plans = plansRepository.plans
            }
        }
    }

    private func getImage(_ name: String) -> UIImage {
        if name == "0 to 2K" {
            return planImage.getImage(.plan1)
        } else if name == "0 to 5K" {
            return planImage.getImage(.plan2)
        } else if name == "5K to 10K" {
            return planImage.getImage(.plan3)
        } else if name == "Weight Loss: Level 1" {
            return planImage.getImage(.plan4)
        } else if name == "Weight Loss: Level 2" {
            return planImage.getImage(.plan5)
        } else {
            return planImage.getImage(.plan6)
        }
    }
}

struct PlansView_Previews: PreviewProvider {
    static var previews: some View {
        PlansView()
    }
}
