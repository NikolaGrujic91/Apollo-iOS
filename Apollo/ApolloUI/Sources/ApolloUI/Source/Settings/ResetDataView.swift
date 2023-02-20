//
//  ResetDataView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 20/02/2023.
//

import SwiftUI
import ApolloData
import ApolloLocalization

struct ResetDataView: View, PlansRepositoryInjected {
    @EnvironmentObject var localization: LocalizationManager
    @State private var showingAlert = false

    var body: some View {
        Button(
            role: .destructive,
            action: { showingAlert = true },
            label: { Text("Reset calories and distances") }
        )
        .alert("Are you sure you want to reset calories and distances?", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Reset", role: .destructive) {
                plansRepository.reset()
            }
        }
    }
}

struct ResetDataView_Previews: PreviewProvider {
    static var previews: some View {
        ResetDataView()
            .environmentObject(LocalizationManager())
    }
}
