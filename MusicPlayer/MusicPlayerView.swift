//
//  MusicPlayerView.swift
//  MusicPlayer
//
//  Created by Sambit Das on 26/10/23.
//

import SwiftUI

struct MusicPlayerView: View {

  @StateObject var viewModel: MusicPlayerViewModel = MusicPlayerViewModel()
  @State var isPlaying: Bool = false
  @State var silder: Double = 0.0
  @State var currentAudio: Int = 0

  var body: some View {
    VStack(alignment: .center, spacing: 40) {

      if viewModel.isDataAvailbale {
        VStack(alignment: .center, spacing: 8) {
          Text("Title: \(viewModel.musicList[currentAudio].title)")
            .font(.title)

          Text("Artist: \(viewModel.musicList[currentAudio].artist)")
            .font(.headline)

          Text("Album: \(viewModel.musicList[currentAudio].album)")
            .font(.headline)
        }

        ZStack {
          Circle()
            .foregroundColor(.gray)
            .frame(width: 150, height: 150)

          Image(systemName: "music.quarternote.3")
            .resizable()
            .frame(width: 60, height: 60)
        }

        Button {
          AudioPlayer.shared.playerSetUp(url: URL(string: viewModel.musicList[currentAudio].url)!)
          AudioPlayer.shared.startAudio()
        } label: {
          Image(systemName: isPlaying ? "pause" : "play")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(.blue)
        }
      }
    }
    .padding()
    .onAppear {
      viewModel.loadData()
    }
  }
}

#Preview {
    MusicPlayerView()
}
