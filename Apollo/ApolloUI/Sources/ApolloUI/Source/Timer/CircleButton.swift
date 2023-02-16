//
//  CircleButton.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct CircleButton: View {
    let action: () -> Void
    let text: String
    let borderPadding: CGFloat
    let buttonPadding: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(.orange.opacity(0.5), lineWidth: 2)
                .padding(borderPadding)
            Button(action: action) {
                Text(text)
            }
            .padding(buttonPadding)
            .background(.orange)
            .foregroundColor(.white)
            .clipShape(Circle())
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(
            action: { print("pressed") },
            text: "Cancel",
            borderPadding: 130,
            buttonPadding: 50
        )
    }
}
