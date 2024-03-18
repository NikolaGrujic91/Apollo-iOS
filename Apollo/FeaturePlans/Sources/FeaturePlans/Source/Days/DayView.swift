//
//  DayView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 28/02/2023.
//

import SwiftUI

struct DayView: View {
    // MARK: - Properties

    var name: String

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "circlebadge")
                    .frame(height: 20)
                    .foregroundColor(.gray)
                Text(name)
                    .foregroundColor(.accentColor)
                Spacer()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    DayView(
        name: "Test day"
    )
}
