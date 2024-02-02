//
//  PlayingSingleSound.swift
//  Sesi6FirstAPI
//
//  Created by Hidayat Abisena on 28/01/24.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSingleSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Could not find and play the sound file.")
    }
  }
}
