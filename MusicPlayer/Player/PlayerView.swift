//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import SwiftUI

fileprivate let HORIZONTAL_SPACING: CGFloat = 24

struct PlayerView: View {

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @StateObject var viewModel: PlayerViewModel

  var body: some View {
    ZStack {
      Color.primary_color
        .edgesIgnoringSafeArea(.all)

      VStack(alignment: .center, spacing: 0) {
        HStack(alignment: .center) {
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            Image.close
              .resizable()
              .frame(width: 20, height: 20)
              .padding(8)
              .background(Color.primary_color)
              .cornerRadius(20)
              .modifier(NeuShadow())
          }
          Spacer()
          Button(action: {
            // TODO
          }) {
            Image.options
              .resizable()
              .frame(width: 16, height: 16)
              .padding(12)
              .background(Color.primary_color)
              .cornerRadius(20)
              .modifier(NeuShadow())
          }
        }
        .padding(.horizontal, HORIZONTAL_SPACING)
        .padding(.top, 12)

        PlayerDiscView(coverImage: viewModel.musicModel.coverImage)

        Text(viewModel.musicModel.name)
          .foregroundColor(.text_primary)
          .modifier(FontModifier(.black, size: 30))
          .padding(.top, 12)
        Text(viewModel.musicModel.artistName)
          .foregroundColor(.text_primary_f1)
          .modifier(FontModifier(.semibold, size: 18))
          .padding(.top, 12)

        Spacer()

        HStack(alignment: .center, spacing: 12) {
          Text("01:34")
            .foregroundColor(.text_primary)
            .modifier(FontModifier(.bold, size: 12))
          Slider(value: $viewModel.slider, in: 0...100, onEditingChanged: { _ in
            viewModel.rewindSong(by: viewModel.slider)
          })
            .accentColor(.main_white)
          
          Button(action: {
            viewModel.liked.toggle()
          }) {
            (viewModel.liked ? Image.heart_filled : Image.heart)
              .resizable()
              .frame(width: 20, height: 20)
          }
        }.padding(.horizontal, 45)

        Spacer()

        HStack(alignment: .center) {
          Button(action: {
            // TODO : prev
          }) {
            Image.next
              .resizable()
              .frame(width: 18, height: 18)
              .rotationEffect(Angle(degrees: 180))
              .padding(24)
              .background(Color.primary_color)
              .cornerRadius(40)
              .modifier(NeuShadow())
          }
          Spacer()
          Button(action: {
            if viewModel.isPlaying {
              viewModel.isPlaying = false
              viewModel.pause()
            } else {
              viewModel.isPlaying = true
              viewModel.play()
            }
          }) {
            (viewModel.isPlaying ? Image.pause : Image.play)
              .resizable()
              .frame(width: 28, height: 28)
              .padding(50)
              .background(Color.main_color)
              .cornerRadius(70)
              .modifier(NeuShadow())
          }
          Spacer()
          Button(action: {
            // TODO : next
          }) {
            Image.next
              .resizable()
              .frame(width: 18, height: 18)
              .padding(24)
              .background(Color.primary_color)
              .cornerRadius(40)
              .modifier(NeuShadow())
          }
        }.padding(.horizontal, 32)
      }
      .padding(.bottom, HORIZONTAL_SPACING)
      .animation(.spring())
    }
    .onAppear {
      // TODO: for api response.
      guard let musicURL = URL(string: viewModel.musicModel.url) else {
        return
      }
      viewModel.playerSetUp(url: musicURL)
    }
  }
}

fileprivate struct PlayerDiscView: View {
  let coverImage: Image
  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(.primary_color)
        .frame(width: 300, height: 300)
        .modifier(NeuShadow())
      ForEach(0..<15, id: \.self) { i in
        RoundedRectangle(cornerRadius: (150 + CGFloat((8 * i))) / 2)
          .stroke(lineWidth: 0.25)
          .foregroundColor(.disc_line)
          .frame(width: 150 + CGFloat((8 * i)),
                 height: 150 + CGFloat((8 * i)))
      }
      coverImage
        .resizable()
        .scaledToFill()
        .frame(width: 120, height: 120)
        .cornerRadius(60)
    }
  }
}
