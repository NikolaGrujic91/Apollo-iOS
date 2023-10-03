//
//  ResetDataView.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 20/02/2023.
//

import FoundationData
import FoundationLocalization
import SwiftUI

struct ResetDataView: View, PlansRepositoryInjected {
    @Environment(LocalizationViewModel.self)
    private var localization
    @State private var showingAlert = false

    var body: some View {
        Button(
            role: .destructive,
            action: { showingAlert = true },
            label: { Text("resetLabel".localized(localization.language)) }
        )
        .alert("resetQuestion".localized(localization.language), isPresented: $showingAlert) {
            Button("cancel".localized(localization.language), role: .cancel) {}
            Button("reset".localized(localization.language), role: .destructive) {
                plansRepository.reset()
            }
        }
    }
}

struct ResetDataView_Previews: PreviewProvider {
    static var previews: some View {
        ResetDataView()
            .environment(LocalizationViewModel())
    }
}
