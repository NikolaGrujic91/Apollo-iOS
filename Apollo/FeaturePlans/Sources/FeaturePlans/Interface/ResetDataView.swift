//
//  ResetDataView.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 20/02/2023.
//

import FoundationLocalization
import SwiftUI

public struct ResetDataView: View {
    @Environment(LocalizationViewModel.self)
    private var localization
    @Environment(PlansViewModel.self)
    private var plansViewModel
    @State private var showingAlert = false

    public init() {}

    public var body: some View {
        Button(
            role: .destructive,
            action: { showingAlert = true },
            label: { Text("resetLabel".localized(localization.language)) }
        )
        .alert("resetQuestion".localized(localization.language), isPresented: $showingAlert) {
            Button("cancel".localized(localization.language), role: .cancel) {}
            Button("reset".localized(localization.language), role: .destructive) {
                plansViewModel.reset()
            }
        }
    }
}

#Preview {
    ResetDataView()
        .environment(LocalizationViewModel())
        .environment(PlansViewModel())
}
