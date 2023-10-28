//
//  APIHandler.swift
//  MusicPlayer
//
//  Created by Sambit Das on 26/10/23.
//

import Foundation

//enum MusicError: Error {
//  case invalidURL
//  case decodeError
//  case invalidResponse
//  case invalidData
//}
//
//class APIHandler {
//
//  static let shared = APIHandler()
//
//  func getMusicDetails(url: String, completion: @escaping ((Result<[MusicData], MusicError>) -> Void)) {
//
//    guard let url = URL(string: url) else {
//      completion(.failure(.invalidURL))
//      return
//    }
//
//    URLSession.shared.dataTask(with: url) { data, response, error in
//
//      guard let response = response else {
//        completion(.failure(.invalidResponse))
//        return
//      }
//
//      guard error == nil else {
//        completion(.failure(.invalidResponse))
//        return
//      }
//
//      guard let data = data else {
//        completion(.failure(.invalidData))
//        return
//      }
//
//      let decoder = JSONDecoder()
//
////      do {
////        let musicDataArray = try decoder.decode([MusicData].self, from: data)
////        completion(.success(musicDataArray))
////      } catch {
////        completion(.failure(.decodeError))
////        return
////      }
//
//    }.resume()
//
//  }
//
//}
