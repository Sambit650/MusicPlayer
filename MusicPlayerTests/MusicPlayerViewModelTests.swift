//
//  MusicPlayerViewModelTests.swift
//  MusicPlayerTests
//
//  Created by Sambit Das on 26/10/23.
//

import XCTest
@testable import MusicPlayer

final class MusicPlayerViewModelTests: XCTestCase {

  var sut: MusicPlayerViewModel!

  override func setUp() {
    super.setUp()

    sut = MusicPlayerViewModel()
  }

  override func tearDown() {
    sut = nil

    super.tearDown()
  }

  func testMusicURLString() {
    XCTAssertEqual(sut.musicURLString, "https://www.jsonkeeper.com/b/C47J")
  }

  func testCheckDataAvaility_emptyList() {
    sut.musicList = []

    XCTAssertFalse(sut.isDataAvailbale)
  }

  func testCheckDataAvaility_withData() {
    sut.musicList = []
    let data = MusicData(title: "test1", artist: "test2", album: "test3", url: "test4")
    sut.musicList.append(data)

    XCTAssertTrue(sut.isDataAvailbale)
  }

}
