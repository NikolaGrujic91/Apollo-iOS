//
//  PlansView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 15/02/2023.
//

import FoundationLocalization
import SwiftUI

@MainActor
public struct PlansView: View {
    // MARK: - Properties

    @Environment(PlansViewModel.self)
    private var viewModel
    @Environment(LocalizationViewModel.self)
    private var localization

    // MARK: - Initializers

    public init() {}

    // MARK: - Subviews

    @ViewBuilder
    private func planView(_ plan: Plan) -> some View {
        ZStack {
            NavigationLink(destination: DaysView(planID: plan.id)) {
                EmptyView()
            }
            Image(uiImage: viewModel.getImage(plan.name))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity) // Enable alignment center
                .accessibilityHidden(true)
            Text("\(plan.name.rawValue.localized(localization.language))")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity) // Enable alignment center
        .contentShape(Rectangle()) // Detect tap on entire button
    }

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.plans) { plan in
                    planView(plan)
                }
            }
            .task {
                await viewModel.load()
                viewModel.update()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    PlansView()
        .environment(PlansViewModel())
        .environment(ActivityViewModel())
}
