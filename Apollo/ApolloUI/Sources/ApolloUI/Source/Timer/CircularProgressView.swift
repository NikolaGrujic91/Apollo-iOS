//
//  CircularProgressView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI
import ApolloTheme

struct CircularProgressView: View {
    @EnvironmentObject private var theme: ThemeManager
    @State private var strokeColor: Color = .orange
    private var style: StrokeStyle
    let width: CGFloat
    let height: CGFloat
    let lineWidth: CGFloat
    let progress: Double

    public init(width: CGFloat, height: CGFloat, lineWidth: CGFloat, progress: Double) {
        self.width = width
        self.height = height
        self.lineWidth = lineWidth
        self.progress = progress
        self.style = StrokeStyle(lineWidth: lineWidth, lineCap: .round)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(strokeColor.opacity(0.5), lineWidth: lineWidth)
                .frame(width: width, height: height)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(strokeColor, style: style)
                .frame(width: width, height: height)
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
            width: 200,
            height: 200,
            lineWidth: 10,
            progress: 0.25
        )
        .environmentObject(ThemeManager())
    }
}
