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
    private var outerStyle: StrokeStyle
    let innerLineWidth: CGFloat
    let innerProgress: Double
    let innerPadding: CGFloat
    let outerLineWidth: CGFloat
    let outerProgress: Double
    let outerPadding: CGFloat

    public init(
        innerLineWidth: CGFloat,
        innerProgress: Double,
        innerPadding: CGFloat,
        outerLineWidth: CGFloat,
        outerProgress: Double,
        outerPadding: CGFloat
    ) {
        self.innerLineWidth = innerLineWidth
        self.innerProgress = innerProgress
        self.innerPadding = innerPadding
        self.outerLineWidth = outerLineWidth
        self.outerProgress = outerProgress
        self.outerPadding = outerPadding
        innerStyle = StrokeStyle(lineWidth: innerLineWidth, lineCap: .round)
        outerStyle = StrokeStyle(lineWidth: outerLineWidth, lineCap: .round)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(.red.opacity(0.2), lineWidth: outerLineWidth)
                .padding(outerPadding)
                .frame(maxWidth: .infinity)
            Circle()
                .trim(from: 0, to: outerProgress)
                .stroke(.red, style: outerStyle)
                .padding(outerPadding)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: outerProgress)
            Circle()
                .stroke(strokeColor.opacity(0.2), lineWidth: innerLineWidth)
                .padding(innerPadding)
                .frame(maxWidth: .infinity)
            Circle()
                .trim(from: 0, to: innerProgress)
                .stroke(strokeColor, style: innerStyle)
                .padding(innerPadding)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: innerProgress)
        }
        .onAppear {
            strokeColor = theme.colorScheme == .dark ? .orange : .green
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(
            innerLineWidth: 5,
            innerProgress: 0.25,
            innerPadding: 30,
            outerLineWidth: 5,
            outerProgress: 0.5,
            outerPadding: 10
        )
        .environmentObject(ThemeManager())
    }
}
