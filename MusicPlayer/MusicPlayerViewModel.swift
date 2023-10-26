//
//  MusicPlayerViewModel.swift
//  MusicPlayer
//
//  Created by Sambit Das on 26/10/23.
//

import Foundation

class MusicPlayerViewModel: ObservableObject {

  private let apiHandler: APIHandler

  init(apiHandler: APIHandler = .shared) {
    self.apiHandler = apiHandler
  }

  @Published var musicList: [MusicData] = []
  @Published var isDataAvailbale: Bool = false

  var musicURLString: String {
    "https://www.jsonkeeper.com/b/C47J"
  }

  func checkDataAvaility() {
    DispatchQueue.main.async {
      self.isDataAvailbale = self.musicList.isEmpty ? false : true
    }
  }

  func loadData() {
    apiHandler.getMusicDetails(url: musicURLString) { result in
      switch result {
      case .success(let data):
        DispatchQueue.main.async {
          self.musicList = data
          self.checkDataAvaility()
        }
      case .failure(let error):
        // TODO
        print(error.localizedDescription)
      }
    }
  }

}
