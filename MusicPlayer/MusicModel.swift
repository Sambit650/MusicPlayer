//
//  MusicModel.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import SwiftUI

struct MusicModel {
  let name: String
  let artistName: String
  let coverImage: Image
  let url: String
}

struct MusicData {

  static let music = "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"

  static let MADE_FOR_YOU = MusicModel(name: "Bad Liar", artistName: "Anna Hamilton", coverImage: Image.cover3, url: music)

  static func getPlaylists() -> [MusicModel] {
    return [
      MusicModel(name: "You & Me", artistName: "Imagine Dragons", coverImage: Image.cover5, url: music),
      MusicModel(name: "Heart Beats", artistName: "The Chainsmokers", coverImage: Image.cover1, url: music),
      MusicModel(name: "Young Love", artistName: "Selena Gomez", coverImage: Image.cover2, url: music),
      MusicModel(name: "Falling", artistName: "Harry Styles", coverImage: Image.cover4, url: music),
      MusicModel(name: "Bad Liar", artistName: "Anna Hamilton", coverImage: Image.cover3, url: music)
    ]
  }

  static func getRecentlyPlayed() -> [MusicModel] {
    return [
      MusicModel(name: "Falling", artistName: "Harry Styles", coverImage: Image.cover4, url: music),
      MusicModel(name: "Bad Liar", artistName: "Anna Hamilton", coverImage: Image.cover3, url: music),
      MusicModel(name: "Young Love", artistName: "Selena Gomez", coverImage: Image.cover2, url: music),
      MusicModel(name: "You & Me", artistName: "Imagine Dragons", coverImage: Image.cover5, url: music),
      MusicModel(name: "Heart Beats", artistName: "The Chainsmokers", coverImage: Image.cover1, url: music)
    ]
  }
}
