//
//  PlansView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 15/02/2023.
//

import ApolloData
import FeatureSettings
import SwiftUI

struct PlansView: View {
    @EnvironmentObject private var viewModel: PlansViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.plans) { plan in
                    ZStack {
                        NavigationLink(destination: DaysView(planID: plan.id)) {
                            EmptyView()
                        }
                        Image(uiImage: viewModel.getImage(plan.name))
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity) // Enable alignment center
                            .accessibilityHidden(true)
                        Text("\(plan.name)")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity) // Enable alignment center
                    .contentShape(Rectangle()) // Detect tap on entire button
                }
            }
            .task {
                await viewModel.load()
                viewModel.update()
            }
        }
    }
}

struct PlansView_Previews: PreviewProvider {
    static var previews: some View {
        PlansView()
            .environmentObject(PlansViewModel())
            .environmentObject(ActivityViewModel())
            .environmentObject(ThemeViewModel())
    }
}
