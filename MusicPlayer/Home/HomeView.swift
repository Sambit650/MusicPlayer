//
//  HomeView.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import SwiftUI

fileprivate let HORIZONTAL_SPACING: CGFloat = 24

struct HomeView: View {

  @StateObject private var viewModel = HomeViewModel()

  var body: some View {
    ZStack {
      Color.primary_color
        .edgesIgnoringSafeArea(.all)

      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading, spacing: 0) {
          // Header
          HomeHeaderView(headerStr: viewModel.headerTitle)
          // Playlists
          HomePlaylistView(title: viewModel.yourPlaylistText,
                           playlists: viewModel.playlists,
                           onSelect: viewModel.selectMusic(music:))
          // Recently Played
          HomeRecentlyPlayedView(title: viewModel.recentlyPlayedText,
                                 recentlyPlayed: viewModel.recentlyPlayed,
                                 onSelect: viewModel.selectMusic(music:))
          // Made for You
          HomeMadeForView(title: viewModel.madeForYouText,
                          onSelect: viewModel.selectMusic(music:))

          Spacer()
            .frame(height: 150)
          Spacer()
        }
        .fullScreenCover(isPresented: $viewModel.displayPlayer) {
          if let model = viewModel.selectedMusic {
            PlayerView(viewModel: PlayerViewModel(musicModel: model))
          }
        }
      }
      .animation(.spring())
      .edgesIgnoringSafeArea([.horizontal, .bottom])
    }
  }
}

fileprivate struct HomeHeaderView: View {
  let headerStr: String
  var body: some View {
    HStack(alignment: .center) {
      Text(headerStr)
        .foregroundColor(.text_header)
        .modifier(FontModifier(.black, size: 28))
      Spacer()
      Button(action: {
        //TODO
      }) {
        Image.search
          .resizable()
          .frame(width: 16, height: 16)
          .padding(12).background(Color.primary_color)
          .cornerRadius(20).modifier(NeuShadow())
      }
    }.padding(.top, 12)
      .padding(.horizontal, HORIZONTAL_SPACING)
  }
}

fileprivate struct HomePlaylistView: View {
  let title: String, playlists: [MusicModel], onSelect: (MusicModel) -> ()
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(title)
        .foregroundColor(.text_header)
        .modifier(FontModifier(.bold, size: 20))
        .padding(.leading, HORIZONTAL_SPACING)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(0..<playlists.count, id: \.self) { i in
            Button(action: { onSelect(playlists[i]) }, label: {
              PlaylistView(name: playlists[i].name,
                           artistName: playlists[i].artistName,
                           coverImage: playlists[i].coverImage)
            }).padding(.top, 6)
              .padding(.bottom, 40)
          }
        }.padding(.horizontal, HORIZONTAL_SPACING)
      }
    }.padding(.top, 36)
  }
}

fileprivate struct HomeRecentlyPlayedView: View {
  let title: String, recentlyPlayed: [MusicModel], onSelect: (MusicModel) -> ()
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(title)
        .foregroundColor(.text_header)
        .modifier(FontModifier(.bold, size: 20))
        .padding(.leading, HORIZONTAL_SPACING)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(0..<recentlyPlayed.count, id: \.self) { i in
            Button(action: { onSelect(recentlyPlayed[i]) }, label: {
              MusicDiscView(name: recentlyPlayed[i].name,
                            artistName: recentlyPlayed[i].artistName,
                            coverImage: recentlyPlayed[i].coverImage)
            }).padding(.top, 6)
              .padding(.bottom, 40)
          }
        }.padding(.horizontal, HORIZONTAL_SPACING)
      }
    }
  }
}

fileprivate struct HomeMadeForView: View {
  let title: String, onSelect: (MusicModel) -> ()
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(title)
        .foregroundColor(.text_header)
        .modifier(FontModifier(.bold, size: 20))
        .padding(.leading, HORIZONTAL_SPACING)
      Button(action: { onSelect(MusicData.MADE_FOR_YOU) }, label: {
        MadeForView()
      }).padding([.horizontal, .top], HORIZONTAL_SPACING)
        .padding(.bottom, 40)
    }
  }
}
