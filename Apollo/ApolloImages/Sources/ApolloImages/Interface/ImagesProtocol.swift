//
//  PlanImageProtocol.swift
//  ApolloImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

public protocol ImagesProtocol: AnyObject {
    func getImage(_ planImage: PlanImage) -> UIImage

    func getGif(_ gif: Gifs) -> Data
}
