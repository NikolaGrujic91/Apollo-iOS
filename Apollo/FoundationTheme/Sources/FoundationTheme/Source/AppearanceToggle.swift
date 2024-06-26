//
//  AppearanceToggle.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 14/02/2023.
//

import SwiftUI

struct AppearanceToggle: View {
    // MARK: - Properties

    let systemName: String
    let rectangleColor: Color
    let labelText: String
    let action: () -> Void

    // MARK: - Initializers

    init(systemName: String, rectangleColor: Color, labelText: String, action: @escaping () -> Void) {
        self.systemName = systemName
        self.rectangleColor = rectangleColor
        self.labelText = labelText
        self.action = action
    }

    // MARK: - Body

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(UIColor.systemOrange))
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
                    .background(Color(UIColor.systemOrange))
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .symbolVariant(.fill)
            }
            .buttonStyle(.borderless)
        }
        .padding(25)
    }
}

// MARK: - Preview

#Preview {
    AppearanceToggle(
        systemName: "checkmark.circle",
        rectangleColor: .white,
        labelText: "Light"
    ) {}
}
