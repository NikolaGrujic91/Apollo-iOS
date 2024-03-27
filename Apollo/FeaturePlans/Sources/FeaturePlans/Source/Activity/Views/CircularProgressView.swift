//
//  CircularProgressView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct CircularProgressView: View {
    // MARK: - Properties

    private var innerStyle: StrokeStyle
    let lineWidth: CGFloat
    let progress: Double
    let padding: CGFloat
    let color: Color

    // MARK: - Initializers

    public init(
        lineWidth: CGFloat,
        progress: Double,
        padding: CGFloat,
        color: Color
    ) {
        self.lineWidth = lineWidth
        self.progress = progress
        self.padding = padding
        self.color = color
        innerStyle = StrokeStyle(lineWidth: lineWidth, lineCap: .round)
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.2), lineWidth: lineWidth)
                .padding(padding)
                .frame(maxWidth: .infinity)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(color, style: innerStyle)
                .padding(padding)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}

// MARK: - Preview

#Preview {
    CircularProgressView(
        lineWidth: 5,
        progress: 0.25,
        padding: 30,
        color: .orange
    )
}
