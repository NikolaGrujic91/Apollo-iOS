//
//  WeightViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 19/02/2023.
//

import Foundation
import ApolloWeight

final class WeightViewModel: WeightRepositoryInjected {
    @Published var weight: String = "0.0"
    let numberFormatter = NumberFormatter()

    init() {
        numberFormatter.maximumIntegerDigits = 3
        numberFormatter.maximumFractionDigits = 1
        weightRepository.load()
        weight = "\(String(format: "%.1f", weightRepository.value))"
    }

    func save() {
        weightRepository.save(Double(weight) ?? 0.0)
    }

    func loadFromHealth() async {
        await weightRepository.loadFromHealthKit()
    }
}
