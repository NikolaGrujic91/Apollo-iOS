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

    var body: some View {
        ZStack {
            Circle()
                .stroke(.orange.opacity(0.5), lineWidth: 2)
                .frame(width: 150, height: 150)
            Button(action: action) {
                Text(text)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    ) // Detect tap on entire button
                    .contentShape(Circle())
            }
                .frame(width: 140, height: 140)
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
            text: "Cancel"
        )
    }
}
