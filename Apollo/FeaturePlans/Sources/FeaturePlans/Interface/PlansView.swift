//
//  PlansView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 15/02/2023.
//

import SwiftUI

public struct PlansView: View {
    @Environment(PlansViewModel.self)
    private var viewModel

    public init() {}

    public var body: some View {
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

#Preview {
    PlansView()
        .environment(PlansViewModel())
        .environment(ActivityViewModel())
}
