//
//  WeightViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 19/02/2023.
//

import Foundation
import ApolloWeight

final class WeightViewModel: ObservableObject, WeightRepositoryInjected {
    @Published var weight: String = "0.0"

    func save() {
        weightRepository.save(Double(weight) ?? 0.0)
    }

    func loadFromHealth() async {
        await weightRepository.loadFromHealthKit()
    }

    func onAppear() {
        weightRepository.load()
        weight = "\(String(format: "%.1f", weightRepository.value))"
    }
}
