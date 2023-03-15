@testable import FoundationAudio
import XCTest

final class FoundationAudioTests: XCTestCase, AudioPlayerInjected {
    func testAudioPlayer() throws {
        let audioPlayer = AudioPlayer()

        XCTAssertNoThrow(try audioPlayer.playSound(.complete))
        XCTAssertNoThrow(try audioPlayer.playSound(.countdown))
    }

    func testAudioPlayerInjected() {
        XCTAssertNotNil(player)

        XCTAssertNoThrow(player.play(.complete))
        XCTAssertNoThrow(player.play(.countdown))
    }
}
