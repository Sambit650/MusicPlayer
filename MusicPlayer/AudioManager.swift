//
//  AudioManager.swift
//  MusicPlayer
//
//  Created by Sambit Das on 26/10/23.
//

import Combine
import Foundation
import AVFoundation

final class AudioManager {

  // MARK: - Properties

  static let shared = AudioManager()

  var player: AVPlayer?
  private var session = AVAudioSession.sharedInstance()
  private var cancellable: AnyCancellable?

  private init() {}

  deinit {
    cancellable?.cancel()
  }

  private func activateSession() {
    do {
      try session.setCategory(.playback, mode: .default, options: [])
    } catch _ {}

    do {
      try session.setActive(true, options: [])
    } catch _ {}

    do {
      try session.overrideOutputAudioPort(.speaker)
    } catch _ {}
  }

  private func deactivateSession() {
    do {
      try session.setActive(false, options: .notifyOthersOnDeactivation)
    } catch let error as NSError {
      print("Failed to deactivate audio session: \(error.localizedDescription)")
    }
  }

  func playerSetUp(url: URL) {

    // activate session before palying audio
    activateSession()

    let playerItem: AVPlayerItem = AVPlayerItem(url: url)

    if let player = player {
      player.replaceCurrentItem(with: playerItem)
    } else {
      player = AVPlayer(playerItem: playerItem)
    }

    cancellable = NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
      .sink { [weak self] _ in
        guard let self = self else { return }

        self.deactivateSession()
      }
  }

  func play() {
    if let player = player {
      player.play()
    }
  }

  func pause() {
    if let player = player {
      player.pause()
    }
  }

  func rewindSong(by seconds: Double) {
    player?.seek(to: CMTime(seconds: seconds, preferredTimescale: 1000))
  }

  func getPlaybackDuration() -> Double {
    guard let player = player else {
      return 0
    }
    return player.currentItem?.duration.seconds ?? 0
  }

  func getTotalAssetDuration() -> Double {
    guard let player = player else {
      return 0
    }
    return player.currentItem?.asset.duration.seconds ?? 0
  }
}
