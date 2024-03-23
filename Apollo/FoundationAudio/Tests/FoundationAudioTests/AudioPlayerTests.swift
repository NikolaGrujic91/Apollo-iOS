//
//  AudioPlayerTests.swift
//
//
//  Created by Nikola Grujic on 23/03/2024.
//

@testable import FoundationAudio
import XCTest

final class AudioPlayerTests: XCTestCase, AudioPlayerInjected {
    @MainActor
    func testPlaySoundComplete() {
        XCTAssertNotNil(player)

        XCTAssertNoThrow(player.play(.complete))
    }

    @MainActor
    func testPlaySoundCountdown() {
        XCTAssertNotNil(player)
        XCTAssertNoThrow(player.play(.countdown))
    }
}
