//
//  FractionProgressView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 16/02/2023.
//

import SwiftUI

struct FractionProgressView: View {
    // MARK: - Properties

    private var outerStyle: StrokeStyle
    let lineWidth: CGFloat
    let progress: Double
    let padding: CGFloat
    let intervals: [Interval]

    // MARK: - Initializers

    public init(
        lineWidth: CGFloat,
        progress: Double,
        padding: CGFloat,
        intervals: [Interval]
    ) {
        self.lineWidth = lineWidth
        self.progress = progress
        self.padding = padding
        outerStyle = StrokeStyle(lineWidth: lineWidth, lineCap: .round)

        self.intervals = intervals
    }

    // MARK: - Subviews

    @ViewBuilder
    private func fractionView(_ interval: Interval) -> some View {
        if interval.endFraction <= progress, progress <= interval.startFraction {
            Circle()
                .trim(from: interval.endFraction, to: progress)
                .stroke(interval.type.color(), style: outerStyle)
                .padding(padding)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        } else if interval.endFraction <= progress, interval.startFraction <= progress {
            Circle()
                .trim(from: interval.endFraction, to: interval.startFraction)
                .stroke(interval.type.color(), style: outerStyle)
                .padding(padding)
                .frame(maxWidth: .infinity)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        } else {
            EmptyView()
        }
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            ForEach(intervals) { interval in
                fractionView(interval)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    func previewIntervals() -> [Interval] {
        let interval1 = Interval()
        interval1.seconds = 10
        interval1.type = .run
        interval1.endFraction = 0.0
        interval1.startFraction = 0.5

        let interval2 = Interval()
        interval2.seconds = 5
        interval2.type = .walk
        interval2.endFraction = 0.5
        interval2.startFraction = 1.0

        return [interval1, interval2]
    }

    return FractionProgressView(
        lineWidth: 5,
        progress: 0.9,
        padding: 10,
        intervals: previewIntervals()
    )
}
