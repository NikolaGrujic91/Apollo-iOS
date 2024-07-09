//
//  PlansViewModel.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 21/02/2023.
//

import FoundationImages
import Observation
import UIKit

@Observable
@MainActor
public final class PlansViewModel: PlansServiceInjected, ImagesInjected {
    // MARK: - Properties

    private(set) var plans: [Plan] = []

    // MARK: - Initializers

    public init() {}

    // MARK: - Functions

    func update() {
        plans = service.plans
    }

    func load() async {
        await service.load()
    }

    func reset() {
        service.reset()
    }

    func get(_ id: UUID) -> Plan {
        service.get(id)
    }

    func getDay(_ planId: UUID, _ weekId: UUID, _ dayId: UUID) -> Day {
        service.getDay(planId, weekId, dayId)
    }

    func getImage(_ name: PlanType) -> UIImage {
        if name == .basic0to2K {
            images.getImage(.plan1)
        } else if name == .basic0to5K {
            images.getImage(.plan2)
        } else if name == .basic5Kto10K {
            images.getImage(.plan3)
        } else if name == .weightLossLevel1 {
            images.getImage(.plan4)
            } else if name == .weightLossLevel2 {
            images.getImage(.plan5)
        } else {
            images.getImage(.plan6)
        }
    }

    func getGif(_ gif: Gifs) -> Data {
        images.getGif(gif)
    }
}
