//
//  StatsView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 27/02/2023.
//

import FoundationImages
import SwiftUI

struct StatsView: View {
    // MARK: - Properties

    @Environment(\.dismiss)
    var dismiss

    var calories: Int
    var distance: String
    var pace: String

    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                GifView(gif: .success)
                    .frame(width: 200, height: 200)
                VStack {
                    Text("Pace")
                        .font(.body)
                    Text(pace)
                        .font(.largeTitle)
                    Text("/km")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                Divider()
                    .padding()
                VStack {
                    Text("Distance")
                        .font(.body)
                    Text(distance)
                        .font(.largeTitle)
                    Text("km")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                Divider()
                VStack {
                    Text("Calories")
                        .font(.body)
                    Text("\(calories)")
                        .font(.largeTitle)
                    Text("kcal")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                Divider()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    StatsView(
        calories: 500,
        distance: "5.5",
        pace: "0:00"
    )
    .environment(PlansViewModel())
}
