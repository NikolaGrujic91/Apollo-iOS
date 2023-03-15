//
//  AppearanceToggle.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 14/02/2023.
//

import SwiftUI

struct AppearanceToggle: View {
    let action: () -> Void
    let systemName: String
    let rectangleColor: Color
    let labelText: String

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.accentColor)
                    .frame(width: 102, height: 102)
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(rectangleColor)
                    .frame(width: 100, height: 100)
            }
            .gesture(TapGesture().onEnded(action))
            Text(labelText)
                .font(.body)
                .fontWeight(.light)
            Button(action: action) {
                Image(systemName: systemName)
                    .padding()
                    .frame(width: 20, height: 20)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(25)
    }
}

struct AppearanceToggle_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceToggle(
            action: {},
            systemName: "checkmark.circle.fill",
            rectangleColor: .white,
            labelText: "Light"
        )
    }
}
