//
//  DayView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 28/02/2023.
//

import SwiftUI

struct DayView: View {
    var name: String
    var distance: Int
    var calories: Int
    var pace: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.title3)
                .fontWeight(.semibold)
            HStack {
                VStack(alignment: .leading) {
                    Text("Distance")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(distance) m")
                        .font(.subheadline)
                }
                Divider()
                    .padding()
                VStack(alignment: .leading) {
                    Text("Pace")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(pace)/km")
                        .font(.subheadline)
                }
                Divider()
                    .padding()
                VStack(alignment: .leading) {
                    Text("Calories")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(calories) kcal")
                        .font(.subheadline)
                }
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(
            name: "Test day",
            distance: 200,
            calories: 500,
            pace: "00:00"
        )
    }
}
