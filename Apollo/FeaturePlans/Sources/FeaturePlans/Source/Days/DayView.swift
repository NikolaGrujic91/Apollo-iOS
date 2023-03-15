//
//  DayView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 28/02/2023.
//

import SwiftUI

struct DayView: View {
    var name: String

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

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(
            name: "Test day"
        )
    }
}
