//
//  NeuShadow.swift
//  MusicPlayer
//
//  Created by Sambit Das on 28/10/23.
//

import SwiftUI

struct NeuShadow: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: Color("neuColor1"), radius: 1, x: -7, y: -7)
      .shadow(color: Color("neuColor2"), radius: 4, x: -13, y: -7)
      .shadow(color: Color("neuColor3"), radius: 10, x: -8, y: 5)
      .shadow(color: Color("neuColor4"), radius: 10, x: 10, y: 9)
  }
}

