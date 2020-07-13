//
//  AudioController.swift
//  Apollo
//
//  Created by Nikola Grujic on 10/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import Foundation
import AVFoundation

class AudioController
{
    var audioPlayer: AVAudioPlayer = AVAudioPlayer();
    
    private func playFile(filePath: String) -> Void
    {
        let fileURL: URL = URL(fileURLWithPath: filePath)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            audioPlayer.prepareToPlay();
        }
        catch
        {
            print("\(error)");
            return;
        }
        
        audioPlayer.play();
    }
    
    internal func playCountdownSound() -> Void
    {
        if let path: String = Bundle.main.path(forResource: "WorkoutCountdown_Haptic", ofType: "caf")
        {
            self.playFile(filePath: path);
        }
    }
    
    internal func playCompleteSound() -> Void
    {
        if let path: String = Bundle.main.path(forResource: "WorkoutComplete_Haptic", ofType: "caf")
        {
            self.playFile(filePath: path);
        }
    }
}
