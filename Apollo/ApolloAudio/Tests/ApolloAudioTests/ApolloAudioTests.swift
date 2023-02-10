import XCTest
@testable import ApolloAudio

final class ApolloAudioTests: XCTestCase, AudioPlayerInjected {
    func testAudioPlayer() throws {
        XCTAssertNoThrow(try player.play(.complete))
        XCTAssertNoThrow(try player.play(.countdown))
    }
}
