//
//  WeightView.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 19/02/2023.
//

import SwiftUI
import FoundationLocalization

public struct WeightView: View {
    @Environment(\.dismiss)
    var dismiss
    @Environment(LocalizationViewModel.self)
    private var localization
    @Environment(WeightViewModel.self)
    private var viewModel
    @FocusState private var isFocused: Bool

    public init() {}

    public var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("kg")
                TextField("", text: Bindable(viewModel).bodyMass)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .disableAutocorrection(true)
                    .focused($isFocused)
            }
            Button(action: {
                Task {
                    await viewModel.loadFromHealth()
                    dismiss()
                }
            }, label: {
                Text("loadHealth".localized(localization.language))
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.bordered)
        }
        .padding()
        .onAppear {
            isFocused = true
        }
        .toolbar {
            Button(action: {
                viewModel.save()
                dismiss()
            }, label: {
                Text("save".localized(localization.language))
            })
        }
    }
}

#Preview {
    NavigationView {
        WeightView()
            .environment(LocalizationViewModel())
            .environment(WeightViewModel())
    }
}
