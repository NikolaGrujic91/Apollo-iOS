//
//  AudioPlayerInjected.swift
//
//
//  Created by Nikola Grujic on 10/02/2023.
//

enum AudioPlayerInjectionMap {
    static var player: AudioPlayerProtocol = AudioPlayer()
}

public protocol AudioPlayerInjected: AnyObject {}

public extension AudioPlayerInjected {
    var player: AudioPlayerProtocol {
        AudioPlayerInjectionMap.player
    }
}
