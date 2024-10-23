//
//  YoutubeVideo.swift
//  NetflixClone
//
//  Created by Jessy Viranaiken on 23/10/2024.
//

import Foundation

struct VideoResponse: Codable {
  let results: [Video]
}

struct Video: Codable {
  let key: String
  let site: String
  let type: String
}
