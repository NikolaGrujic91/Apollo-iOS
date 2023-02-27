//
//  InfoView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 27/02/2023.
//

import SwiftUI

struct InfoView: View {
    let pace: String
    let distance: String

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                VStack {
                    Text("AVG PACE")
                    .font(.body)
                    Text(pace)
                    .font(.largeTitle)
                    Text("/KM")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding()
                Divider()
                .padding()
                VStack {
                    Text("DISTANCE")
                    .font(.body)
                    Text(distance)
                    .font(.largeTitle)
                    Text("KILOMETERS")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding()
            }
            Divider()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(pace: "0:00", distance: "0,00")
    }
}
