//
//  ApolloPicker.swift
//  SharedUI
//
//  Created by Nikola Grujic on 30/08/2023.
//

import SwiftUI

public struct ApolloPicker: View {
    // MARK: - Properties

    @State private var selectedValue: String

    let title: String
    let values: [String]
    let action: (_ value: String) -> Void

    // MARK: - Initializers

    public init(_ title: String, _ selectedValue: String, _ values: [String], action: @escaping (_ value: String) -> Void) {
        self.title = title
        self.selectedValue = selectedValue
        self.values = values
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Picker(title, selection: $selectedValue) {
            ForEach(values, id: \.self) { value in
                Text(value)
            }
        }
        .pickerStyle(.navigationLink)
        .onReceive([self.selectedValue].publisher.first()) { value in
            action(value)
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ApolloPicker("Appearance", "Dark", ["Dark", "Light", "Automatic"]) { value in
            print(value)
        }
    }
}
