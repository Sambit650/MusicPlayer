//
//  HomeViewModelTests.swift
//  MusicPlayerTests
//
//  Created by Sambit Das on 26/10/23.
//

import XCTest
@testable import MusicPlayer

final class HomeViewModelTests: XCTestCase {

  var sut: HomeViewModel!

  override func setUp() {
    super.setUp()

    sut = HomeViewModel()
  }

  override func tearDown() {
    sut = nil

    super.tearDown()
  }

  func testMadeForYouText() {
    XCTAssertEqual(sut.madeForYouText, "Made for You")
  }

  func testRecentlyPlayedText() {
    XCTAssertEqual(sut.recentlyPlayedText, "Recently Played")
  }

  func testYourPlaylistText() {
    XCTAssertEqual(sut.yourPlaylistText, "Your Playlist")
  }

  func testHeaderTitle() {
    XCTAssertEqual(sut.headerTitle, "Hello Sambit 👋🏻")
  }
}
