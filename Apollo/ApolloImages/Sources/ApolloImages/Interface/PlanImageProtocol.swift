//
//  PlanImageProtocol.swift
//  ApolloImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

public protocol PlanImageProtocol {
    func getImage(_ planImage: PlanImage, _ colorScheme: ColorScheme) -> UIImage
}
