//
//  PlansView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 15/02/2023.
//

import SwiftUI
import ApolloData
import ApolloTheme

struct PlansView: View {
    @EnvironmentObject private var viewModel: PlansViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.plans) { plan in
                    NavigationLink(destination: DaysView(plan: plan)) {
                        VStack(alignment: .center) {
                            Text("\(plan.name)")
                            Image(uiImage: viewModel.getImage(plan.name))
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
            .environmentObject(TimerViewModel())
            .environmentObject(ThemeManager())
    }
}
