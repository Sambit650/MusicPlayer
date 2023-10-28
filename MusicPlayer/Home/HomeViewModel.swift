//
//  HomeViewModel.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {

  // MARK: - Properties and Init.

  private enum Constansts {
    static let madeForYou = "Made for You"
    static let recentlyPlayed = "Recently Played"
    static let yourPlaylist = "Your Playlist"
    static let headerTitle = "Hello Sambit 👋🏻"
  }

  @Published private(set) var playlists = [MusicModel]()
  @Published private(set) var recentlyPlayed = [MusicModel]()
  @Published private(set) var selectedMusic: MusicModel? = nil
  @Published var displayPlayer = false

  init() {
    fetchPlaylist()
    fetchRecentlyPlayed()
  }

  var madeForYouText: String {
    Constansts.madeForYou
  }

  var recentlyPlayedText: String {
    Constansts.recentlyPlayed
  }

  var yourPlaylistText: String {
    Constansts.yourPlaylist
  }

  var headerTitle: String {
    Constansts.headerTitle
  }

  // MARK: - Methods

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
