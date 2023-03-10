@testable import ApolloAudio
import XCTest

final class ApolloAudioTests: XCTestCase, AudioPlayerInjected {
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
