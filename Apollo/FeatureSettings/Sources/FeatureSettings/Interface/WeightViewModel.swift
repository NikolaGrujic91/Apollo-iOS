//
//  WeightViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 19/02/2023.
//

import Foundation

public final class WeightViewModel: ObservableObject, WeightRepositoryInjected {
    @Published var bodyMass: String = "0.0"

    public init() {}

    func save() {
        weightRepository.save(Double(bodyMass) ?? 0.0)
    }

    func update() {
        bodyMass = "\(String(format: "%.1f", weightRepository.bodyMass))"
    }

    func loadFromHealth() async {
        await weightRepository.loadFromHealthKit()
    }

    func onAppear() {
        weightRepository.load()
        update()
    }
}
