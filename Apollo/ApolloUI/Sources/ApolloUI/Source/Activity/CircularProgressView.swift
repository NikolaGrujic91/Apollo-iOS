//
//  CircularProgressView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct CircularProgressView: View {
    private var innerStyle: StrokeStyle
    let lineWidth: CGFloat
    let progress: Double
    let padding: CGFloat
    let color: Color

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

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(
            lineWidth: 5,
            progress: 0.25,
            padding: 30,
            color: .orange
        )
    }
}
