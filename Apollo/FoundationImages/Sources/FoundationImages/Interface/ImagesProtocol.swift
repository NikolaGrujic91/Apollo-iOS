//
//  PlanImageProtocol.swift
//  FoundationImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

import UIKit

public protocol ImagesProtocol: AnyObject {
    func getImage(_ planImage: PlanImage) -> UIImage

    func getGif(_ gif: Gifs) -> Data
}
