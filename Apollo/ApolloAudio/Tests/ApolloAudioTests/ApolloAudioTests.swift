import XCTest
@testable import ApolloAudio

final class ApolloAudioTests: XCTestCase, AudioPlayerInjected {
    func testAudioPlayer() throws {
        let audioPlayer = AudioPlayer()

        XCTAssertNoThrow(try audioPlayer.playSound(.complete))
        XCTAssertNoThrow(try audioPlayer.playSound(.countdown))
    }
}
