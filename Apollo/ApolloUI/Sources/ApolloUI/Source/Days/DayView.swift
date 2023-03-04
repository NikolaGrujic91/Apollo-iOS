//
//  DayView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 28/02/2023.
//

import SwiftUI

struct DayView: View {
    var finished: Bool
    var calories: Int
    var distance: Int
    var name: String
    var pace: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)

            if finished {
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
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(
            finished: true,
            calories: 500,
            distance: 200,
            name: "Test day",
            pace: "00:00"
        )
    }
}
