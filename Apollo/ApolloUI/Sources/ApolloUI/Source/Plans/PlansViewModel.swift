//
//  PlansViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 21/02/2023.
//

import FoundationData
import FoundationImages
import SwiftUI

final class PlansViewModel: ObservableObject, PlansRepositoryInjected, ImagesInjected {
    @Published private(set) var plans: [Plan] = []

    func update() {
        plans = plansRepository.plans
    }

    func load() async {
        await plansRepository.load()
    }

    func get(_ id: UUID) -> Plan {
        plansRepository.get(id)
    }

    func getDay(_ planId: UUID, _ weekId: UUID, _ dayId: UUID) -> Day {
        plansRepository.getDay(planId, weekId, dayId)
    }

    func getImage(_ name: String) -> UIImage {
        if name == "0 to 2K" {
            return images.getImage(.plan1)
        } else if name == "0 to 5K" {
            return images.getImage(.plan2)
        } else if name == "5K to 10K" {
            return images.getImage(.plan3)
        } else if name == "Weight Loss: Level 1" {
            return images.getImage(.plan4)
        } else if name == "Weight Loss: Level 2" {
            return images.getImage(.plan5)
        } else {
            return images.getImage(.plan6)
        }
    }

    func getGif(_ gif: Gifs) -> Data {
        images.getGif(gif)
    }
}
