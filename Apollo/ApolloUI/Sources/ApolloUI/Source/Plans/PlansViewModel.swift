//
//  PlansViewModel.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 21/02/2023.
//

import ApolloData
import ApolloImages
import SwiftUI

final class PlansViewModel: ObservableObject, PlansRepositoryInjected, PlanImageInjected {
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
            return planImage.getImage(.plan1)
        } else if name == "0 to 5K" {
            return planImage.getImage(.plan2)
        } else if name == "5K to 10K" {
            return planImage.getImage(.plan3)
        } else if name == "Weight Loss: Level 1" {
            return planImage.getImage(.plan4)
        } else if name == "Weight Loss: Level 2" {
            return planImage.getImage(.plan5)
        } else {
            return planImage.getImage(.plan6)
        }
    }

    func getGif(_ gif: Gifs) -> Data {
        planImage.getGif(gif)
    }
}
