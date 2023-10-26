//
//  AudioPlayer.swift
//  MusicPlayer
//
//  Created by Sambit Das on 26/10/23.
//

import Foundation
import AVFoundation

class AudioPlayer {

  // MARK: - Properties

  static let shared = AudioPlayer()

  var player: AVPlayer?

  func startAudio() {
    guard let player = player  else {
      return
    }
    player.play()
  }

  func pauseAudio() {
    guard let player = player  else {
      return
    }
    player.pause()
  }

  func playerSetUp(url: URL) {

    let playerItem: AVPlayerItem = AVPlayerItem(url: url)

    if player != nil {
      player = AVPlayer(playerItem: playerItem)
    } else {
      player = nil
    }

  }

}
