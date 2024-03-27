//
//  CircleButton.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct CircleButton: View {
    // MARK: - Properties

    let action: () -> Void
    let imageName: String

    // MARK: - Body

    var body: some View {
        ZStack {
            Button(action: action) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .foregroundColor(Color(UIColor.systemOrange))
            .frame(maxWidth: .infinity) // Enable alignment center
            .contentShape(Rectangle()) // Detect tap on entire button
        }
    }
}

// MARK: - Preview

#Preview {
    CircleButton(
        action: { print("pressed") },
        imageName: "play.fill"
    )
}
