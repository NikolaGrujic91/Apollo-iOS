//
//  InfoView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 27/02/2023.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    var calories: Int
    var distance: String
    var pace: String

    var body: some View {
        NavigationView {
            VStack {
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
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(
            calories: 500,
            distance: "5.5",
            pace: "0:00"
        )
    }
}
