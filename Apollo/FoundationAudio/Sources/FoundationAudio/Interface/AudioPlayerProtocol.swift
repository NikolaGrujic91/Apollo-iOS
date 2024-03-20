//
//  AudioPlayerProtocol.swift
//
//
//  Created by Nikola Grujic on 10/02/2023.
//

@MainActor
public protocol AudioPlayerProtocol: AnyObject {
    func play(_ sound: SoundsEnum)
}
