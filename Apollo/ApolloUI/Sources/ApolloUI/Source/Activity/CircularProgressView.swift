//
//  CircularProgressView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import ApolloTheme
import SwiftUI

struct CircularProgressView: View {
    @EnvironmentObject private var theme: ThemeManager
    @State private var strokeColor: Color = .orange
    private var innerStyle: StrokeStyle
    let lineWidth: CGFloat
    let progress: Double
    let padding: CGFloat

    public init(
        lineWidth: CGFloat,
        progress: Double,
        padding: CGFloat
    ) {
        self.lineWidth = lineWidth
        self.progress = progress
        self.padding = padding
        innerStyle = StrokeStyle(lineWidth: lineWidth, lineCap: .round)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(strokeColor.opacity(0.2), lineWidth: lineWidth)
                .padding(padding)
                .frame(maxWidth: .infinity)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(strokeColor, style: innerStyle)
                .padding(padding)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
        .onAppear {
            strokeColor = theme.colorScheme == .dark ? .orange : .green
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(
            lineWidth: 5,
            progress: 0.25,
            padding: 30
        )
        .environmentObject(ThemeManager())
    }
}
