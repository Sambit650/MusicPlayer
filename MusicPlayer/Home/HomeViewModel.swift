//
//  HomeViewModel.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {

  @Published private(set) var headerStr = "Hello Sambit 👋🏻"
  @Published private(set) var playlists = [MusicModel]()
  @Published private(set) var recentlyPlayed = [MusicModel]()

  @Published private(set) var selectedMusic: MusicModel? = nil
  @Published var displayPlayer = false

  init() {
    fetchPlaylist()
    fetchRecentlyPlayed()
  }

  private func fetchPlaylist() {
    playlists = MusicData.getPlaylists()
  }

  private func fetchRecentlyPlayed() {
    recentlyPlayed = MusicData.getRecentlyPlayed()
  }

  func selectMusic(music: MusicModel) {
    selectedMusic = music
    displayPlayer = true
  }
}
