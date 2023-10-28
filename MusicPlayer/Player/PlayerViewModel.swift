//
//  PlayerViewModel.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import Foundation

class PlayerViewModel: ObservableObject {

  let musicModel: MusicModel
  let audioManager: AudioManager

  @Published var liked = false
  @Published var slider: Double = 0.0
  @Published var isPlaying = false

  init(musicModel: MusicModel, audioManager: AudioManager = .shared) {
    self.musicModel = musicModel
    self.audioManager = audioManager
  }

  func play() {
    audioManager.play()
  }

  func pause() {
    audioManager.pause()
  }

  func playerSetUp(url: URL) {
    audioManager.playerSetUp(url: url)
  }

  func rewindSong(by seconds: Double) {
    audioManager.rewindSong(by: seconds)
  }

  func getPlaybackDuration() -> Double {
    audioManager.getPlaybackDuration()
  }

  func getTotalAssetDuration() -> Double {
    audioManager.getTotalAssetDuration()
  }
}
