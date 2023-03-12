//
//  CircleButton.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct CircleButton: View {
    let action: () -> Void
    let imageName: String

    var body: some View {
        ZStack {
            Button(action: action) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity) // Enable alignment center
            .contentShape(Rectangle()) // Detect tap on entire button
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(
            action: { print("pressed") },
            imageName: "play.fill"
        )
    }
}
