//
//  AudioPlayer.swift
//  FoundationAudio
//
//  Created by Nikola Grujic on 10/02/2023.
//

import AVFoundation
import FoundationLogger

final class AudioPlayer: AudioPlayerProtocol, LoggerInjected {
    private var audioPlayer: AVAudioPlayer?
    private let fileType: String = "caf"

    // MARK: - AudioPlayerProtocol

    func play(_ sound: SoundsEnum) {
        do {
            try playSound(sound)
        } catch {
            logger.handleError(error)
        }
    }

    func playSound(_ sound: SoundsEnum) throws {
        guard let path: String = Bundle.module.path(forResource: sound.rawValue, ofType: fileType) else {
            throw AudioError(.soundNotFound, ErrorLine())
        }

        let fileURL = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            throw AudioError(.failedToLoadSound, ErrorLine())
        }

        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
}
