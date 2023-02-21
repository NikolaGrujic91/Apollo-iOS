//
//  PlanImageManager.swift
//  ApolloImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

final class PlanImageManager: PlanImageProtocol {
    // MARK: - Properties
    private let imagePlan1 = loadImage("1")
    private let imagePlan2 = loadImage("2")
    private let imagePlan3 = loadImage("3")
    private let imagePlan4 = loadImage("4")
    private let imagePlan5 = loadImage("5")
    private let imagePlan6 = loadImage("6")
    private let imageEmpty = UIImage()

    // MARK: - PlanImageProtocol
    func getImage(_ planImage: PlanImage) -> UIImage {
        switch planImage {
        case .plan1:
            return imagePlan1 ?? imageEmpty
        case .plan2:
            return imagePlan2 ?? imageEmpty
        case .plan3:
            return imagePlan3 ?? imageEmpty
        case .plan4:
            return imagePlan4 ?? imageEmpty
        case .plan5:
            return imagePlan5 ?? imageEmpty
        case .plan6:
            return imagePlan6 ?? imageEmpty
        }
    }

    // MARK: - Functions
    private static func loadImage(_ name: String) -> UIImage? {
        if let path = Bundle.module.path(forResource: name, ofType: "png") {
            return UIImage(contentsOfFile: path)
        }

        return nil
    }
}
