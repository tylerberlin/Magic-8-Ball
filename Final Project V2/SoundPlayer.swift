//
//  SoundPlayer.swift
//  Final Project V2
//
//  Created by Tyler Berlin on 11/26/24.
//

import Foundation
// Import AVFoundation allows the device to be able to handle playing audio.
import AVFoundation
//the private audioPlayer variable is used by the class to manage sound playback. The playSound method takes the name of a file and the file type which is mp3. It checks if the file exists, and if so the audio player plays the sound.
class Sounds {
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(named fileName: String, fileType: String = "mp3") {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileType) {
            audioPlayer = try? AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        }
    }
}
